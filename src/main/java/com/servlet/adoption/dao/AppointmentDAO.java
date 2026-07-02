package com.servlet.adoption.dao;

import java.util.List;
import com.servlet.adoption.model.Appointment;

public interface AppointmentDAO {
    boolean saveAppointment(Appointment appointment);
    List<Appointment> getAllAppointments();
    Appointment getAppointmentById(int appointmentId);
    List<Appointment> getAppointmentsByUserId(String userEmail);
    List<Appointment> getAppointmentsByPetId(int petId);
    boolean updateAppointmentStatus(int appointmentId, String status);
    boolean deleteAppointment(int appointmentId);
}
