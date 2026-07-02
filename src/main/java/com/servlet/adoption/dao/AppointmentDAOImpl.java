package com.servlet.adoption.dao;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.servlet.adoption.model.Appointment;
import com.servlet.adoption.util.DBConnection;

public class AppointmentDAOImpl implements AppointmentDAO {

    @Override
    public boolean saveAppointment(Appointment appointment) {
        boolean isSuccess = false;

        String sql = "INSERT INTO appointments (pet_id, pet_name, user_name, user_email, user_phone, location, "
                   + "appointment_datetime, status, message) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            Connection con = DBConnection.getConnector();
            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, appointment.getPet_id());
            ps.setString(2, appointment.getPet_name());
            ps.setString(3, appointment.getUser_name());
            ps.setString(4, appointment.getUser_email());
            ps.setString(5, appointment.getUser_phone());
            ps.setString(6, appointment.getLocation());
            ps.setTimestamp(7, Timestamp.valueOf(appointment.getAppointment_datetime()));
            ps.setString(8, appointment.getStatus() != null ? appointment.getStatus() : "PENDING");
            ps.setString(9, appointment.getMessage());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                isSuccess = true;
                // Get the generated appointment_id
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    appointment.setAppointment_id(rs.getInt(1));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    @Override
    public List<Appointment> getAllAppointments() {
        List<Appointment> list = new ArrayList<>();
        String sql = "SELECT * FROM appointments ORDER BY created_at DESC";

        try (Connection conn = DBConnection.getConnector();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Appointment appointment = mapResultSetToAppointment(rs);
                list.add(appointment);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public Appointment getAppointmentById(int appointmentId) {
        String sql = "SELECT * FROM appointments WHERE appointment_id = ?";
        Appointment appointment = null;

        try {
            Connection con = DBConnection.getConnector();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, appointmentId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                appointment = mapResultSetToAppointment(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return appointment;
    }

    @Override
    public List<Appointment> getAppointmentsByUserId(String userEmail) {
        List<Appointment> list = new ArrayList<>();
        String sql = "SELECT * FROM appointments WHERE user_email = ? ORDER BY created_at DESC";

        try (Connection conn = DBConnection.getConnector();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, userEmail);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Appointment appointment = mapResultSetToAppointment(rs);
                list.add(appointment);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<Appointment> getAppointmentsByPetId(int petId) {
        List<Appointment> list = new ArrayList<>();
        String sql = "SELECT * FROM appointments WHERE pet_id = ? ORDER BY created_at DESC";

        try (Connection conn = DBConnection.getConnector();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, petId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Appointment appointment = mapResultSetToAppointment(rs);
                list.add(appointment);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public boolean updateAppointmentStatus(int appointmentId, String status) {
        String sql = "UPDATE appointments SET status = ? WHERE appointment_id = ?";

        try {
            Connection con = DBConnection.getConnector();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, status);
            ps.setInt(2, appointmentId);

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean deleteAppointment(int appointmentId) {
        String sql = "DELETE FROM appointments WHERE appointment_id = ?";

        try {
            Connection con = DBConnection.getConnector();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, appointmentId);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    private Appointment mapResultSetToAppointment(ResultSet rs) throws SQLException {
        Appointment appointment = new Appointment();
        appointment.setAppointment_id(rs.getInt("appointment_id"));
        appointment.setPet_id(rs.getInt("pet_id"));
        appointment.setPet_name(rs.getString("pet_name"));
        appointment.setUser_name(rs.getString("user_name"));
        appointment.setUser_email(rs.getString("user_email"));
        appointment.setUser_phone(rs.getString("user_phone"));
        appointment.setLocation(rs.getString("location"));
        
        Timestamp appointmentTimestamp = rs.getTimestamp("appointment_datetime");
        if (appointmentTimestamp != null) {
            appointment.setAppointment_datetime(appointmentTimestamp.toLocalDateTime());
        }
        
        appointment.setStatus(rs.getString("status"));
        appointment.setMessage(rs.getString("message"));
        
        Timestamp createdTimestamp = rs.getTimestamp("created_at");
        if (createdTimestamp != null) {
            appointment.setCreated_at(createdTimestamp.toLocalDateTime());
        }
        
        return appointment;
    }
}
