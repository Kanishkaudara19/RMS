package com.kanishka.rms.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.kanishka.rms.entity.Contact;

public interface ContactRepository extends JpaRepository<Contact, Long> {
}
