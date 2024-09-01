package com.kanishka.rms.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.kanishka.rms.entity.OrderFood;

public interface OrdeFoodRepository extends JpaRepository<OrderFood, Long> {
}
