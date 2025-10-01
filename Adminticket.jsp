<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html><head><title>Admin Panel</title></head><body>
<h2>Pending Ticket Cancellations</h2>
<table border="1" cellpadding="10">
<tr><th>ID</th><th>Name</th><th>Movie</th><th>Seats</th><th>Status</th><th>Action</th></tr>
<%
try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","root");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM tickets WHERE status='Pending Cancel'");
    while(rs.next()){
%>
<tr>
<td><%=rs.getInt("id")%></td>
<td><%=rs.getString("name")%></td>
<td><%=rs.getString("movie_title")%></td>
<td><%=rs.getString("seats")%></td>
<td><%=rs.getString("status")%></td>
<td>
<form action="ConfirmCancelServlet" method="post">
<input type="hidden" name="ticketId" value="<%=rs.getInt("id")%>">
<button type="submit">Confirm Cancel</button>
</form>
</td>
</tr>
<% } con.close(); } catch(Exception e){ e.printStackTrace(); } %>
</table>
</body>
</html>
