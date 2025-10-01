<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String ticketStatus = request.getParameter("status") != null ? request.getParameter("status") : "Booked";
String ticketIdParam = request.getParameter("ticketId");
int ticketId = ticketIdParam != null ? Integer.parseInt(ticketIdParam) : 0;
String name = (String) session.getAttribute("Name");
String Title1  = (String) session.getAttribute("title");
String cinema1 = (String) session.getAttribute("cinema_name"); 
String totalPrice = (String) session.getAttribute("totalPrice");
String selectedSeats = (String) session.getAttribute("selectedSeats");
String Time1   = (String) session.getAttribute("selectedTime");
String Date   = (String) session.getAttribute("date");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ticket</title>
<!-- Optional: auto-refresh every 5 seconds to reflect admin cancellation -->
<meta http-equiv="refresh" content="5;url=TicketServlet?ticketId=<%=ticketId%>">
<style>
body{font-family:Arial; display:flex; justify-content:center; align-items:center; min-height:100vh; background:#1a237e; color:#fff;}
.ticket-container{background:#fff; color:#000; padding:20px; border-radius:10px; width:350px; text-align:center;}
button{padding:10px 20px; background:#ff4500; color:#fff; border:none; border-radius:5px; cursor:pointer;}
button:hover{background:#e03e00;}
.modal{display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.7); justify-content:center; align-items:center;}
.modal-content{background:#fff; padding:20px; border-radius:10px;}
.p strong{
 color: #ff4500;
}
</style>
</head>
<body>


<div class="ticket-container">
<h2>🎬 Ticket Details</h2>

 <p><strong>Name:</strong><%=name %> </p>
  <p><strong>Movie:</strong> <%=Title1 %></p>
   <p><strong>theater:</strong><%=cinema1 %></p>
 <p><strong>Date:</strong><%=Date %></p>
 <p><strong>Time:</strong><%=Time1 %></p>
 <p><strong>Seats:</strong><%=selectedSeats %></p>
 <p><strong>Total:</strong><%=totalPrice %></p>
<p>Status: <b><%=ticketStatus%></b></p>

<% if("Booked".equals(ticketStatus)) { %>
  <button onclick="showModal()">Cancel Ticket</button>
<% } else if("Pending Cancel".equals(ticketStatus)) { %>
  <p style="color:orange;">Cancellation Pending Admin Approval</p>
<% } else if("Cancelled".equals(ticketStatus)) { %>
  <p style="color:red;">Ticket Cancelled</p>
<% } %>
</div>

<div id="modal" class="modal">
<div class="modal-content">
<p>Are you sure you want to cancel the ticket?</p>
<button onclick="confirmCancel(<%=ticketId%>)">Yes, Cancel</button>
<button onclick="hideModal()">No</button>
</div>
</div>
<script>
function showModal(){ document.getElementById('modal').style.display='flex'; }
function hideModal(){ document.getElementById('modal').style.display='none'; }
function confirmCancel(id){
    window.location.href = 'TicketServlet?cancelRequest=true&ticketId='+id;
}
</script>

</body>
</html>
