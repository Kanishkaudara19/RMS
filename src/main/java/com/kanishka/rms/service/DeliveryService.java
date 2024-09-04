package com.kanishka.rms.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanishka.rms.entity.Delivery;
import com.kanishka.rms.entity.Order;
import com.kanishka.rms.entity.User;
import com.kanishka.rms.exception.DeliveryAlreadyExistsException;
import com.kanishka.rms.repo.DeliveryRepository;

@Service
public class DeliveryService {
    @Autowired
    private final DeliveryRepository deliveryRepository;

    public DeliveryService(DeliveryRepository deliveryRepository) {
        this.deliveryRepository = deliveryRepository;
    }

    public void insertDeliveryUser(User user, Order order) throws Exception {
        Optional<Delivery> optionalDelivery = deliveryRepository.findDeliveryByOrder(order);

        if(optionalDelivery.isPresent()) {
            throw new DeliveryAlreadyExistsException("Delivery already taken");
        }

        Delivery delivery = new Delivery();
        delivery.setDeliveryUser(user);
        delivery.setOrder(order);

        if(deliveryRepository.save(delivery) == null) {
            throw new Exception();
        }
    }
}
