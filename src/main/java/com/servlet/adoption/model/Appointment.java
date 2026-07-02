package com.servlet.adoption.model;

import java.time.LocalDateTime;

public class Appointment {
    private int appointment_id;
    private int pet_id;
    private String pet_name;
    private String user_name;
    private String user_email;
    private String user_phone;
    private String location;
    private LocalDateTime appointment_datetime;
    private String status;
    private String message;
    private LocalDateTime created_at;

    public Appointment() {}

    public Appointment(int pet_id, String pet_name, String user_name, String user_email, 
                     String user_phone, String location, LocalDateTime appointment_datetime, 
                     String status, String message) {
        this.pet_id = pet_id;
        this.pet_name = pet_name;
        this.user_name = user_name;
        this.user_email = user_email;
        this.user_phone = user_phone;
        this.location = location;
        this.appointment_datetime = appointment_datetime;
        this.status = status;
        this.message = message;
    }

    public int getAppointment_id() {
        return appointment_id;
    }

    public void setAppointment_id(int appointment_id) {
        this.appointment_id = appointment_id;
    }

    public int getPet_id() {
        return pet_id;
    }

    public void setPet_id(int pet_id) {
        this.pet_id = pet_id;
    }

    public String getPet_name() {
        return pet_name;
    }

    public void setPet_name(String pet_name) {
        this.pet_name = pet_name;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_phone() {
        return user_phone;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public LocalDateTime getAppointment_datetime() {
        return appointment_datetime;
    }

    public void setAppointment_datetime(LocalDateTime appointment_datetime) {
        this.appointment_datetime = appointment_datetime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public LocalDateTime getCreated_at() {
        return created_at;
    }

    public void setCreated_at(LocalDateTime created_at) {
        this.created_at = created_at;
    }
}
