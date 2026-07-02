<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PawConnect - Appointment Details</title>
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
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }

        .details-container {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        .details-header {
            text-align: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #f8f9fa;
        }

        .details-header h1 {
            color: #8B5FBF;
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
        }

        .appointment-id {
            color: #666;
            font-size: 1.1rem;
        }

        .status-badge {
            display: inline-block;
            padding: 0.5rem 1rem;
            border-radius: 25px;
            font-size: 1rem;
            font-weight: 500;
            margin-top: 0.5rem;
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

        .details-section {
            margin-bottom: 2rem;
        }

        .section-title {
            color: #8B5FBF;
            font-size: 1.3rem;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .details-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1rem;
            background: #f8f9fa;
            padding: 1.5rem;
            border-radius: 10px;
        }

        .detail-item {
            display: flex;
            flex-direction: column;
        }

        .detail-label {
            font-size: 0.9rem;
            color: #666;
            margin-bottom: 0.3rem;
            font-weight: 500;
        }

        .detail-value {
            font-size: 1.1rem;
            color: #333;
            font-weight: 600;
        }

        .message-box {
            background: #f8f9fa;
            padding: 1.5rem;
            border-radius: 10px;
            font-style: italic;
            color: #555;
            border-left: 4px solid #8B5FBF;
        }

        .message-box:empty {
            display: none;
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
            margin-top: 2rem;
            padding-top: 2rem;
            border-top: 2px solid #f8f9fa;
        }

        .btn {
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

        .btn:hover {
            transform: translateY(-2px);
        }

        .btn-primary {
            background: linear-gradient(135deg, #8B5FBF 0%, #6A4C93 100%);
            color: white;
        }

        .btn-secondary {
            background: #6c757d;
            color: white;
        }

        .btn-success {
            background: #28a745;
            color: white;
        }

        .btn-danger {
            background: #dc3545;
            color: white;
        }

        .btn-warning {
            background: #ffc107;
            color: #333;
        }

        .btn:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
        }

        @media (max-width: 768px) {
            .nav-links {
                display: none;
            }
            
            .main-content {
                margin-top: 80px;
                padding: 1rem;
            }
            
            .details-container {
                padding: 1.5rem;
            }
            
            .details-grid {
                grid-template-columns: 1fr;
            }
            
            .action-buttons {
                flex-direction: column;
            }
            
            .btn {
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
        <div class="details-container">
            <% if (request.getAttribute("appointment") != null) { %>
                <% 
                    com.servlet.adoption.model.Appointment appointment = 
                        (com.servlet.adoption.model.Appointment) request.getAttribute("appointment");
                %>
                
                <div class="details-header">
                    <h1>📅 Appointment Details</h1>
                    <div class="appointment-id">Appointment ID: #<%= appointment.getAppointment_id() %></div>
                    <span class="status-badge status-<%= appointment.getStatus().toLowerCase() %>">
                        <%= appointment.getStatus() %>
                    </span>
                </div>

                <div class="details-section">
                    <h2 class="section-title">🐕 Pet Information</h2>
                    <div class="details-grid">
                        <div class="detail-item">
                            <span class="detail-label">Pet Name</span>
                            <span class="detail-value"><%= appointment.getPet_name() %></span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label">Pet ID</span>
                            <span class="detail-value">#<%= appointment.getPet_id() %></span>
                        </div>
                    </div>
                </div>

                <div class="details-section">
                    <h2 class="section-title">👤 Your Information</h2>
                    <div class="details-grid">
                        <div class="detail-item">
                            <span class="detail-label">Name</span>
                            <span class="detail-value"><%= appointment.getUser_name() %></span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label">Email</span>
                            <span class="detail-value"><%= appointment.getUser_email() %></span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label">Phone</span>
                            <span class="detail-value"><%= appointment.getUser_phone() %></span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label">Visit Location</span>
                            <span class="detail-value"><%= appointment.getLocation() %></span>
                        </div>
                    </div>
                </div>

                <div class="details-section">
                    <h2 class="section-title">⏰ Schedule Details</h2>
                    <div class="details-grid">
                        <div class="detail-item">
                            <span class="detail-label">Date</span>
                            <span class="detail-value">
                                <%= appointment.getAppointment_datetime().toLocalDate() %>
                            </span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label">Time</span>
                            <span class="detail-value">
                                <%= appointment.getAppointment_datetime().toLocalTime().toString().substring(0, 5) %>
                            </span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label">Booking Date</span>
                            <span class="detail-value">
                                <%= appointment.getCreated_at() != null ? 
                                    appointment.getCreated_at().toLocalDate() : "N/A" %>
                            </span>
                        </div>
                    </div>
                </div>

                <% if (appointment.getMessage() != null && !appointment.getMessage().isEmpty()) { %>
                    <div class="details-section">
                        <h2 class="section-title">📝 Additional Message</h2>
                        <div class="message-box">
                            "<%= appointment.getMessage() %>"
                        </div>
                    </div>
                <% } %>

                <div class="action-buttons">
                    <a href="appointments.jsp" class="btn btn-primary">
                        📋 Back to Appointments
                    </a>
                    
                    <% if ("PENDING".equals(appointment.getStatus()) || "CONFIRMED".equals(appointment.getStatus())) { %>
                        <a href="appointment?action=cancel&appointmentId=<%= appointment.getAppointment_id() %>" 
                           class="btn btn-danger"
                           onclick="return confirm('Are you sure you want to cancel this appointment?')">
                            ❌ Cancel Appointment
                        </a>
                    <% } %>
                    
                    <a href="appointment-booking.jsp" class="btn btn-success">
                        🐕 Book Another Visit
                    </a>
                    
                    <a href="pets.jsp" class="btn btn-secondary">
                        🐾 Browse More Pets
                    </a>
                </div>

            <% } else { %>
                <div style="text-align: center; padding: 3rem;">
                    <h2 style="color: #dc3545; margin-bottom: 1rem;">Appointment Not Found</h2>
                    <p style="color: #666; margin-bottom: 2rem;">The appointment you're looking for doesn't exist or has been removed.</p>
                    <a href="appointments.jsp" class="btn btn-primary">📋 View All Appointments</a>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>
