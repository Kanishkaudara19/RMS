package com.kanishka.rms.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanishka.rms.dto.ReservationDTO;
import com.kanishka.rms.entity.Reservation;
import com.kanishka.rms.entity.User;
import com.kanishka.rms.exception.ReservationAbortException;
import com.kanishka.rms.repo.ReservationRepository;

@Service
public class ReservationService {
    @Autowired
    private final ReservationRepository reservationRepository;

    public ReservationService(ReservationRepository reservationRepository) {
        this.reservationRepository = reservationRepository;
    }

    public void insertReservation(ReservationDTO reservationDTO, User user) throws ReservationAbortException {
        Reservation reservation = new Reservation();
        reservation.setDateTime(getLocalDateTimeInstance(reservationDTO.getDatetime()));
        reservation.setPlace(reservationDTO.getBranch());
        reservation.setNoOfSeats(reservationDTO.getNoOfSeats());
        reservation.setCustomer(user);

        if(reservationRepository.save(reservation) == null) {
            throw new ReservationAbortException("Exception on adding reservation");
        }
    }

    private LocalDateTime getLocalDateTimeInstance(String datetime) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        return LocalDateTime.parse(datetime, formatter);
    }
}
