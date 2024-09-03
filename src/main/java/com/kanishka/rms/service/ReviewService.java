package com.kanishka.rms.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanishka.rms.dto.ReviewDTO;
import com.kanishka.rms.entity.Review;
import com.kanishka.rms.entity.User;
import com.kanishka.rms.model.StarRating;
import com.kanishka.rms.repo.ReviewRepository;

@Service
public class ReviewService {
    @Autowired
    private final ReviewRepository reviewRepository;

    public ReviewService(ReviewRepository reviewRepository) {
        this.reviewRepository = reviewRepository;
    }

    public void insert(User user, int rating, String comment) throws Exception {
        StarRating starRating = StarRating.valueOf(rating);

        Review review = new Review();
        review.setUser(user);
        review.setComment(comment);
        review.setStarRating(starRating);

        reviewRepository.save(review);
    }

    public List<ReviewDTO> findAll() {
        List<ReviewDTO> reviewDTOList = new ArrayList<>();

        for(Review review : reviewRepository.findAll()) {
            ReviewDTO reviewDTO = new ReviewDTO();
            reviewDTO.setCustomerName(review.getUser().getFname() +" "+ review.getUser().getLname());
            reviewDTO.setComment(review.getComment());
            reviewDTO.setRating(review.getStarRating().ordinal() + 1);

            reviewDTOList.add(reviewDTO);
        }
        return reviewDTOList;
    }
}
