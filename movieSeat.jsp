<%@ page contentType="text/html;charset=UTF-8" isELIgnored="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Movie Seat Booking</title>
  <link rel="stylesheet" href="css/movie-seat.css">
</head>
<body>
<%
String prime1 = (String) session.getAttribute("price_prime");
String classicplus1 = (String) session.getAttribute("price_classic_plus");
String classic1 = (String) session.getAttribute("price_classic");

String cinema1 = (String) session.getAttribute("cinema_name"); 
String Title1  = (String) session.getAttribute("title");
String Lang1   = (String) session.getAttribute("movie_langauge");
String Time1   = (String) session.getAttribute("time");

String selectedTime = request.getParameter("time");
session.setAttribute("selectedTime", selectedTime);
String date = request.getParameter("date");
session.setAttribute("date", date);
%>
  <div class="container">
    <header>
      <h1>Movie Seat Booking</h1>
      <p>Select your preferred seats for the movie</p>
    </header>
    
    <div class="movie-info">
      <h2>Avengers: Endgame</h2>
      <div class="info-grid">
        <div class="info-item"><strong>Time:</strong> <%=selectedTime %></div>
        <div class="info-item"><strong>Language:</strong> <%=Lang1 %></div>
        <div class="info-item"><strong>Theater:</strong> <%=cinema1 %></div>
        <div class="info-item"><strong>Date:</strong> <%=date%></div>
      </div>
    </div>
    
    <div class="screen">movie:<%=Title1 %></div>
    
    <div class="seat-section">
      <div class="section-title">&#8377; <%=prime1 %> PREMIUM</div>
      <div id="premium"></div>
    </div>
    
    <div class="seat-section">
      <div class="section-title"> &#8377; <%=classicplus1 %>EXECUTIVE</div>
      <div id="executive"></div>
    </div>
    
    <div class="seat-section">
      <div class="section-title">&#8377; <%=classic1 %> NORMAL</div>
      <div id="normal"></div>
    </div>
    
    <div class="legend">
      <div class="legend-item">
        <span class="legend-color" style="background-color:#ffdd57; border-color:#ffcc24"></span>
        <span>Bestseller</span>
      </div>
      <div class="legend-item">
        <span class="legend-color" style="background-color:#ecf0f1; border:2px solid #3498db"></span>
        <span>Available</span>
      </div>
      <div class="legend-item">
        <span class="legend-color" style="background-color:#2ecc71; border-color:#27ae60"></span>
        <span>Selected</span>
      </div>
      <div class="legend-item">
        <span class="legend-color" style="background-color:#95a5a6; border-color:#7f8c8d"></span>
        <span>Sold</span>
      </div>
      <div class="legend-item">
        <span class="legend-color" style="background-color:#dcdde1; border-color:#7f8c8d"></span>
        <span>Disabled</span>
      </div>
    </div>
    <div class="booking-summary">
      <div class="summary-title">Booking Summary</div>
      <div class="summary-content">
        <div class="summary-item">
          <div>Selected Seats</div>
          <div class="summary-value" id="selected-seats">None</div>
        </div>
        <div class="summary-item">
          <div>Total Price</div>
          <div class="summary-value">₹<span id="total-price">0</span></div>
        </div>
      </div>
    </div>
    <div class="action-buttons">
      <button class="btn btn-secondary" id="reset-btn">Reset Selection</button>
      <!-- Booking form for session transfer -->
<form id="booking-form" action="seatBookingSession.jsp" method="post">
  <input type="hidden" name="selectedSeats" id="form-selected-seats">
  <input type="hidden" name="totalPrice" id="form-total-price">
  <button type="button" class="btn btn-primary" id="book-btn" disabled>Proceed to Booking</button>
</form>

    </div>
    
    <div class="confirmation" id="confirmation">
      <h3>Booking Successful!</h3>
      <p>Your seats have been successfully booked.</p>
      <p>Seats: <span id="confirmed-seats"></span></p>
      <p>Total: ₹<span id="confirmed-price"></span></p>
    </div>
  </div>

  <script src="js/movie-seat.js"></script>
</body>
</html>
