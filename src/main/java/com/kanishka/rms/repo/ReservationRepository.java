package com.kanishka.rms.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.kanishka.rms.entity.Reservation;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {
}
