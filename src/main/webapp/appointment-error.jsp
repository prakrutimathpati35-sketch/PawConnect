<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PawConnect - Appointment Error</title>
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

        .error-container {
            background: white;
            border-radius: 15px;
            padding: 3rem;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            text-align: center;
        }

        .error-icon {
            font-size: 4rem;
            color: #dc3545;
            margin-bottom: 1rem;
        }

        .error-title {
            color: #dc3545;
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .error-message {
            color: #666;
            font-size: 1.2rem;
            margin-bottom: 2rem;
        }

        .error-details {
            background: #f8d7da;
            border: 1px solid #f5c6cb;
            border-radius: 10px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            text-align: left;
        }

        .error-details h3 {
            color: #721c24;
            margin-bottom: 0.5rem;
        }

        .error-text {
            color: #721c24;
            margin-bottom: 1rem;
        }

        .suggestions {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            text-align: left;
        }

        .suggestions h3 {
            color: #8B5FBF;
            margin-bottom: 1rem;
            text-align: center;
        }

        .suggestion-list {
            list-style: none;
        }

        .suggestion-list li {
            margin-bottom: 0.8rem;
            padding-left: 1.5rem;
            position: relative;
        }

        .suggestion-list li:before {
            content: "💡";
            position: absolute;
            left: 0;
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

        @media (max-width: 768px) {
            .nav-links {
                display: none;
            }
            
            .main-content {
                margin-top: 80px;
                padding: 1rem;
            }
            
            .error-container {
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
        <div class="error-container">
            <div class="error-icon">❌</div>
            <h1 class="error-title">Appointment Booking Failed</h1>
            <p class="error-message">We encountered an issue while processing your appointment request.</p>

            <% if (request.getAttribute("error") != null) { %>
                <div class="error-details">
                    <h3>🚨 Error Details</h3>
                    <div class="error-text">
                        <%= request.getAttribute("error") %>
                    </div>
                </div>
            <% } %>

            <div class="suggestions">
                <h3>💡 What You Can Do</h3>
                <ul class="suggestion-list">
                    <li>Check that all required fields are filled correctly</li>
                    <li>Ensure the appointment date and time are in the future</li>
                    <li>Verify that the pet you selected is available for visits</li>
                    <li>Double-check your email and phone number format</li>
                    <li>Try refreshing the page and booking again</li>
                    <li>Contact our support team if the problem persists</li>
                </ul>
            </div>

            <div class="action-buttons">
                <a href="appointment-booking.jsp" class="btn btn-primary">
                    🔄 Try Again
                </a>
                <a href="pets.jsp" class="btn btn-secondary">
                    🐕 Browse Pets
                </a>
                <a href="contact.jsp" class="btn btn-success">
                    📞 Contact Support
                </a>
            </div>
        </div>
    </div>
</body>
</html>
