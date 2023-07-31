/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;

/**
 *
 * @author Lenovo
 */
public class Order {
    
    private int order_id,user_id;
    private String name_receiver, phone_receiver,address_receiver;
    private double total_price;
    private Date date;
    private String status;

    public Order() {
    }

    public Order(int order_id, int user_id, String name_receiver, String phone_receiver, String address_receiver, double total_price, Date date, String status) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.name_receiver = name_receiver;
        this.phone_receiver = phone_receiver;
        this.address_receiver = address_receiver;
        this.total_price = total_price;
        this.date = date;
        this.status = status;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getName_receiver() {
        return name_receiver;
    }

    public void setName_receiver(String name_receiver) {
        this.name_receiver = name_receiver;
    }

    public String getPhone_receiver() {
        return phone_receiver;
    }

    public void setPhone_receiver(String phone_receiver) {
        this.phone_receiver = phone_receiver;
    }

    public String getAddress_receiver() {
        return address_receiver;
    }

    public void setAddress_receiver(String address_receiver) {
        this.address_receiver = address_receiver;
    }

    public double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(double total_price) {
        this.total_price = total_price;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }   
}
