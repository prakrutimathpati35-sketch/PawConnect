package com.servlet.adoption.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.servlet.adoption.dao.AppointmentDAOImpl;
import com.servlet.adoption.dao.PetDAOImpl;
import com.servlet.adoption.model.Appointment;
import com.servlet.adoption.model.Pets;

@WebServlet("/appointment")
public class AppointmentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        
        if ("book".equals(action)) {
            handleBookAppointment(request, response);
        } else if ("update".equals(action)) {
            handleUpdateAppointment(request, response);
        } else if ("delete".equals(action)) {
            handleDeleteAppointment(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        
        if ("view".equals(action)) {
            handleViewAppointment(request, response);
        } else if ("list".equals(action)) {
            handleListAppointments(request, response);
        } else if ("cancel".equals(action)) {
            handleCancelAppointment(request, response);
        }
    }

    private void handleBookAppointment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int petId = Integer.parseInt(request.getParameter("petId"));
            String petName = request.getParameter("petName");
            String userName = request.getParameter("userName");
            String userEmail = request.getParameter("userEmail");
            String userPhone = request.getParameter("userPhone");
            String location = request.getParameter("location");
            String appointmentDate = request.getParameter("appointmentDate");
            String appointmentTime = request.getParameter("appointmentTime");
            String message = request.getParameter("message");

            // Validate pet exists
            PetDAOImpl petDAO = new PetDAOImpl();
            Pets pet = petDAO.getPetById(petId);
            
            if (pet == null) {
                request.setAttribute("error", "Pet not found!");
                request.getRequestDispatcher("appointment-error.jsp").forward(request, response);
                return;
            }

            // Parse appointment datetime
            String dateTimeStr = appointmentDate + " " + appointmentTime;
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
            LocalDateTime appointmentDateTime = LocalDateTime.parse(dateTimeStr, formatter);

            // Create appointment
            Appointment appointment = new Appointment();
            appointment.setPet_id(petId);
            appointment.setPet_name(petName);
            appointment.setUser_name(userName);
            appointment.setUser_email(userEmail);
            appointment.setUser_phone(userPhone);
            appointment.setLocation(location);
            appointment.setAppointment_datetime(appointmentDateTime);
            appointment.setStatus("PENDING");
            appointment.setMessage(message);

            // Save appointment
            boolean saved = new AppointmentDAOImpl().saveAppointment(appointment);

            if (saved) {
                request.setAttribute("appointment", appointment);
                request.setAttribute("pet", pet);
                request.getRequestDispatcher("appointment-success.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Failed to book appointment. Please try again.");
                request.getRequestDispatcher("appointment-error.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Invalid appointment details. Please check your input.");
            request.getRequestDispatcher("appointment-error.jsp").forward(request, response);
        }
    }

    private void handleUpdateAppointment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
            String status = request.getParameter("status");

            boolean updated = new AppointmentDAOImpl().updateAppointmentStatus(appointmentId, status);

            if (updated) {
                response.sendRedirect("appointments.jsp?success=updated");
            } else {
                response.sendRedirect("appointments.jsp?error=update_failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("appointments.jsp?error=invalid");
        }
    }

    private void handleDeleteAppointment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));

            boolean deleted = new AppointmentDAOImpl().deleteAppointment(appointmentId);

            if (deleted) {
                response.sendRedirect("appointments.jsp?success=deleted");
            } else {
                response.sendRedirect("appointments.jsp?error=delete_failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("appointments.jsp?error=invalid");
        }
    }

    private void handleViewAppointment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));

            Appointment appointment = new AppointmentDAOImpl().getAppointmentById(appointmentId);

            if (appointment != null) {
                request.setAttribute("appointment", appointment);
                request.getRequestDispatcher("appointment-details.jsp").forward(request, response);
            } else {
                response.sendRedirect("appointments.jsp?error=not_found");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("appointments.jsp?error=invalid");
        }
    }

    private void handleListAppointments(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userEmail = request.getParameter("userEmail");
        
        if (userEmail != null && !userEmail.isEmpty()) {
            // View appointments for specific user
            request.setAttribute("appointments", 
                new AppointmentDAOImpl().getAppointmentsByUserId(userEmail));
        } else {
            // View all appointments (admin view)
            request.setAttribute("appointments", 
                new AppointmentDAOImpl().getAllAppointments());
        }

        request.getRequestDispatcher("appointments.jsp").forward(request, response);
    }

    private void handleCancelAppointment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));

            boolean cancelled = new AppointmentDAOImpl().updateAppointmentStatus(appointmentId, "CANCELLED");

            if (cancelled) {
                response.sendRedirect("appointments.jsp?success=cancelled");
            } else {
                response.sendRedirect("appointments.jsp?error=cancel_failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("appointments.jsp?error=invalid");
        }
    }
}
