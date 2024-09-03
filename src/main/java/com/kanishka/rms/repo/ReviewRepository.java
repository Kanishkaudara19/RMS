package com.kanishka.rms.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.kanishka.rms.entity.Review;

public interface ReviewRepository extends JpaRepository<Review, Long> {
}
