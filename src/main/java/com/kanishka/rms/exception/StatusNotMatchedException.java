package com.kanishka.rms.exception;

public class StatusNotMatchedException extends StatusNotFoundException {
    public StatusNotMatchedException(String message) {
        super(message);
    }
}
