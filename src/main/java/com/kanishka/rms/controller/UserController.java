package com.kanishka.rms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.kanishka.rms.dto.UserDTO;
import com.kanishka.rms.model.UserType;
import com.kanishka.rms.service.UserService;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/login")
    public ResponseEntity<String> login(@RequestParam("username") String username,
                                        @RequestParam("password") String password) {
        return ResponseEntity.badRequest().build();
    }

    @PostMapping("/register")
    public ResponseEntity<String> register(@RequestBody UserDTO userDTO) {
        ResponseEntity<String> response;

        try {
            UserType.valueOf(userDTO.getUsertype());

            userService.register(userDTO);

            response = ResponseEntity.ok("User registration is successfully completed!");
        } catch (IllegalArgumentException ex1) {
            response = ResponseEntity.badRequest().body("Invalid usertype.");
        } catch (Exception ex2) {
            response = ResponseEntity.badRequest().body(ex2.getMessage());
        }

        return response;
    }
}
