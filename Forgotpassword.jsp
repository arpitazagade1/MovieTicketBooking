<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>

body {
  font-family: "Arial", sans-serif;
  margin: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  background: #ffa07a; /* Warna orange cerah */
  color: #333;
}

.container {
  width: 100%;
  max-width: 400px;
}

.card {
  background-color: #fff;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

h2 {
  text-align: center;
  color: #333;
}

form {
  display: flex;
  flex-direction: column;
}

input {
  padding: 10px;
  margin-bottom: 12px;
  border: 1px solid #ddd;
  border-radius: 4px;
  transition: border-color 0.3s ease-in-out;
  outline: none;
  color: #333;
}

input:focus {
  border-color: #ff8c00; /* Warna orange saat focus */
}

button {
  background-color: #ff8c00; /* Warna orange cerah */
  color: #fff;
  padding: 10px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s ease-in-out;
}

button:hover {
  background-color: #ff7f00; /* Warna orange sedikit lebih gelap saat hover */
}



</style>



<body>

  <%
     String email1 = (String)session.getAttribute("Email");
     int id1 = (Integer)session.getAttribute("Id");
   String phone=(String)session.getAttribute("Phone");
  %>
  <div class="container">
  <div class="card">
    <h2>Login</h2>
    <form action="#" method="get">
    <input type="hidden" name="id" value=<%=id1 %>   required>
      <input type="text" value=<%=email1 %> name="email"placeholder="Email" required>
      <input type="password" id="password" name="Password" placeholder="Password" required>
      <button type="submit" name="Login">Login</button>
    </form>
  </div>
</div>
           
            
            <%
            if(request.getParameter("Login")!=null){
          	 
          	 String Pass= request.getParameter("Password");
          	 int id2 = Integer.parseInt(request.getParameter("id"));
          	  Class.forName("com.mysql.cj.jdbc.Driver");
          	  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root" ,"root");
          	  PreparedStatement ps = con.prepareStatement("update projectuser set user_password=? where u_id=?");
          	  ps.setString(1, Pass);
          	  ps.setInt(2, id2);
          	
          	ps.executeUpdate();
           	  response.sendRedirect("Profile.jsp");
          		
            }
            
            %>
           
            
            
</body>
</html>