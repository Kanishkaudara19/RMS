package com.kanishka.rms.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.kanishka.rms.entity.OrderFood;

public interface OrderFoodRepository extends JpaRepository<OrderFood, Long> {
}
