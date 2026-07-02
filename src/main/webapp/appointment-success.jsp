<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PawConnect - Appointment Booked Successfully</title>
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

        .success-container {
            background: white;
            border-radius: 15px;
            padding: 3rem;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            text-align: center;
        }

        .success-icon {
            font-size: 4rem;
            color: #28a745;
            margin-bottom: 1rem;
        }

        .success-title {
            color: #28a745;
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .success-message {
            color: #666;
            font-size: 1.2rem;
            margin-bottom: 2rem;
        }

        .appointment-details {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            text-align: left;
        }

        .appointment-details h3 {
            color: #8B5FBF;
            margin-bottom: 1rem;
            text-align: center;
        }

        .detail-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 0.8rem;
            padding-bottom: 0.8rem;
            border-bottom: 1px solid #e1e1e1;
        }

        .detail-row:last-child {
            border-bottom: none;
            margin-bottom: 0;
            padding-bottom: 0;
        }

        .detail-label {
            font-weight: 600;
            color: #333;
        }

        .detail-value {
            color: #666;
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
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

        .status-badge {
            display: inline-block;
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 500;
            background: #ffc107;
            color: #333;
        }

        @media (max-width: 768px) {
            .nav-links {
                display: none;
            }
            
            .main-content {
                margin-top: 80px;
                padding: 1rem;
            }
            
            .success-container {
                padding: 2rem 1rem;
            }
            
            .action-buttons {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
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
        <div class="success-container">
            <div class="success-icon">✅</div>
            <h1 class="success-title">Appointment Booked Successfully!</h1>
            <p class="success-message">Your pet visit appointment has been scheduled. We'll contact you soon to confirm the details.</p>

            <% if (request.getAttribute("appointment") != null) { %>
                <% 
                    com.servlet.adoption.model.Appointment appointment = 
                        (com.servlet.adoption.model.Appointment) request.getAttribute("appointment");
                    com.servlet.adoption.model.Pets pet = 
                        (com.servlet.adoption.model.Pets) request.getAttribute("pet");
                %>
                
                <div class="appointment-details">
                    <h3>📋 Appointment Details</h3>
                    
                    <div class="detail-row">
                        <span class="detail-label">Appointment ID:</span>
                        <span class="detail-value">#<%= appointment.getAppointment_id() %></span>
                    </div>
                    
                    <div class="detail-row">
                        <span class="detail-label">Pet Name:</span>
                        <span class="detail-value"><%= appointment.getPet_name() %></span>
                    </div>
                    
                    <div class="detail-row">
                        <span class="detail-label">Your Name:</span>
                        <span class="detail-value"><%= appointment.getUser_name() %></span>
                    </div>
                    
                    <div class="detail-row">
                        <span class="detail-label">Email:</span>
                        <span class="detail-value"><%= appointment.getUser_email() %></span>
                    </div>
                    
                    <div class="detail-row">
                        <span class="detail-label">Phone:</span>
                        <span class="detail-value"><%= appointment.getUser_phone() %></span>
                    </div>
                    
                    <div class="detail-row">
                        <span class="detail-label">Visit Location:</span>
                        <span class="detail-value"><%= appointment.getLocation() %></span>
                    </div>
                    
                    <div class="detail-row">
                        <span class="detail-label">Date & Time:</span>
                        <span class="detail-value">
                            <%= appointment.getAppointment_datetime().toLocalDate() %> at 
                            <%= appointment.getAppointment_datetime().toLocalTime().toString().substring(0, 5) %>
                        </span>
                    </div>
                    
                    <div class="detail-row">
                        <span class="detail-label">Status:</span>
                        <span class="detail-value">
                            <span class="status-badge"><%= appointment.getStatus() %></span>
                        </span>
                    </div>
                    
                    <% if (appointment.getMessage() != null && !appointment.getMessage().isEmpty()) { %>
                        <div class="detail-row">
                            <span class="detail-label">Message:</span>
                            <span class="detail-value"><%= appointment.getMessage() %></span>
                        </div>
                    <% } %>
                </div>
            <% } %>

            <div class="action-buttons">
                <a href="appointments.jsp?action=list&userEmail=<%= request.getAttribute("userEmail") %>" class="btn btn-primary">
                    📅 View My Appointments
                </a>
                <a href="pets.jsp" class="btn btn-secondary">
                    🐕 Browse More Pets
                </a>
                <a href="home.jsp" class="btn btn-success">
                    🏠 Back to Home
                </a>
            </div>
        </div>
    </div>
</body>
</html>
