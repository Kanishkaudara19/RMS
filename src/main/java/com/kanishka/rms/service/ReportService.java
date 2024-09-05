package com.kanishka.rms.service;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanishka.rms.dto.ReportDTO;
import com.kanishka.rms.repo.InvoiceRepository;
import com.kanishka.rms.repo.OrderRepository;
import com.kanishka.rms.repo.ReservationRepository;
import com.kanishka.rms.repo.UserRepository;

@Service
public class ReportService {
    @Autowired
    private final UserRepository userRepository;
    @Autowired
    private final OrderRepository orderRepository;
    @Autowired
    private final ReservationRepository reservationRepository;
    @Autowired
    private final InvoiceRepository invoiceRepository;

    public ReportService(UserRepository userRepository,
                         OrderRepository orderRepository,
                         ReservationRepository reservationRepository,
                         InvoiceRepository invoiceRepository) {
        this.userRepository = userRepository;
        this.orderRepository = orderRepository;
        this.reservationRepository = reservationRepository;
        this.invoiceRepository = invoiceRepository;
    }

    public ReportDTO getReportData() {
        ReportDTO reportDTO = new ReportDTO();
        LocalDateTime today = LocalDateTime.now();

        reportDTO.setTotalIncome(invoiceRepository.findTotalIncome());
        reportDTO.setTotalOrders(orderRepository.count());
        reportDTO.setTotalReservations(reservationRepository.count());
        reportDTO.setTotalUsers(userRepository.count());

        LocalDateTime weekAgo = today.minusDays(7);
        reportDTO.setWeeklyIncome(invoiceRepository.findIncomeByDateRange(weekAgo, today));
        reportDTO.setWeeklyOrders(orderRepository.countOrdersByDateRange(weekAgo, today));
        reportDTO.setWeeklyReservations(reservationRepository.countReservationsByDateRange(weekAgo, today));

        LocalDateTime monthAgo = today.minusMonths(1);
        reportDTO.setMonthlyIncome(invoiceRepository.findIncomeByDateRange(monthAgo, today));
        reportDTO.setMonthlyOrders(orderRepository.countOrdersByDateRange(monthAgo, today));
        reportDTO.setMonthlyReservations(reservationRepository.countReservationsByDateRange(monthAgo, today));

        LocalDateTime yearAgo = today.minusYears(1);
        reportDTO.setYearlyIncome(invoiceRepository.findIncomeByDateRange(yearAgo, today));
        reportDTO.setYearlyOrders(orderRepository.countOrdersByDateRange(yearAgo, today));
        reportDTO.setYearlyReservations(reservationRepository.countReservationsByDateRange(yearAgo, today));

        return reportDTO;
    }
}
