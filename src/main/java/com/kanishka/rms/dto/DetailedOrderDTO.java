package com.kanishka.rms.dto;

import java.util.List;

public class DetailedOrderDTO {
    private long id;
    private String orderId;
    private String customerName;
    private String address;
    private String datetime;
    private String status;
    private List<DetailedOrderFoodDTO> foodList;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<DetailedOrderFoodDTO> getFoodList() {
        return foodList;
    }

    public void setFoodList(List<DetailedOrderFoodDTO> foodList) {
        this.foodList = foodList;
    }

    public static class DetailedOrderFoodDTO {
        private String name;
        private int qty;

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public int getQty() {
            return qty;
        }

        public void setQty(int qty) {
            this.qty = qty;
        }
    }
}
