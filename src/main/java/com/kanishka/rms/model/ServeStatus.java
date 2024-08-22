package com.kanishka.rms.model;

public class ServeStatus implements Status {
    @Override
    public String getName() {
        return "Serve";
    }

    @Override
    public int getId() {
        return 4;
    }
}
