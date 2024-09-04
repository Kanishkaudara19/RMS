package com.kanishka.rms.service;

import java.util.Locale;

import org.springframework.stereotype.Service;

import com.kanishka.rms.exception.StatusNotMatchedException;
import com.kanishka.rms.model.Status;
import com.kanishka.rms.model.QueuedStatus;
import com.kanishka.rms.model.PrepareStatus;
import com.kanishka.rms.model.DeliverStatus;
import com.kanishka.rms.model.ServeStatus;
import com.kanishka.rms.model.CompleteStatus;

@Service
public class OrderStatusService {
    public Status getStatus(String name) throws StatusNotMatchedException {
        switch (name.toUpperCase(Locale.ROOT)) {
            case "QUEUED"->{
                return new QueuedStatus();
            }
            case "PREPARE"->{
                return new PrepareStatus();
            }
            case "DELIVER"->{
                return new DeliverStatus();
            }
            case "SERVE"->{
                return new ServeStatus();
            }
            case "COMPLETED"->{
                return new CompleteStatus();
            }
            default ->
                    throw new StatusNotMatchedException("Status name is not matching");
        }
    }
}
