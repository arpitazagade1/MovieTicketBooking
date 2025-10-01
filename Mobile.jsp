<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


<div class="container">
  <div class="card">
    <h2>verify your mobile numbe</h2>
   <form action="#" method="get">
      <input type="tel" name="number" placeholder="Enter mobile No"/>
     <button type="submit" name="verify">verify number</button>
    </form>
  </div>
</div>


<% 
if(request.getParameter("verify")!=null){
	String Phone=request.getParameter("number");    
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","root");
    PreparedStatement ps=con.prepareStatement("select* from projectuser where user_phone=?");
    ps.setString(1,Phone );
    ResultSet rs=ps.executeQuery();
    if(rs.next()){
    	HttpSession ses=request.getSession();
    	ses.setAttribute("Email",rs.getString("user_email"));
    	ses.setAttribute("Id",rs.getInt("u_id"));
    	ses.setAttribute("Name",rs.getString("user_name"));
    	ses.setAttribute("Phone",rs.getString("user_phone"));
    	response.sendRedirect("Forgotpassword.jsp");
    }else{
    	response.sendRedirect("Registation.jsp");
    }
}


%>




</body>
</html>