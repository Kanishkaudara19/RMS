package com.kanishka.rms.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.kanishka.rms.entity.Delivery;

public interface DeliveryRepository extends JpaRepository<Delivery, Long> {
}
