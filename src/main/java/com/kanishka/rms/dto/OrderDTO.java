package com.kanishka.rms.dto;

import java.util.List;

public class OrderDTO {
    private long userId;
    private String orderType;
    private String branch;
    private String paymentMethod;
    private List<OrderFoodDTO> foodList;

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public List<OrderFoodDTO> getFoodList() {
        return foodList;
    }

    public void setFoodList(List<OrderFoodDTO> foodList) {
        this.foodList = foodList;
    }

    public static class OrderFoodDTO {
        private long id;
        private int qty;

        public long getId() {
            return id;
        }

        public void setId(long id) {
            this.id = id;
        }

        public int getQty() {
            return qty;
        }

        public void setQty(int qty) {
            this.qty = qty;
        }
    }
}
