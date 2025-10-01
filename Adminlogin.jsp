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
  font-family: "Comic Sans MS", cursive;
  margin: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
background: linear-gradient(135deg, #667eea 0%, #764ba2 50%);
  color: #333;
}

.container {
  width: 100%;
  max-width: 400px;
}

.card {
  width: 100%;
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
  border-color: #ff4500;
}

button {
  background-color: #ff4500;
  color: #fff;
  padding: 10px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s ease-in-out;
}

button:hover {
  background-color: #e63900;
}


</style>





<body>
<div class="container">
  <div class="card">
    <h2>Admin Login</h2>
    <form action="#" method="get">
      <input type="text" id="username" name="email" placeholder="Enter Email" >
      <input type="password" id="password" name="password" placeholder="Password" >
      <button type="submit" name="submit" class="submit">Login</button>
    </form>
  </div>
</div>
<%
if(request.getParameter("submit")!=null){
	String Email=request.getParameter("email");
	String Pass=request.getParameter("password");
	if((Email.equals("2003arpitavz@gmail.com")) &&(Pass.equals("arpu@123"))){
		response.sendRedirect("Admindashboard.jsp");
	}
	else{
		%>
		<script>alert("Id and password is invalid plz try again")</script>
	
		<%
	}
		
	
		
	
	
	
}
%>






</body>
</html>