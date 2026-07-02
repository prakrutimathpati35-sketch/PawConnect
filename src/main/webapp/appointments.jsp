<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.servlet.adoption.dao.AppointmentDAO" %>
<%@ page import="com.servlet.adoption.dao.AppointmentDAOImpl" %>
<%@ page import="com.servlet.adoption.model.Appointment" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PawConnect - My Appointments</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #8B5FBF 0%, #6A4C93 100%);
            color: #333;
            line-height: 1.6;
            min-height: 100vh;
        }

        /* Navigation Styles */
        nav {
            background: white;
            padding: 1rem 2rem;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }

        .nav-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
        }

        .logo {
            color: #8B5FBF;
            font-size: 1.8rem;
            font-weight: bold;
        }

        .nav-links {
            display: flex;
            gap: 2rem;
            list-style: none;
        }

        .nav-links a {
            color: #333;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .nav-links a:hover {
            color: #8B5FBF;
        }

        /* Main Content */
        .main-content {
            margin-top: 100px;
            padding: 2rem;
            max-width: 1200px;
            margin-left: auto;
            margin-right: auto;
        }

        .appointments-container {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        .appointments-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .appointments-header h1 {
            color: #8B5FBF;
            font-size: 2.5rem;
        }

        .book-new-btn {
            background: linear-gradient(135deg, #8B5FBF 0%, #6A4C93 100%);
            color: white;
            padding: 0.8rem 1.5rem;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: transform 0.3s ease;
        }

        .book-new-btn:hover {
            transform: translateY(-2px);
        }

        .appointments-grid {
            display: grid;
            gap: 1.5rem;
        }

        .appointment-card {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 1.5rem;
            border-left: 4px solid #8B5FBF;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .appointment-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .appointment-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .appointment-id {
            font-weight: bold;
            color: #8B5FBF;
        }

        .appointment-status {
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 500;
        }

        .status-pending {
            background: #ffc107;
            color: #333;
        }

        .status-confirmed {
            background: #28a745;
            color: white;
        }

        .status-cancelled {
            background: #dc3545;
            color: white;
        }

        .status-completed {
            background: #6c757d;
            color: white;
        }

        .appointment-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-bottom: 1rem;
        }

        .detail-item {
            display: flex;
            flex-direction: column;
        }

        .detail-label {
            font-size: 0.9rem;
            color: #666;
            margin-bottom: 0.2rem;
        }

        .detail-value {
            font-weight: 500;
            color: #333;
        }

        .appointment-message {
            background: white;
            padding: 0.8rem;
            border-radius: 5px;
            margin-bottom: 1rem;
            font-style: italic;
            color: #666;
        }

        .appointment-actions {
            display: flex;
            gap: 0.5rem;
            flex-wrap: wrap;
        }

        .action-btn {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 5px;
            font-size: 0.9rem;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: transform 0.3s ease;
        }

        .action-btn:hover {
            transform: translateY(-1px);
        }

        .btn-view {
            background: #007bff;
            color: white;
        }

        .btn-cancel {
            background: #dc3545;
            color: white;
        }

        .btn-reschedule {
            background: #ffc107;
            color: #333;
        }

        .no-appointments {
            text-align: center;
            padding: 3rem;
            color: #666;
        }

        .no-appointments h2 {
            margin-bottom: 1rem;
            color: #8B5FBF;
        }

        .alert {
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 1rem;
        }

        .alert-success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .alert-error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        @media (max-width: 768px) {
            .nav-links {
                display: none;
            }
            
            .main-content {
                margin-top: 80px;
                padding: 1rem;
            }
            
            .appointments-header {
                flex-direction: column;
                gap: 1rem;
                align-items: flex-start;
            }
            
            .appointment-details {
                grid-template-columns: 1fr;
            }
            
            .appointment-actions {
                flex-direction: column;
            }
            
            .action-btn {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <nav>
        <div class="nav-container">
            <div class="logo">🐾 PawConnect</div>
            <ul class="nav-links">
                <li><a href="home.jsp">Home</a></li>
                <li><a href="pets.jsp">Pets</a></li>
                <li><a href="services.jsp">Services</a></li>
                <li><a href="appointments.jsp">My Appointments</a></li>
                <li><a href="contact.jsp">Contact</a></li>
            </ul>
        </div>
    </nav>

    <div class="main-content">
        <div class="appointments-container">
            <div class="appointments-header">
                <h1>📅 My Appointments</h1>
                <a href="appointment-booking.jsp" class="book-new-btn">🐕 Book New Visit</a>
            </div>

            <%-- Success/Error Messages --%>
            <% if (request.getParameter("success") != null) { %>
                <div class="alert alert-success">
                    <% 
                        String success = request.getParameter("success");
                        if (success.equals("updated")) out.print("Appointment updated successfully!");
                        else if (success.equals("cancelled")) out.print("Appointment cancelled successfully!");
                        else if (success.equals("deleted")) out.print("Appointment deleted successfully!");
                    %>
                </div>
            <% } %>

            <% if (request.getParameter("error") != null) { %>
                <div class="alert alert-error">
                    <% 
                        String error = request.getParameter("error");
                        if (error.equals("update_failed")) out.print("Failed to update appointment. Please try again.");
                        else if (error.equals("cancel_failed")) out.print("Failed to cancel appointment. Please try again.");
                        else if (error.equals("delete_failed")) out.print("Failed to delete appointment. Please try again.");
                        else if (error.equals("not_found")) out.print("Appointment not found.");
                        else if (error.equals("invalid")) out.print("Invalid request.");
                    %>
                </div>
            <% } %>

            <%-- Appointments List --%>
            <%
                // Initialize appointments list from database
                AppointmentDAO appointmentDAO = new AppointmentDAOImpl();
                List<Appointment> appointments = null;
                
                // Check if user is logged in and get their email
                String userEmail = (String) session.getAttribute("userEmail");
                
                // Debug: Show user email (remove in production)
                if (userEmail != null) {
                    System.out.println("DEBUG: Found user email in session: " + userEmail);
                } else {
                    System.out.println("DEBUG: No user email found in session");
                }
                
                if (userEmail != null && !userEmail.isEmpty()) {
                    // Get appointments for logged-in user
                    try {
                        appointments = appointmentDAO.getAppointmentsByUserId(userEmail);
                        System.out.println("DEBUG: Retrieved " + (appointments != null ? appointments.size() : 0) + " appointments for user: " + userEmail);
                    } catch (Exception e) {
                        System.out.println("DEBUG: Error fetching appointments: " + e.getMessage());
                        e.printStackTrace();
                    }
                } else {
                    // For demo purposes, show all appointments if no user is logged in
                    try {
                        appointments = appointmentDAO.getAllAppointments();
                        System.out.println("DEBUG: No user logged in, showing all appointments: " + (appointments != null ? appointments.size() : 0));
                    } catch (Exception e) {
                        System.out.println("DEBUG: Error fetching all appointments: " + e.getMessage());
                        e.printStackTrace();
                    }
                    
                    // Also check if appointments are passed as request attribute (for admin view)
                    List<Appointment> requestAppointments = 
                        (List<Appointment>) request.getAttribute("appointments");
                    if (requestAppointments != null) {
                        appointments = requestAppointments;
                    }
                }
                
                if (appointments == null || appointments.isEmpty()) {
            %>
                <div class="no-appointments">
                    <h2>No Appointments Found</h2>
                    <p>You haven't booked any pet visits yet. Click the "Book New Visit" button to schedule your first appointment!</p>
                    <br>
                    <a href="appointment-booking.jsp" class="book-new-btn">🐕 Book Your First Visit</a>
                </div>
            <% 
                } else {
            %>
                <div class="appointments-grid">
                    <% for (com.servlet.adoption.model.Appointment appointment : appointments) { %>
                        <div class="appointment-card">
                            <div class="appointment-header">
                                <span class="appointment-id">Appointment #<%= appointment.getAppointment_id() %></span>
                                <span class="appointment-status status-<%= appointment.getStatus().toLowerCase() %>">
                                    <%= appointment.getStatus() %>
                                </span>
                            </div>

                            <div class="appointment-details">
                                <div class="detail-item">
                                    <span class="detail-label">Pet Name</span>
                                    <span class="detail-value">🐕 <%= appointment.getPet_name() %></span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Date</span>
                                    <span class="detail-value">📅 <%= appointment.getAppointment_datetime().toLocalDate() %></span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Time</span>
                                    <span class="detail-value">🕐 <%= appointment.getAppointment_datetime().toLocalTime().toString().substring(0, 5) %></span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Location</span>
                                    <span class="detail-value">📍 <%= appointment.getLocation() %></span>
                                </div>
                            </div>

                            <% if (appointment.getMessage() != null && !appointment.getMessage().isEmpty()) { %>
                                <div class="appointment-message">
                                    "<%= appointment.getMessage() %>"
                                </div>
                            <% } %>

                            <div class="appointment-actions">
                                <a href="appointment?action=view&appointmentId=<%= appointment.getAppointment_id() %>" 
                                   class="action-btn btn-view">👁️ View Details</a>
                                
                                <% if ("PENDING".equals(appointment.getStatus()) || "CONFIRMED".equals(appointment.getStatus())) { %>
                                    <a href="appointment?action=cancel&appointmentId=<%= appointment.getAppointment_id() %>" 
                                       class="action-btn btn-cancel" 
                                       onclick="return confirm('Are you sure you want to cancel this appointment?')">❌ Cancel</a>
                                <% } %>
                            </div>
                        </div>
                    <% } %>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>
