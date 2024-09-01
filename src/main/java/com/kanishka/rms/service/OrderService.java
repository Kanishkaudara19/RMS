package com.kanishka.rms.service;

import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanishka.rms.dto.OrderDTO;
import com.kanishka.rms.entity.*;
import com.kanishka.rms.model.OrderType;
import com.kanishka.rms.model.PaymentMethod;
import com.kanishka.rms.model.QueuedStatus;
import com.kanishka.rms.repo.InvoiceRepository;
import com.kanishka.rms.repo.OrderFoodRepository;
import com.kanishka.rms.repo.OrderRepository;

@Service
public class OrderService {
    @Autowired
    private final OrderRepository orderRepository;
    @Autowired
    private final InvoiceRepository invoiceRepository;
    @Autowired
    private final OrderFoodRepository orderFoodRepository;
    @Autowired
    private final UserService userService;
    @Autowired
    private final FoodService foodService;
    @Autowired
    private final StatusService statusService;

    public OrderService(OrderRepository orderRepository,
                        InvoiceRepository invoiceRepository,
                        OrderFoodRepository orderFoodRepository,
                        UserService userService,
                        FoodService foodService,
                        StatusService statusService) {
        this.orderRepository = orderRepository;
        this.invoiceRepository = invoiceRepository;
        this.orderFoodRepository = orderFoodRepository;
        this.userService = userService;
        this.foodService = foodService;
        this.statusService = statusService;
    }

    public void insert(OrderDTO orderDTO) throws Exception {
        try {
            User customer = userService.findById(orderDTO.getUserId());
            OrderType orderType = OrderType.valueOf(orderDTO.getOrderType());
            String orderId = generateOrderId();
            Status status = statusService.findStatusByName(new QueuedStatus().getName());
            LocalDateTime dateTime = LocalDateTime.now();

            // Create Order object
            Order order = new Order();
            order.setOrderId(orderId);
            order.setCustomer(customer);
            order.setOrderType(orderType);
            order.setStatus(status);
            order.setDateTime(dateTime);

            Order savedOrder = orderRepository.save(order);

            // Insert invoice
            insertInvoice(savedOrder, orderDTO);

            // Insert order foods
            insertOrderFoods(savedOrder, orderDTO);
        } catch (Exception ex) {
            throw new Exception("Something went wrong! Please try again later.");
        }
    }

    private void insertInvoice(Order order, OrderDTO orderDTO) {
        List<Food> foodList = getFoodList(orderDTO.getFoodList());
        PaymentMethod paymentMethod = PaymentMethod.valueOf(orderDTO.getPaymentMethod());
        String branch = orderDTO.getBranch();

        // Get total price
        int totalPrice = foodList.stream().mapToInt(Food::getPrice).sum();

        // Create Invoice object
        Invoice invoice = new Invoice();
        invoice.setOrder(order);
        invoice.setPlace(branch);
        invoice.setPaymentMethod(paymentMethod);
        invoice.setTotalPrice(totalPrice);

        invoiceRepository.save(invoice);
    }

    private void insertOrderFoods(Order order, OrderDTO orderDTO) {
        Map<Long, Food> foodMap = getFoodList(orderDTO.getFoodList())
                .stream().collect(Collectors.toMap(Food::getId, food -> food));

        for(OrderDTO.OrderFoodDTO orderFoodDTO : orderDTO.getFoodList()) {
            OrderFood orderFood = new OrderFood();
            orderFood.setOrder(order);
            orderFood.setFood(foodMap.get(orderFoodDTO.getId()));
            orderFood.setQuantity(orderFoodDTO.getQty());

            orderFoodRepository.save(orderFood);
        }
    }

    private List<Food> getFoodList(List<OrderDTO.OrderFoodDTO> orderFoodDTOList) {
        List<Long> foodIdList = orderFoodDTOList.stream()
                .map(OrderDTO.OrderFoodDTO::getId)
                .toList();

        return foodService.findFoodById(foodIdList);
    }

    private String generateOrderId() {
        SecureRandom random = new SecureRandom();

        int randomNumber = 100000 + random.nextInt(900000);
        return String.valueOf(randomNumber);
    }
}
