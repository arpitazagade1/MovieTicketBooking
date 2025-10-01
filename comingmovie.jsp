<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
 <header>
    <div class="container nav-container">
        <div class="logo">
            <i class="fas fa-film"></i>
            <span>CineMagic</span>
        </div>

        <button class="hamburger" id="hamburger">
            <i class="fas fa-bars"></i>
        </button>

        <ul class="nav-links" id="navLinks">
            <li><a href="Home.jsp"><i class="fas fa-home"></i> Home</a></li>
            <li><a href="comingmovie.jsp"><i class="fas fa-ticket-alt"></i> Movies</a></li>
            <li><a href="#"><i class="fas fa-theater-masks"></i> Theaters</a></li>
            <li><a href="#"><i class="fas fa-phone"></i> Contact</a></li>

            
            <li><a href="Adminlogin.jsp"><i class="fas fa-user-shield"></i> Admin</a></li>

           
            <li><a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>

        <div class="auth-buttons">
            <a class="btn btn-login" href="Login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a>
            <a class="btn btn-signup" href="Registation.jsp"><i class="fas fa-user-plus"></i> Sign Up</a>
        </div>
    </div>
</header>

 <section class="container">
        <h2 class="section-title">Coming Soon</h2>
        <div class="movies-container">
        
         <%
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "root");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM comingmovies");
        while (rs.next()) {
            int id = rs.getInt("comingmovie_id");
            String title = rs.getString("coming_title");
            String desc = rs.getString("coming_description");
            String poster = rs.getString("poster_url");
            String Lang = rs.getString("movie_langauge");
            String Time = rs.getString("time");
        %>
           <!-- Movie 1 -->
            <div class="movie-card">
                <div class="movie-poster">
                      <img src="<%=poster%>" alt="<%=title%>">
                          </div>
                <div class="movie-info">
                   <h3 class="movie-title"><%=title%></h3>
                    <div class="movie-details">
                       <span><%=desc%></span>
                        <span class="rating"><i class="fas fa-star-half-alt"></i> TBA</span>
                    </div>
                    <div class="movie-details">
                        <span><%=Time%></span>
                        <span><%=Lang%></span>
                    </div>
                    <button class="book-btn">Coming Movie</button>
                </div>
            </div>
        <%
        } // end while
        con.close();
        %>
        
           
            </div>
</section>
 
</body>
</html>