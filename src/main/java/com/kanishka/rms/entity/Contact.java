package com.kanishka.rms.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Column;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.MapsId;

@Entity
public class Contact {
    @Id
    private Long id;
    @OneToOne
    @MapsId
    @JoinColumn(name = "customer_user_id", nullable = false)
    private User customer;
    @Column(nullable = false)
    private String mobile;
    @Column(nullable = false)
    private String address;

    public User getCustomer() {
        return customer;
    }

    public void setCustomer(User customer) {
        this.customer = customer;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
