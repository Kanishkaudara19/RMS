package com.kanishka.rms.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanishka.rms.entity.Status;
import com.kanishka.rms.exception.StatusNotFoundException;
import com.kanishka.rms.repo.StatusRepository;

@Service
public class StatusService {
    @Autowired
    private final StatusRepository statusRepository;

    public StatusService(StatusRepository statusRepository) {
        this.statusRepository = statusRepository;
    }

    public Status findStatusByName(String statusName) throws StatusNotFoundException {
        Optional<Status> optionalStatus = statusRepository.findStatusByName(statusName);

        Status status;

        if(optionalStatus.isEmpty()) {
            Status newStatus = new Status();
            newStatus.setName(statusName);

            status = statusRepository.save(newStatus);
        } else {
            status = optionalStatus.get();
        }
        return status;
    }
}
