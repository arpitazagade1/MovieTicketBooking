<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Movies</title>
  <style>
    .movie-container {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
    }
    .movie-card {
      width: 200px;
      border: 1px solid #ddd;
      border-radius: 8px;
      overflow: hidden;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
      text-align: center;
    }
    .movie-card img {
      width: 100%;
      height: 250px;
      object-fit: cover;
    }
    .movie-card h3 {
      margin: 10px 0 5px;
    }
    .movie-card p {
      font-size: 14px;
      padding: 0 10px;
    }
    .movie-card a {
      display: block;
      background-color: #007BFF;
      color: #fff;
      padding: 8px;
      text-decoration: none;
    }
    .movie-card a:hover {
      background-color: #0056b3;
    }
    .p1{
    color:#808080eb;
    }
  </style>
</head>
<body>
<h1>Now Showing</h1>
<div class="movie-container">
<%

  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "root");
  Statement st = con.createStatement();
  ResultSet rs = st.executeQuery("SELECT * FROM movies");
  while (rs.next()) {
    int id = rs.getInt("Id");
    String title = rs.getString("title");
    String desc = rs.getString("description");
    String poster = rs.getString("poster_url");
    String Lang= rs.getString("movie_langauge");
    String Time=rs.getString("time");
%>
    <div class="movie-card">
      <img src="<%=poster%>" alt="<%=title%>">
      <h3><%=title%></h3>
      <p><%=desc%></p>
      <p class="p1"><%=Lang%> | <%=Time %></p>
      <a href="moviedeitel.jsp?movieId=<%=	id%>">Book Now</a>
    </div>
<%
  }
  con.close();
%>
</div>
</body>
</html>
