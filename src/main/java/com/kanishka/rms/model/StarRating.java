package com.kanishka.rms.model;

import com.kanishka.rms.exception.IllegalStarRatingArgumentException;

public enum StarRating {
    STAR_1, STAR_2, STAR_3, STAR_4, STAR_5;

    public static StarRating valueOf(int id) throws IllegalStarRatingArgumentException {
        if(id < 1 || id > 5) {
            throw new IllegalStarRatingArgumentException("Star rating argument is illegal: " + id);
        }
        switch (id) {
            case 1 -> {
                return STAR_1;
            }
            case 2 -> {
                return STAR_2;
            }
            case 3 -> {
                return STAR_3;
            }
            case 4 -> {
                return STAR_4;
            }
            case 5 -> {
                return STAR_5;
            }
            default -> {
                return null;
            }
        }
    }
}
