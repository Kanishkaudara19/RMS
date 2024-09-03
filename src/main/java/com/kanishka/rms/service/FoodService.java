package com.kanishka.rms.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanishka.rms.dto.FoodDTO;
import com.kanishka.rms.entity.Food;
import com.kanishka.rms.exception.FoodNotFoundException;
import com.kanishka.rms.repo.FoodRepository;

@Service
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

    public List<FoodDTO> findAll(boolean onlyAvailable) {
        List<FoodDTO> foodDTOList = new ArrayList<>();

        for(Food food : foodRepository.findAll()) {
            if(onlyAvailable && food.getAvailable() == 0) {
                continue;
            }
            FoodDTO foodDTO = new FoodDTO();
            foodDTO.setId(food.getId());
            foodDTO.setName(food.getName());
            foodDTO.setPrice(food.getPrice());
            foodDTO.setAvailable(food.getAvailable());
            foodDTO.setThumbnailUrl(food.getThumbnailUrl());

            foodDTOList.add(foodDTO);
        }
        return foodDTOList;
    }

    public void update(long foodId, int available) throws FoodNotFoundException {
        Optional<Food> optionalFood = foodRepository.findById(foodId);

        if(optionalFood.isEmpty()) {
            throw new FoodNotFoundException("Food is not found");
        }

        Food food = optionalFood.get();
        food.setAvailable(available);

        foodRepository.save(food);
    }
}
