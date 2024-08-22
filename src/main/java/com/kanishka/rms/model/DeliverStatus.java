package com.kanishka.rms.model;

public class DeliverStatus implements Status {
    @Override
    public String getName() {
        return "Deliver";
    }

    @Override
    public int getId() {
        return 3;
    }
}
