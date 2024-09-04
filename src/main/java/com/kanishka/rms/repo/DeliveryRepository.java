package com.kanishka.rms.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.kanishka.rms.entity.Delivery;
import com.kanishka.rms.entity.Order;

public interface DeliveryRepository extends JpaRepository<Delivery, Long> {
    Optional<Delivery> findDeliveryByOrder(Order order);
}
