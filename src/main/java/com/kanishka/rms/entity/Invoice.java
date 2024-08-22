package com.kanishka.rms.entity;

import com.kanishka.rms.model.PaymentMethod;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Column;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Enumerated;
import jakarta.persistence.EnumType;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;

@Entity
public class Invoice {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(nullable = false)
    private String place;
    @Column(name = "total_price", nullable = false)
    private Integer totalPrice;
    @Column(name = "payment_method_id", nullable = false)
    private Long paymentMethodId;
    @ManyToOne
    @JoinColumn(name = "order_id", nullable = false)
    private Order order;
    @Enumerated(EnumType.ORDINAL)
    private PaymentMethod paymentMethod;

    @PrePersist
    @PreUpdate
    public void updatePaymentMethodId() {
        paymentMethodId = paymentMethod.ordinal() + 1L;
    }
}
