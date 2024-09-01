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

        if(optionalStatus.isEmpty()) {
            throw new StatusNotFoundException("Status not found: " + statusName);
        }
        return optionalStatus.get();
    }
}
