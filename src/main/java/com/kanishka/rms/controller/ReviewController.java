package com.kanishka.rms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kanishka.rms.dto.ReviewDTO;
import com.kanishka.rms.entity.User;
import com.kanishka.rms.service.ReviewService;
import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/review")
public class ReviewController {
    @Autowired
    private final ReviewService reviewService;

    public ReviewController(ReviewService reviewService) {
        this.reviewService = reviewService;
    }

    @GetMapping("/add")
    public ResponseEntity<String> addReview(@RequestParam("rating") int rating,
                                            @RequestParam("comment") String comment,
                                            HttpServletRequest request) {
        try {
            User user = (User) request.getSession().getAttribute("user");

            reviewService.insert(user, rating, comment);

            return ResponseEntity.ok("Thank you, Your review saved successfully!");
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Something went wrong! Please try again later.");
        }
    }

    @GetMapping("/all")
    public ResponseEntity<List<ReviewDTO>> getAllReview() {
        return ResponseEntity.ok().body(reviewService.findAll());
    }
}
