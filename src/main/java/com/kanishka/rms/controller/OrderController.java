package com.kanishka.rms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kanishka.rms.dto.OrderDTO;
import com.kanishka.rms.service.OrderService;

@RestController
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/insert")
    public ResponseEntity<String> insertOrder(@RequestBody OrderDTO orderDTO) {
        ResponseEntity<String> response;

        try {
            orderService.insert(orderDTO);

            response = ResponseEntity.ok("Successfully added the order!");
        } catch (Exception ex) {
            response = ResponseEntity.badRequest().body("Something went wrong! Please try again later.");
        }

        return response;
    }
}
