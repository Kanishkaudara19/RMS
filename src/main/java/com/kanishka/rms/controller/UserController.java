package com.kanishka.rms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.kanishka.rms.dto.UserDTO;
import com.kanishka.rms.entity.User;
import com.kanishka.rms.exception.UserNotFoundException;
import com.kanishka.rms.model.UserType;
import com.kanishka.rms.service.UserService;
import jakarta.servlet.http.HttpServletRequest;

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
                                        @RequestParam("password") String password,
                                        HttpServletRequest request) {
        ResponseEntity<String> response;

        try {
            User user = userService.login(username, password);

            request.getSession().setAttribute("user", user);

            response = ResponseEntity.ok().build();
        } catch (UserNotFoundException ex) {
            response = ResponseEntity.badRequest().body(ex.getMessage());
        }

        return response;
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

    @PostMapping("/update/contact")
    public ResponseEntity<String> updateContact(@RequestParam("mobile") String mobile,
                                                @RequestParam("address") String address,
                                                HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        ResponseEntity<String> response;

        try {
            userService.update(user, mobile, address);

            response = ResponseEntity.ok("Contact details updated successfully!");
        } catch (Exception ex) {
            response = ResponseEntity.badRequest().body(ex.getMessage());
        }
        return response;
    }
}
