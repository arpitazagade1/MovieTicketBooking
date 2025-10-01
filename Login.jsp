<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
</head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap');
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
}
.container {
  height: 120vh;
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 50%);
  column-gap: 30px;
}
.form {
  position: absolute;
  max-width: 430px;
  width: 100%;
  padding: 30px;
  border-radius: 6px;
  background: #FFF;
}
.form.signup {
  opacity: 0;
  pointer-events: none;
}
.forms.show-signup .form.signup {
  opacity: 1;
  pointer-events: auto;
}
.forms.show-signup .form.login {
  opacity: 0;
  pointer-events: none;
}
header {
  font-size: 28px;
  font-weight: 600;
  color: #232836;
  text-align: center;
}
form {
  margin-top: 30px;
}
.form .field {
  position: relative;
  height: 50px;
  width: 100%;
  margin-top: 20px;
  border-radius: 6px;
}
.field input,
.field button {
  height: 100%;
  width: 100%;
  border: none;
  font-size: 16px;
  font-weight: 400;
  border-radius: 6px;
}
.field input {
  outline: none;
  padding: 0 15px;
  border: 1px solid#CACACA;
}
.field input:focus {
  border-bottom-width: 2px;
}
.eye-icon {
  position: absolute;
  top: 50%;
  right: 10px;
  transform: translateY(-50%);
  font-size: 18px;
  color: #8b8b8b;
  cursor: pointer;
  padding: 5px;
}
.field button {
  color: #fff;
  background-color: #0171d3;
  transition: all 0.3s ease;
  cursor: pointer;
}
.field button:hover {
  background-color: #016dcb;
}
.form-link {
  text-align: center;
  margin-top: 10px;
}
.form-link span,
.form-link a {
  font-size: 14px;
  font-weight: 400;
  color: #232836;
}
.form a {
  color: #0171d3;
  text-decoration: none;
}
.form-content a:hover {
  text-decoration: underline;
}
.line {
  position: relative;
  height: 1px;
  width: 100%;
  margin: 36px 0;
  background-color: #d4d4d4;
}
.line::before {
  content: 'Or';
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: #FFF;
  color: #8b8b8b;
  padding: 0 15px;
}
.media-options a {
  display: flex;
  align-items: center;
  justify-content: center;
}
a.facebook {
  color: #fff;
  background-color: #4267b2;
}
a.facebook .facebook-icon {
  height: 28px;
  width: 28px;
  color: #0171d3;
  font-size: 20px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: #fff;
}
.facebook-icon,
img.google-img {
  position: absolute;
  top: 50%;
  left: 15px;
  transform: translateY(-50%);
}
img.google-img {
  height: 20px;
  width: 20px;
  object-fit: cover;
}
a.google {
  border: 1px solid #CACACA;
}
a.google span {
  font-weight: 500;
  opacity: 0.6;
  color: #232836;
}
@media screen and (max-width: 400px) {
  .form {
    padding: 20px 10px;
  }
}


</style>
<body>
  <section class="container forms">
    <div class="form login">
      <div class="form-content">
        <header>Login</header>
        <form action="#" method="get">
          <div class="field input-field">
            <input type="email" placeholder="Email" class="input" name="email">
          </div>
          <div class="field input-field">
            <input type="password" placeholder="Password" class="password" name="password">
            <i class='bx bx-hide eye-icon'></i>
          </div>
          <div class="form-link">
            <a href="Mobile.jsp" class="forgot-pass">Forgot password?</a>
          </div>
          <div class="field button-field">
            <button type="submit" name="login">Login</button>
          </div>
        </form>
        <div class="form-link">
          <span>Don't have an account? <a href="Registation.jsp" class="link signup-link">Signup</a></span>
        </div>
      </div>
      <div class="media-options">
        <a href="GoogleLoginServlet" class="field google">
          <img src="images/google.png" alt="" class="google-img">
          <span>Login with Google</span>
        </a>
      </div>
    </div>
    </section>
<%
   try{
   if(request.getParameter("login")!=null){
	String Email=request.getParameter("email");
	String Password=request.getParameter("password");
	  String redirectMovieId = request.getParameter("redirectMovieId");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","root");
	PreparedStatement ps=con.prepareStatement("select * from projectuser where user_email=? and user_password=?");
	ps.setString(1,Email);
	ps.setString(2, Password);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
		HttpSession ses=request.getSession();
		  ses.setAttribute("userId", rs.getInt("u_id"));
		ses.setAttribute("Name", rs.getString("user_name"));
		ses.setAttribute("Email",rs.getString("user_email"));
		ses.setAttribute("Phone",rs.getString("user_phone"));
		
		if(redirectMovieId != null && !redirectMovieId.isEmpty()){
            response.sendRedirect("moviedeitel.jsp?movieId=" + redirectMovieId);
        } else {
            response.sendRedirect("Profile.jsp");
        }
    } else {
        out.println("<p style='color:red;'>Invalid email or password. Please register first.</p>");
    }
}
}catch(Exception e){
	e.getMessage();
}

%>

</body>
</html>