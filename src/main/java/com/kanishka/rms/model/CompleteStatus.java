package com.kanishka.rms.model;

public class CompleteStatus implements Status {
    @Override
    public String getName() {
        return "Completed";
    }

    @Override
    public int getId() {
        return 5;
    }
}
