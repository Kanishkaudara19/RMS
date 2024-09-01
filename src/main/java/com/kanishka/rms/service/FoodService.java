package com.kanishka.rms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.kanishka.rms.dto.FoodDTO;
import com.kanishka.rms.entity.Food;
import com.kanishka.rms.repo.FoodRepository;

public class FoodService {
    @Autowired
    private final FoodRepository foodRepository;

    public FoodService(FoodRepository foodRepository) {
        this.foodRepository = foodRepository;
    }

    public void insert(FoodDTO foodDTO) {
        Food food = new Food();
        food.setName(foodDTO.getName());
        food.setPrice(foodDTO.getPrice());
        food.setAvailable(foodDTO.getAvailable());
        food.setThumbnailUrl(foodDTO.getThumbnailUrl());

        foodRepository.save(food);
    }

    public List<Food> findFoodById(List<Long> foodIdList) {
        return foodRepository.findAllById(foodIdList);
    }
}
