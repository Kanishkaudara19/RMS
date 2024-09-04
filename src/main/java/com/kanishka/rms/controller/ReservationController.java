package com.kanishka.rms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.kanishka.rms.dto.ReservationDTO;
import com.kanishka.rms.entity.User;
import com.kanishka.rms.exception.UserNotFoundException;
import com.kanishka.rms.service.ReservationService;
import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/reservation")
public class ReservationController {
    @Autowired
    private final ReservationService reservationService;

    public ReservationController(ReservationService reservationService) {
        this.reservationService = reservationService;
    }

    @PostMapping("/insert")
    public ResponseEntity<String> insertReservation(@RequestBody ReservationDTO reservationDTO,
                                                    HttpServletRequest request) {
        ResponseEntity<String> response;

        try {
            User user = (User) request.getSession().getAttribute("user");
            if(user == null) {
                throw new UserNotFoundException("User have not logged in.");
            }

            reservationService.insertReservation(reservationDTO, user);

            response = ResponseEntity.ok("Successfully added the reservation!");
        } catch (Exception ex) {
            response = ResponseEntity.badRequest().body("Something went wrong! Please try again later.");
        }

        return response;
    }

    @GetMapping("/all")
    public ResponseEntity<List<ReservationDTO>> getAllReservations() {
        return ResponseEntity.ok().body(reservationService.getAllReservation());
    }

    @GetMapping("/update")
    public ResponseEntity<String> updateReservatin(@RequestParam("rid") long id,
                                                   @RequestParam("datetime") String datetime) {
        ResponseEntity<String> response;

        try {
            reservationService.updateReservation(id, datetime);

            response = ResponseEntity.ok("Reservation updated successfully!");
        } catch (Exception ex) {
            response = ResponseEntity.badRequest().body("Something went wrong! Please try again later.");
        }
        return response;
    }

    @GetMapping("/delete")
    public ResponseEntity<String> deleteReservation(@RequestParam("rid") long id) {
        ResponseEntity<String> response;

        try {
            reservationService.deleteReservation(id);

            response = ResponseEntity.ok("Reservation deleted successfully!");
        } catch (Exception ex) {
            response = ResponseEntity.badRequest().body("Something went wrong! Please try again later.");
        }
        return response;
    }
}
