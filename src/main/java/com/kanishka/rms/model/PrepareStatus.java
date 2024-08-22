package com.kanishka.rms.model;

public class PrepareStatus implements Status {
    @Override
    public String getName() {
        return "Prepare";
    }

    @Override
    public int getId() {
        return 2;
    }
}
