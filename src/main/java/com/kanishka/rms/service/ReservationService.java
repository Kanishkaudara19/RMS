package com.kanishka.rms.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

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

    public List<ReservationDTO> getAllReservation() {
        List<ReservationDTO> reservationList = new ArrayList<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        for(Reservation reservation : reservationRepository.findAll()) {
            ReservationDTO reservationDTO = new ReservationDTO();
            reservationDTO.setId(reservation.getId());
            reservationDTO.setCustomerName(reservation.getCustomer().getFname() +" "+ reservation.getCustomer().getLname());
            reservationDTO.setBranch(reservation.getPlace());
            reservationDTO.setNoOfSeats(reservation.getNoOfSeats());
            reservationDTO.setDatetime(reservation.getDateTime().format(formatter));

            reservationList.add(reservationDTO);
        }

        return reservationList;
    }

    public void updateReservation(long id, String datetime) throws ReservationAbortException {
        Optional<Reservation> optionalReservation = reservationRepository.findById(id);

        if(optionalReservation.isEmpty()) {
            throw new ReservationAbortException("Reservation does not exists");
        }

        Reservation reservation = optionalReservation.get();
        reservation.setDateTime(getLocalDateTimeInstance(datetime));

        reservationRepository.save(reservation);
    }

    public void deleteReservation(long id) throws ReservationAbortException {
        Optional<Reservation> optionalReservation = reservationRepository.findById(id);

        if(optionalReservation.isEmpty()) {
            throw new ReservationAbortException("Reservation does not exists");
        }

        Reservation reservation = optionalReservation.get();
        reservationRepository.delete(reservation);
    }

    private LocalDateTime getLocalDateTimeInstance(String datetime) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        return LocalDateTime.parse(datetime, formatter).withNano(0).truncatedTo(ChronoUnit.SECONDS);
    }
}
