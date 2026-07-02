<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PawConnect - Book Pet Visit</title>
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

        .booking-container {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        .booking-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .booking-header h1 {
            color: #8B5FBF;
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
        }

        .booking-header p {
            color: #666;
            font-size: 1.1rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #333;
            font-weight: 500;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 0.8rem;
            border: 2px solid #e1e1e1;
            border-radius: 8px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #8B5FBF;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
        }

        .submit-btn {
            background: linear-gradient(135deg, #8B5FBF 0%, #6A4C93 100%);
            color: white;
            padding: 1rem 2rem;
            border: none;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 500;
            cursor: pointer;
            transition: transform 0.3s ease;
            width: 100%;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
        }

        .pet-info {
            background: #f8f9fa;
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 1.5rem;
        }

        .pet-info h3 {
            color: #8B5FBF;
            margin-bottom: 0.5rem;
        }

        .error-message {
            color: #dc3545;
            background: #f8d7da;
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 1rem;
        }

        @media (max-width: 768px) {
            .form-row {
                grid-template-columns: 1fr;
            }
            
            .nav-links {
                display: none;
            }
            
            .main-content {
                margin-top: 80px;
                padding: 1rem;
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
        <div class="booking-container">
            <div class="booking-header">
                <h1>🐕 Book a Pet Visit</h1>
                <p>Schedule a visit to meet your potential new family member</p>
            </div>

            <%-- Error Message Display --%>
            <% if (request.getAttribute("error") != null) { %>
                <div class="error-message">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <form action="appointment" method="post">
                <input type="hidden" name="action" value="book">
                
                <%-- Pet Information --%>
                <div class="pet-info">
                    <h3>Pet Information</h3>
                    <div class="form-group">
                        <label for="petId">Select Pet:</label>
                        <select name="petId" id="petId" required>
                            <option value="">Choose a pet to visit...</option>
                            <%-- This would be populated dynamically from database --%>
                            <option value="1">Buddy - Golden Retriever</option>
                            <option value="2">Luna - Persian Cat</option>
                            <option value="3">Max - German Shepherd</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="petName">Pet Name:</label>
                        <input type="text" name="petName" id="petName" required readonly>
                    </div>
                </div>

                <%-- Your Information --%>
                <h3 style="margin-bottom: 1rem; color: #8B5FBF;">Your Information</h3>
                <div class="form-group">
                    <label for="userName">Full Name:</label>
                    <input type="text" name="userName" id="userName" required 
                           placeholder="Enter your full name">
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="userEmail">Email:</label>
                        <input type="email" name="userEmail" id="userEmail" required 
                               placeholder="your.email@example.com">
                    </div>
                    <div class="form-group">
                        <label for="userPhone">Phone Number:</label>
                        <input type="tel" name="userPhone" id="userPhone" required 
                               placeholder="+1 (555) 123-4567">
                    </div>
                </div>

                <%-- Visit Details --%>
                <h3 style="margin-bottom: 1rem; color: #8B5FBF;">Visit Details</h3>
                <div class="form-group">
                    <label for="location">Preferred Visit Location:</label>
                    <input type="text" name="location" id="location" required 
                           placeholder="Enter your address for the visit">
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="appointmentDate">Preferred Date:</label>
                        <input type="date" name="appointmentDate" id="appointmentDate" required>
                    </div>
                    <div class="form-group">
                        <label for="appointmentTime">Preferred Time:</label>
                        <select name="appointmentTime" id="appointmentTime" required>
                            <option value="">Select time...</option>
                            <option value="09:00">9:00 AM</option>
                            <option value="10:00">10:00 AM</option>
                            <option value="11:00">11:00 AM</option>
                            <option value="14:00">2:00 PM</option>
                            <option value="15:00">3:00 PM</option>
                            <option value="16:00">4:00 PM</option>
                            <option value="17:00">5:00 PM</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="message">Additional Message (Optional):</label>
                    <textarea name="message" id="message" rows="4" 
                              placeholder="Any special requirements or questions..."></textarea>
                </div>

                <button type="submit" class="submit-btn">📅 Book Visit Appointment</button>
            </form>
        </div>
    </div>

    <script>
        // Set minimum date to today
        document.getElementById('appointmentDate').min = new Date().toISOString().split('T')[0];
        
        // Handle pre-filled parameters from URL
        function handleUrlParameters() {
            const urlParams = new URLSearchParams(window.location.search);
            const petId = urlParams.get('petId');
            const petName = urlParams.get('petName');
            const petLocation = urlParams.get('petLocation');
            
            if (petId) {
                document.getElementById('petId').value = petId;
                // Update pet name field
                if (petName) {
                    document.getElementById('petName').value = decodeURIComponent(petName);
                }
                // Update location field
                if (petLocation) {
                    document.getElementById('location').value = decodeURIComponent(petLocation);
                }
                // Update pet dropdown if it exists
                const petDropdown = document.getElementById('petId');
                if (petDropdown) {
                    petDropdown.value = petId;
                }
            }
        }
        
        // Update pet name when pet is selected
        document.getElementById('petId').addEventListener('change', function() {
            const selectedOption = this.options[this.selectedIndex];
            const petNameInput = document.getElementById('petName');
            
            if (selectedOption.value) {
                // Extract pet name from option text
                const petName = selectedOption.text.split(' - ')[0];
                petNameInput.value = petName;
            } else {
                petNameInput.value = '';
            }
        });
        
        // Initialize URL parameters when page loads
        document.addEventListener('DOMContentLoaded', function() {
            handleUrlParameters();
        });
    </script>
</body>
</html>
