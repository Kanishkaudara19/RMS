package com.kanishka.rms.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.kanishka.rms.entity.Invoice;

public interface InvoiceRepository extends JpaRepository<Invoice, Long> {
}
