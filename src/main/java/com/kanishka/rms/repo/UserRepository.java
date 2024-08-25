package com.kanishka.rms.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.kanishka.rms.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByUsername(String username);
}
