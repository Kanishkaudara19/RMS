package com.kanishka.rms.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.kanishka.rms.entity.Order;

public interface OrderRepository extends JpaRepository<Order, Long> {
    Optional<Order> findByOrderId(String orderId);
}
