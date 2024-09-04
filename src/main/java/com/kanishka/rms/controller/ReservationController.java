package com.kanishka.rms.controller;

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
}
