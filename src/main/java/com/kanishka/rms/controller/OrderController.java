package com.kanishka.rms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kanishka.rms.dto.OrderDTO;
import com.kanishka.rms.entity.User;
import com.kanishka.rms.exception.UserNotFoundException;
import com.kanishka.rms.service.OrderService;
import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
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
}
