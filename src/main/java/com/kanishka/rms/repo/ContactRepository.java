package com.kanishka.rms.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.kanishka.rms.entity.Contact;
import com.kanishka.rms.entity.User;

public interface ContactRepository extends JpaRepository<Contact, Long> {
    Optional<Contact> findByCustomer(User user);
}
