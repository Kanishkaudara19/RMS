package com.kanishka.rms.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.kanishka.rms.entity.Food;

public interface FoodRepository extends JpaRepository<Food, Long> {
}
