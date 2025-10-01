<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<table class="table table-bordered">
<tr>
<th>user_id</th>
<th>user_name</th>
<th>user_phone</th>
<th>user_email</th>
<th>user_password</th>
<th>Update</th>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","root");
PreparedStatement ps=con.prepareStatement("select * from projectuser");
ResultSet rs=ps.executeQuery();
while(rs.next()) {
%>
<tr>
<td><%= rs.getInt("u_id") %></td>
<td><%= rs.getString("user_name") %></td>
<td><%= rs.getString("user_phone") %></td>
<td><%= rs.getString("user_email") %></td>
<td><%= rs.getString("user_password") %></td>
<td>
<form action="#" method="post">
<input type="hidden" name="id" value="<%=rs.getInt("u_id") %>">
<button class="btn btn-danger mt-2" type="submit" name="delete">Delete</button>
</form>
</td>

</tr>
<% } %>


</table>
<%

if(request.getParameter("delete")!=null){
    try{
        int Id =Integer.parseInt(request.getParameter("id"));
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","root");
        PreparedStatement ps1=con1.prepareStatement("delete from projectuser where u_id=?");
        ps1.setInt(1,Id);
        ps1.executeUpdate();
        response.sendRedirect("userInformation.jsp");
    }catch(Exception e){
        out.print(e);
    }
}

%>








</body>
</html>