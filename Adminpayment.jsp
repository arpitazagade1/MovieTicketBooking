<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Records</title>
<style>
    table, th, td {
        border: 1px solid black;
        border-collapse: collapse;
        padding: 8px;
    }
    th {
        background-color: #f2f2f2;
    }
</style>
</head>
<body>
<h2>Payment Records</h2>
<table>
<tr>
<th>Payment_Id</th>
<th>Card_No</th>
<th>Expiry_date</th>
<th>CVV</th>
<th>Amount</th>
<th>Card_holder</th>
<th>Ticket_Id</th>
<th>Customer_Name</th>
<th>Movie_Title</th>
<th>Cinema_Name</th>
</tr>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","root");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM payment2");

    while(rs.next()){
%>
<tr>
<td><%= rs.getInt("id") %></td>
<td><%= rs.getString("card_number") %></td>
<td><%= rs.getString("expiry_date") %></td>
<td><%= rs.getString("cvv") %></td>
<td><%= rs.getString("Amount") %></td>
<td><%= rs.getString("card_holder") %></td>
<td><%= rs.getString("ticket_id") %></td>
<td><%= rs.getString("customer_name") %></td>
<td><%= rs.getString("movie_title") %></td>
<td><%= rs.getString("cinema_name") %></td>
</tr>
<%
    }
    rs.close();
    st.close();
    con.close();
} catch(Exception e){
    out.println("<tr><td colspan='10'>Error: " + e.getMessage() + "</td></tr>");
}
%>

</table>
</body>
</html>
