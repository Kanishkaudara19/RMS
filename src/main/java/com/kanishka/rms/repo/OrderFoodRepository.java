package com.kanishka.rms.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.kanishka.rms.entity.Order;
import com.kanishka.rms.entity.OrderFood;

public interface OrderFoodRepository extends JpaRepository<OrderFood, Long> {
    List<OrderFood> findAllByOrder(Order order);
}
