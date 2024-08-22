package com.kanishka.rms.model;

public class QueuedStatus implements Status {
    @Override
    public String getName() {
        return "Queued";
    }

    @Override
    public int getId() {
        return 1;
    }
}
