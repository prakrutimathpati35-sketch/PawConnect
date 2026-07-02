<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.servlet.adoption.dao.PetDAO" %>
<%@ page import="com.servlet.adoption.dao.PetDAOImpl" %>
<%@ page import="com.servlet.adoption.model.Pets" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adopt a Pet - PawConnect</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
   <jsp:include page="header.jsp" />
    <div class="main-content">
    
    <section class="pets-section">
        <div class="container">
            <div class="section-title">
                <h2>Available Pets for Adoption</h2>
                <p>Find your perfect furry companion from our loving pets</p>
            </div>
            
            <!-- ADDED: Success message for adoption -->
            <%
            String adoption = request.getParameter("adoption");
            String petParam = request.getParameter("pet");
            
            // Initialize pets list from database
            PetDAO petDAO = new PetDAOImpl();
            List<Pets> petsList = petDAO.getAllPets();
            
            if("success".equals(adoption) && petParam != null) {
            %>
                <div class="success-message" style="background: #e8f5e8; color: #2e7d32; padding: 12px; border-radius: 8px; margin-bottom: 20px; border: 1px solid #c8e6c9; text-align: center;">
                    Thank you! Your adoption application for <%= petParam %> has been submitted successfully.
                </div>
            <%
            }
            %>
            
            <div class="filters-container">
                <div class="filters">
                    <select id="speciesFilter">
                        <option value="">All Species</option>
                        <option value="Dog">🐕 Dogs</option>
                        <option value="Cat">🐱 Cats</option>
                        <option value="Bird">🐦 Birds</option>
                        <option value="Fish">🐠 Fishes</option>
                    </select>
                    <select id="ageFilter">
                        <option value="">Any Age</option>
                        <option value="0-1">🐾 Puppy/Kitten (0-1)</option>
                        <option value="1-3">🌟 Young (1-3)</option>
                        <option value="4-7">🐶 Adult (4-7)</option>
                        <option value="8+">👴 Senior (8+)</option>
                    </select>
                    <button class="btn btn-secondary" onclick="resetFilters()">Reset Filters</button>
                </div>
                <div class="pets-count">
                    <span id="petsCount"><%= petsList != null ? petsList.size() : 0 %></span> pets available for adoption
                </div>
            </div>
            
            <div class="pets-grid">
                <%
                if(petsList != null && !petsList.isEmpty()) {
                    for(Pets pet : petsList) {
                        String ageTag = "";
                        String speciesIcon = "";
                        
                        // Determine age tag
                        int age = pet.getAge();
                        if(age <= 1) {
                            if("Cat".equalsIgnoreCase(pet.getSpecies())) {
                                ageTag = "kitten-tag";
                            } else if("Dog".equalsIgnoreCase(pet.getSpecies())) {
                                ageTag = "puppy-tag";
                            } else {
                                ageTag = "young-tag";
                            }
                        } else if(age <= 3) {
                            ageTag = "young-tag";
                        } else if(age <= 7) {
                            ageTag = "adult-tag";
                        } else {
                            ageTag = "senior-tag";
                        }
                        
                        // Determine species icon
                        if("Dog".equalsIgnoreCase(pet.getSpecies())) {
                            speciesIcon = "🐕";
                        } else if("Cat".equalsIgnoreCase(pet.getSpecies())) {
                            speciesIcon = "🐱";
                        } else if("Bird".equalsIgnoreCase(pet.getSpecies())) {
                            speciesIcon = "🐦";
                        } else if("Fish".equalsIgnoreCase(pet.getSpecies())) {
                            speciesIcon = "🐠";
                        }
                        
                        // Get image URL or use default
                        String imageUrl = pet.getImageUrl();
                        if(imageUrl == null || imageUrl.trim().isEmpty()) {
                            imageUrl = "https://via.placeholder.com/300x200?text=" + pet.getPetName();
                        }
                %>
                    <div class="pet-card" data-species="<%= pet.getSpecies() %>" data-age="<%= pet.getAge() %>">
                        <div class="pet-image">
                            <img src="<%= imageUrl %>" alt="<%= pet.getPetName() %>">
                            <div class="pet-tag <%= ageTag %>"><%= ageTag.replace("-tag", "").substring(0, 1).toUpperCase() + ageTag.replace("-tag", "").substring(1) %></div>
                        </div>
                        <div class="pet-info">
                            <h3><%= pet.getPetName() %></h3>
                            <span class="species-tag <%= pet.getSpecies().toLowerCase() %>-tag"><%= speciesIcon %> <%= pet.getSpecies() %></span>
                            <p><strong>Breed:</strong> <%= pet.getBreed() %></p>
                            <p><strong>Age:</strong> <%= pet.getAge() %> year<%= pet.getAge() > 1 ? "s" : "" %></p>
                            <p><strong>Gender:</strong> <%= pet.getGender() %></p>
                            <p class="pet-location">📍 <%= pet.getLocation() %></p>
                            <div class="pet-actions">
                                <button class="btn btn-primary" onclick="openAdoptionForm(<%= pet.getPet_Id() %>, '<%= pet.getPetName() %>')">Adopt Me</button>
                                <button class="btn btn-secondary" onclick="bookVisit(<%= pet.getPet_Id() %>, '<%= pet.getPetName() %>', '<%= pet.getLocation() %>')" style="background-color: transparent !important; color: #000000 !important; border: 2px solid #000000 !important; font-weight: 600 !important;" onmouseover="this.style.backgroundColor='#8B5FBF'; this.style.color='#ffffff'; this.style.borderColor='#8B5FBF';" onmouseout="this.style.backgroundColor='transparent'; this.style.color='#000000'; this.style.borderColor='#000000';">📅 Book Visit</button>
                            </div>
                        </div>
                    </div>
                <%
                    }
                } else {
                %>
                    <div style="text-align: center; padding: 50px; grid-column: 1 / -1;">
                        <h3>No pets available for adoption at the moment.</h3>
                        <p>Please check back later or contact us for more information.</p>
                    </div>
                <%
                }
                %>
            </div>
        </div>
    </section>


    <!-- Adoption Form Modal - FIXED SCROLLING -->
    <div id="adoptionModal" class="modal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.8); z-index: 9999; overflow: auto; padding: 20px 0;">
        <div class="modal-content" style="background: white; max-width: 500px; margin: 50px auto; padding: 30px; border-radius: 15px; position: relative;">
            <span onclick="closeAdoptionForm()" style="position: absolute; right: 20px; top: 15px; font-size: 30px; cursor: pointer; color: #000; font-weight: bold;">&times;</span>
            <h2 id="modalTitle">Adoption Application</h2>
            <form  action ="AdoptServlet"  method="post">
                <input type="hidden" id="petId" name="petId">
                <input type="hidden" id="petName" name="petName">
                
                <div class="form-group">
                    <label for="fullName">Full Name *</label>
                    <input type="text" id="fullName" name="fullName" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email *</label>
                    <input type="email" id="email" name="email" required>
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone *</label>
                    <input type="tel" id="phone" name="phone" required>
                </div>
                
                <div class="form-group">
                    <label for="address">Address</label>
                    <textarea id="address" name="address" rows="3"></textarea>
                </div>
                
                <div class="form-group">
                    <label for="message">Why do you want to adopt this pet?</label>
                    <textarea id="message" name="message" rows="4"></textarea>
                </div>
                
                <button type="submit" class="btn btn-primary" >Submit Application</button>
            </form>
        </div>
    </div>
    </div>

    <%@ include file="footer.jsp" %>
    
    <script>
    
    function openAdoptionForm(petId, petName) {
	    <%
	    if(session.getAttribute("user") == null) {
	    %>
	        if(confirm('Please login to adopt a pet. Would you like to login now?')) {
	            window.location.href = 'login.jsp?redirect=' + encodeURIComponent('pets.jsp?action=adopt&pet=' + petId);
	        }
	    <%
	    } else {
	    %>
	        document.getElementById('petId').value = petId;
	        document.getElementById('petName').value = petName;
	        document.getElementById('adoptionModal').style.display = 'block';
	        document.getElementById('modalTitle').textContent = 'Adopt ' + petName;
	        
	        // Simple scroll to top
	        window.scrollTo(0, 0);
	        
	        // Focus on the first input field
	        setTimeout(function() {
	            document.getElementById('fullName').focus();
	        }, 100);
	    <%
	    }
	    %>
	}

	function closeAdoptionForm() {
	    document.getElementById('adoptionModal').style.display = 'none';
	}

	function bookVisit(petId, petName, petLocation) {
	    <%
	    if(session.getAttribute("user") == null) {
	    %>
	        if(confirm('Please login to book a visit. Would you like to login now?')) {
	            window.location.href = 'login.jsp?redirect=' + encodeURIComponent('appointment-booking.jsp?petId=' + petId + '&petName=' + encodeURIComponent(petName));
	        }
	    <%
	    } else {
	    %>
	        // Redirect to appointment booking page with pre-filled pet information
	        window.location.href = 'appointment-booking.jsp?petId=' + petId + '&petName=' + encodeURIComponent(petName) + '&petLocation=' + encodeURIComponent(petLocation);
	    <%
	    }
	    %>
	}

        function resetFilters() {
            document.getElementById('speciesFilter').value = '';
            document.getElementById('ageFilter').value = '';
            filterPets();
        }

        // Filter functionality
        document.addEventListener('DOMContentLoaded', function() {
            const speciesFilter = document.getElementById('speciesFilter');
            const ageFilter = document.getElementById('ageFilter');
            const petCards = document.querySelectorAll('.pet-card');
            
            function filterPets() {
                const selectedSpecies = speciesFilter.value;
                const selectedAge = ageFilter.value;
                let visibleCount = 0;
                
                petCards.forEach(card => {
                    const species = card.getAttribute('data-species');
                    const age = parseInt(card.getAttribute('data-age'));
                    
                    let speciesMatch = selectedSpecies === '' || species === selectedSpecies;
                    let ageMatch = selectedAge === '' || checkAgeRange(age, selectedAge);
                    
                    if (speciesMatch && ageMatch) {
                        card.style.display = 'block';
                        visibleCount++;
                    } else {
                        card.style.display = 'none';
                    }
                });
                
                document.getElementById('petsCount').textContent = visibleCount;
            }
            
            function checkAgeRange(age, range) {
                switch(range) {
                    case '0-1': return age >= 0 && age <= 1;
                    case '1-3': return age >= 1 && age <= 3;
                    case '4-7': return age >= 4 && age <= 7;
                    case '8+': return age >= 8;
                    default: return true;
                }
            }
            
            speciesFilter.addEventListener('change', filterPets);
            ageFilter.addEventListener('change', filterPets);
            
            // Initialize count
            filterPets();
        });

        // Close modal when clicking outside
        window.onclick = function(event) {
            const modal = document.getElementById('adoptionModal');
            if (event.target === modal) {
                closeAdoptionForm();
            }
        }

        // Close modal with Escape key
        document.addEventListener('keydown', function(event) {
            if (event.key === 'Escape') {
                closeAdoptionForm();
            }
        });
    </script>
</body>
</html>