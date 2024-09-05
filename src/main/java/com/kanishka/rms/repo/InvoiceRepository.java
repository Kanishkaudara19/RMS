package com.kanishka.rms.repo;

import java.time.LocalDateTime;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.kanishka.rms.entity.Invoice;

public interface InvoiceRepository extends JpaRepository<Invoice, Long> {
    @Query("SELECT SUM(i.totalPrice) FROM Invoice i")
    long findTotalIncome();

    @Query("SELECT SUM(i.totalPrice) FROM Invoice i WHERE i.order.dateTime >= :startDate AND i.order.dateTime <= :endDate")
    long findIncomeByDateRange(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);
}
