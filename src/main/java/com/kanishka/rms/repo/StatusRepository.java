package com.kanishka.rms.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.kanishka.rms.entity.Status;

public interface StatusRepository extends JpaRepository<Status, Long> {
    Optional<Status> findStatusByName(String name);
}
