<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Admin</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<table class="table table-bordered">
<tr>
<th>movie_id</th>
<th>Movie_Title</th>
<th>Movie_description</th>
<th>movie_url</th>
<th>Time</th>
<th>movie_language</th>
<th>Update</th>
</tr>
<tr>
<form action="AdminMovie.jsp" method="post">
<td><input type="number" name="id" placeholder="Movie Id" class="form-control"></td>
<td><input type="text" name="title1" placeholder="Movie Name" class="form-control"></td>
<td><input type="text" name="description1" placeholder="Description" class="form-control"></td>
<td><input type="text" name="poster_url1" placeholder="Poster URL" class="form-control"></td>
<td><input type="text" name="time1" placeholder="Time" class="form-control"></td>
<td><input type="text" name="movie_language1" placeholder="Language" class="form-control"></td>
<td><button class="btn btn-success" type="submit" name="submit">Insert</button></td>
</form>
</tr>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","root");
PreparedStatement ps=con.prepareStatement("select * from comingmovies");
ResultSet rs=ps.executeQuery();
while(rs.next()) {
%>
<tr>
<td><%= rs.getInt("comingmovie_id") %></td>
<td><%= rs.getString("coming_title") %></td>
<td><%= rs.getString("coming_description") %></td>
<td><%= rs.getString("poster_url") %></td>
<td><%= rs.getString("time") %></td>
<td><%= rs.getString("movie_langauge") %></td>
<td>
<form action="AdminMovie.jsp" method="post">
<input type="hidden" name="id" value="<%=rs.getInt("comingmovie_id") %>">
<input type="text" name="title" value="<%=rs.getString("coming_title")%>">
<input type="text" name="description" value="<%=rs.getString("coming_description")%>">
<input type="text" name="poster_url" value="<%=rs.getString("poster_url")%>">
<input type="text" name="time" value="<%=rs.getString("time")%>">
<input type="text" name="movie_language" value="<%=rs.getString("movie_langauge")%>">
<button class="btn btn-info mt-2" type="submit" name="edit">Edit</button>
<button class="btn btn-danger mt-2" type="submit" name="delete">Delete</button>
</form>
</td>
<td>
  <!-- leave blank for rows -->
</td>
</tr>
<% } %>


</table>


<%
if(request.getParameter("submit")!=null){
	try{
		int Id =Integer.parseInt(request.getParameter("id"));
		String Title=request.getParameter("title1");
		String Desc=request.getParameter("description1");
		String poster=request.getParameter("poster_url1");
		String lang=request.getParameter("movie_language1");
		String Time=request.getParameter("time1");
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con3=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","root");
		 Statement st=con3.createStatement();
	      st.executeUpdate("insert into comingmovies  (comingmovie_id,coming_title,coming_description,poster_url,time,movie_langauge) values ('"+Id+"','"+Title+"','"+Desc+"','"+poster+"','"+Time+"','"+ lang +"')");
		   response.sendRedirect("admincomingmovie.jsp");
		
	}catch(Exception e){
		e.getMessage();
	}
}

%>

<%
/* DELETE OPERATION */
if(request.getParameter("delete")!=null){
    try{
        int Id =Integer.parseInt(request.getParameter("id"));
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","root");
        PreparedStatement ps1=con1.prepareStatement("delete from comingmovies where u_id=?");
        ps1.setInt(1,Id);
        ps1.executeUpdate();
        response.sendRedirect("admincomingmovie.jsp");
    }catch(Exception e){
        out.print(e);
    }
}

/* UPDATE OPERATION */
if(request.getParameter("edit")!=null){
    try{
        int Id=Integer.parseInt(request.getParameter("id"));
        String Title1=request.getParameter("title");
        String Desc=request.getParameter("description");
        String poste=request.getParameter("poster_url");
        String lang=request.getParameter("movie_langauge");
        String Time=request.getParameter("time");

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","root");
        PreparedStatement ps2=con2.prepareStatement("update movies setcomingmovie_id=?,coming_title=?,coming_description=?,poster_url=?,time=?,movie_langauge=?");
        ps2.setString(1,Title1);
        ps2.setString(2,Desc);
        ps2.setString(3, poste);
        ps2.setString(4,Time);
        ps2.setString(5,lang);
        ps2.setInt(6,Id );
        ps2.executeUpdate();

        response.sendRedirect("admincomingmovie.jsp");

    } catch(Exception e){
        out.print(e);
    }
}
%>


</body>
</html>
vvvv