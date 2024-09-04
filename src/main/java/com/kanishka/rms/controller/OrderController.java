package com.kanishka.rms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kanishka.rms.dto.DetailedOrderDTO;
import com.kanishka.rms.dto.OrderDTO;
import com.kanishka.rms.entity.Order;
import com.kanishka.rms.entity.User;
import com.kanishka.rms.exception.UserNotFoundException;
import com.kanishka.rms.model.OrderType;
import com.kanishka.rms.service.DeliveryService;
import com.kanishka.rms.service.OrderService;
import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private final OrderService orderService;
    @Autowired
    private final DeliveryService deliveryService;

    public OrderController(OrderService orderService, DeliveryService deliveryService) {
        this.orderService = orderService;
        this.deliveryService = deliveryService;
    }

    @PostMapping("/insert")
    public ResponseEntity<String> insertOrder(@RequestBody OrderDTO orderDTO, HttpServletRequest request) {
        ResponseEntity<String> response;

        try {
            User user = (User) request.getSession().getAttribute("user");
            if(user == null) {
                throw new UserNotFoundException("User have not logged in.");
            }
            orderDTO.setUserId(user.getId());

            orderService.insert(orderDTO);

            response = ResponseEntity.ok("Successfully added the order!");
        } catch (Exception ex) {
            response = ResponseEntity.badRequest().body("Something went wrong! Please try again later.");
        }

        return response;
    }

    @GetMapping("/all")
    public ResponseEntity<List<DetailedOrderDTO>> getAllOrders() {
        try {
            List<DetailedOrderDTO> detailedOrderDTOList = orderService.getOrderList();
            return ResponseEntity.ok().body(detailedOrderDTOList);
        } catch (Exception ignored) {
            return ResponseEntity.badRequest().build();
        }
    }

    @GetMapping("/update")
    public ResponseEntity<String> updateStatus(@RequestParam("oid") String orderId,
                                               @RequestParam("status") String status,
                                               HttpServletRequest request) {
        ResponseEntity<String> response;
        User user = (User) request.getSession().getAttribute("user");

        if(user == null) {
            response = ResponseEntity.badRequest().body("User should be logged in");
        } else {
            try {
                Order order = orderService.updateStatus(orderId, status);

                if(order.getOrderType() == OrderType.DELIVERY && "Deliver".equals(status)) {
                    deliveryService.insertDeliveryUser(user, order);
                }

                response = ResponseEntity.ok().body("Order status updated successfully!");
            } catch (Exception ex) {
                response = ResponseEntity.badRequest().body("Something went wrong! Please try again later.");
            }
        }

        return response;
    }
}
