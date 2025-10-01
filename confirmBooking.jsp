    
<%@ page contentType="text/html;charset=UTF-8" %>
  <%@page import=" java.sql.*" %>
<%
  String selectedSeats = (String) session.getAttribute("selectedSeats");
  String totalPrice = (String) session.getAttribute("totalPrice");

  String[] seatsArray = selectedSeats != null ? selectedSeats.split(",") : new String[0];
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Secure Payment</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    :root {
        --primary-color: #0d47a1;
        --secondary-color: #50e3c2;
        --text-color: #333;
        --bg-light: #f4f7f9;
        --card-bg: #ffffff;
        --border-color: #e0e6ed;
    }
    body {
        font-family: 'Poppins', sans-serif;
        background-color: var(--bg-light);
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
    }
    .payment-container {
        width: 100%;
        max-width: 800px;
        background-color: var(--card-bg);
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: column;
        padding: 30px;
    }
    .payment-header {
        text-align: center;
        margin-bottom: 20px;
    }
    .payment-header h1 {
        font-size: 2em;
        color: var(--primary-color);
        margin: 0;
    }
    .payment-content {
        display: flex;
        gap: 30px;
        flex-direction: column;
    }
    @media (min-width: 768px) {
        .payment-content {
            flex-direction: row;
        }
    }
    .order-summary, .payment-options {
        flex: 1;
    }
    .order-summary {
        padding: 20px;
        border: 1px solid var(--border-color);
        border-radius: 8px;
    }
    .order-summary h2 {
        font-size: 1.2em;
        margin-top: 0;
        margin-bottom: 20px;
        padding-bottom: 10px;
        border-bottom: 2px solid var(--border-color);
        color: var(--text-color);
    }
    .summary-item {
        display: flex;
        justify-content: space-between;
        margin-bottom: 10px;
    }
    .summary-item.total {
        font-weight: 600;
        font-size: 1.1em;
        padding-top: 10px;
        border-top: 1px dashed var(--border-color);
    }
    .payment-tabs {
        display: flex;
        justify-content: space-around;
        margin-bottom: 20px;
        border-bottom: 2px solid var(--border-color);
    }
    .payment-tabs .tab {
        padding: 15px 10px;
        cursor: pointer;
        font-weight: 500;
        color: #888;
        transition: color 0.3s, border-bottom 0.3s;
        border-bottom: 2px solid transparent;
    }
    .payment-tabs .tab.active {
        color: var(--primary-color);
        border-bottom: 2px solid var(--primary-color);
    }
    .payment-tab-content {
        padding: 20px;
        border: 1px solid var(--border-color);
        border-radius: 8px;
    }
    .payment-tab-content h2 {
        font-size: 1.2em;
        margin-top: 0;
        margin-bottom: 20px;
        padding-bottom: 10px;
        border-bottom: 2px solid var(--border-color);
    }
    .input-group {
        margin-bottom: 15px;
    }
    .input-group label {
        display: block;
        margin-bottom: 5px;
        font-weight: 500;
    }
    .input-group input, .input-group select {
        width: 100%;
        padding: 10px;
        border: 1px solid var(--border-color);
        border-radius: 5px;
        box-sizing: border-box;
    }
    .card-details-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 15px;
    }
    .bank-list {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
    }
    .bank-item {
        padding: 10px 15px;
        border: 1px solid var(--border-color);
        border-radius: 5px;
        cursor: pointer;
    }
    .bank-item:hover {
        background-color: var(--bg-light);
    }
    .secure-info {
        text-align: center;
        margin-top: 20px;
        color: #888;
        font-size: 0.9em;
    }
    .pay-button {
        width: 100%;
        padding: 15px;
        background-color: var(--primary-color);
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 1.1em;
        cursor: pointer;
        transition: background-color 0.3s;
        margin-top: 20px;
    }
    .pay-button:hover {
        background-color: #0a3d8b;
    }
    .hidden {
        display: none;
    }
</style>
</head>
<body>

<%

String Title1  = (String) session.getAttribute("title");
String cinema1 = (String) session.getAttribute("cinema_name"); 
String Time1   = (String) session.getAttribute("selectedTime");

%>

    <div class="payment-container">
        <div class="payment-header">
            <h1>Secure Checkout</h1>
        </div>
        <div class="payment-content">
            <div class="order-summary">
                <h2>Order Summary</h2>
                <div class="summary-item">
                    <span>Movie:</span>
                    <span><%=Title1 %></span>
                </div>
                 <div class="summary-item">
                    <span>Threater:</span>
                    <span>   <%=cinema1 %></span>
                </div>
                 <div class="summary-item">
                    <span>Time:</span>
                    <span><%=Time1 %></span>
                </div>
                <div class="summary-item">
                    <span>Seats Booked:</span>
                    <span><% for(int i=0; i<seatsArray.length; i++) { %>
  <%= seatsArray[i] %> <% if(i<seatsArray.length-1) out.print(", "); %>
<% } %></span>
                </div>
                <div class="summary-item total">
                    <span>Total Amount:</span>
                    <span>₹<%= totalPrice %></span>
                </div>
            </div>
            
            <div class="payment-options">
                <div class="payment-tabs">
                    <div class="tab active" data-tab="cards">Cards</div>
                   
                </div>

                <div class="payment-tab-content" id="cards">
                    <h2>Credit / Debit Card</h2>
                    <form action="#" method="get">
                    <div class="input-group">
                        <label for="card-number">Card Number</label>
                        <input type="text" name="cardnumber" placeholder="Enter 16 digit card number" 
         maxlength="16" 
         pattern="\d{16}" 
         oninput="this.value=this.value.replace(/[^0-9]/g,'')"  required>
                    </div>
                    <div class="card-details-grid">
                        <div class="input-group">
                            <label for="expiry-date">Expiry Date</label>
                            <input type="text" name="expirydate"   placeholder="MM/YY" 
         maxlength="5" 
         pattern="(0[1-9]|1[0-2])\/\d{2}" 
         oninput="this.value=this.value.replace(/[^0-9\/]/g,'')"  required>
                        </div>
                        <div class="input-group">
                            <label for="cvv">CVV</label>
                            <input type="text" name="cvv" placeholder="CVV"  maxlength="3" 
         pattern="\d{3}" 
         oninput="this.value=this.value.replace(/[^0-9]/g,'')"  required>
                        </div>
                         <div class="input-group">
                            <label for="cvv">Amount</label>
                            <input type="text" name="amount" value="<%= totalPrice %>" readonly required>
                        </div>
                    </div>
                    <div class="input-group">
                        <label for="card-holder">Card Holder Name</label>
                        <input type="text" name="cardholder" placeholder="Enter name on card" required>
                    </div>
                </div>
                <div class="secure-info">
                    <i class="fas fa-lock"></i> Your information is secured with SSL encryption.
                </div>
                <button class="pay-button" name="submit" type="submit">Pay Now</button>
            </div>
            </form>
        </div>
    </div>
    <%
if(request.getParameter("submit") != null){
    String Cardno = request.getParameter("cardnumber");
    String Expirydate = request.getParameter("expirydate");
    String Cvv = request.getParameter("cvv");
    String Amount = request.getParameter("amount");
    String Cardholder = request.getParameter("cardholder");
    String customerName = (String) session.getAttribute("Name");
    String movieTitle = (String) session.getAttribute("title");
    String cinemaName = (String) session.getAttribute("cinema_name");

    // Validation
    if(Cardno == null || !Cardno.matches("\\d{16}")){
        out.println("<script>alert('Invalid Card Number (16 digits)')</script>");
        return;
    }
    if(Expirydate == null || !Expirydate.matches("(0[1-9]|1[0-2])/\\d{2}")){
        out.println("<script>alert('Invalid Expiry Date (MM/YY)')</script>");
        return;
    }
    if(Cvv == null || !Cvv.matches("\\d{3}")){
        out.println("<script>alert('Invalid CVV (3 digits)')</script>");
        return;
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/demo", "root", "root");

        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO payment2 (card_number, expiry_date, cvv, Amount, card_holder, customer_name, movie_title, cinema_name) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?,?)");

        ps.setString(1, Cardno);
        ps.setString(2, Expirydate);
        ps.setString(3, Cvv);
        ps.setString(4, Amount);
        ps.setString(5, Cardholder);
        ps.setString(6, customerName);
        ps.setString(7, movieTitle);
        ps.setString(8, cinemaName);

        ps.executeUpdate();

        out.println("<script>alert('Payment Successful!');</script>");
        response.sendRedirect("Ticket.jsp");

        con.close();
    } catch(Exception e) {
        e.printStackTrace();
        out.println("<script>alert('Database Error: " + e.getMessage() + "');</script>");
    }
}
%>
   
    
</body>
</html>



</body>
</html>