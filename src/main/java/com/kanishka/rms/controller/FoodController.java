package com.kanishka.rms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kanishka.rms.dto.FoodDTO;
import com.kanishka.rms.service.FoodService;

@RestController
@RequestMapping("/food")
public class FoodController {
    @Autowired
    private final FoodService foodService;

    public FoodController(FoodService foodService) {
        this.foodService = foodService;
    }

    @GetMapping("/insert")
    public ResponseEntity<String> insertFood(@RequestBody FoodDTO foodDTO) {
        try {
            foodService.insert(foodDTO);
            return ResponseEntity.ok("Food is added successfully!");
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Something went wrong! Please try again later.");
        }
    }
}
