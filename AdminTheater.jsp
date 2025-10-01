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
<th>Threater_Id</th>
<th>movie_id</th>
<th>threater_name</th>
<th>distance</th>
<th>time1</th>
<th>time2</th>
<th>time3</th>
<th>time4</th>
<th>city</th>
<th>price_prime</th>
<th>price_classic_plus</th>
<th>price_classic</th>
<th>Update</th>
</tr>
<tr>
<form action="#" method="get">
<td><input type="hidden" name="id" class="form-control"></td>
<td><input type="number" name="movieid" placeholder="Movie Id" class="form-control"></td>
<td><input type="text" name="title1" placeholder="Threater Name" class="form-control"></td>
<td><input type="text" name="description1" placeholder="distance" class="form-control"></td>
<td><input type="text" name="time1" placeholder=" time" class="form-control"></td>
<td><input type="text" name="time2" placeholder=" time" class="form-control"></td>
<td><input type="text" name="time3" placeholder=" time" class="form-control"></td>
<td><input type="text" name="time4" placeholder=" time" class="form-control"></td>
<td><input type="text" name="city1" placeholder="city" class="form-control"></td>
<td><input type="text" name="price1" placeholder="price_prime" class="form-control"></td>
<td><input type="text" name="price2" placeholder="price_classic_plus" class="form-control"></td>
<td><input type="text" name="price3" placeholder="price_classic" class="form-control"></td>
<td><button class="btn btn-success" type="submit" name="submit">Insert</button></td>
</form>
</tr>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","root");
PreparedStatement ps=con.prepareStatement("select * from showtimes");
ResultSet rs=ps.executeQuery();
while(rs.next()) {
%>
<tr>
<td><%= rs.getInt("id") %></td>
<td><%= rs.getInt("movie_id") %></td>
<td><%= rs.getString("cinema_name") %></td>
<td><%= rs.getString("distance") %></td>
<td><%= rs.getString("time1") %></td>
<td><%= rs.getString("time2") %></td>
<td><%= rs.getString("time3") %></td>
<td><%= rs.getString("time4") %></td>
<td><%= rs.getString("city") %></td>
<td><%= rs.getString("price_prime") %></td>
<td><%= rs.getString("price_classic_plus") %></td>
<td><%= rs.getString("price_classic") %></td>
<td>
<form action="#" method="post">
<input type="hidden" name="id" value="<%=rs.getInt("id") %>">
<input type="number" name="id1" value="<%=rs.getInt("movie_id") %>">
<input type="text" name="title" value="<%=rs.getString("cinema_name")%>">
<input type="text" name="description" value="<%=rs.getString("distance")%>">
<input type="text" name="time1" value="<%=rs.getString("time1")%>">
<input type="text" name="time2" value="<%=rs.getString("time2")%>">
<input type="text" name="time3" value="<%=rs.getString("time3")%>">
<input type="text" name="time4" value="<%=rs.getString("time4")%>">
<input type="text" name="city" value="<%=rs.getString("city")%>">
<input type="text" name="price1" value="<%=rs.getString("price_prime")%>">
<input type="text" name="price2" value="<%=rs.getString("price_classic_plus")%>">
<input type="text" name="price3" value="<%=rs.getString("price_classic")%>">
<button class="btn btn-info mt-2" type="submit" name="edit">Edit</button>
<button class="btn btn-danger mt-2" type="submit" name="delete">Delete</button>
</form>
</td>
<td>
</td>
</tr>
<% } %>
</table>

<%
if(request.getParameter("submit") != null){
    try{
        int movieId = Integer.parseInt(request.getParameter("movieid"));
        String title = request.getParameter("title1");
        String distance = request.getParameter("description1");
        String time1 = request.getParameter("time1");
        String time2 = request.getParameter("time2");
        String time3 = request.getParameter("time3");
        String time4 = request.getParameter("time4");
        String city = request.getParameter("city1");
        String pricePrime = request.getParameter("price1");
        String priceClassicPlus = request.getParameter("price2");
        String priceClassic = request.getParameter("price3");

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","root");

        String sql = "INSERT INTO showtimes (movie_id, cinema_name, distance, time1, time2, time3, time4, city, price_prime, price_classic_plus, price_classic) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps3 = con2.prepareStatement(sql);
        ps3.setInt(1, movieId);
        ps3.setString(2, title);
        ps3.setString(3, distance);
        ps3.setString(4, time1);
        ps3.setString(5, time2);
        ps3.setString(6, time3);
        ps3.setString(7, time4);
        ps3.setString(8, city);
        ps3.setString(9, pricePrime);
        ps3.setString(10, priceClassicPlus);
        ps3.setString(11, priceClassic);

        ps3.executeUpdate();
        ps3.close();
        con2.close();

        response.sendRedirect("AdminTheater.jsp");
    } catch(Exception e){
        e.printStackTrace(new java.io.PrintWriter(out)); // FIXED
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
        PreparedStatement ps1=con1.prepareStatement("delete from showtimes where id=?");
        ps1.setInt(1,Id);
        ps1.executeUpdate();
        response.sendRedirect("AdminThreater.jsp");
    }catch(Exception e){
        out.print(e);
    }
}

/* UPDATE OPERATION */
if(request.getParameter("edit")!=null){
    try{
        int Id=Integer.parseInt(request.getParameter("id"));
        int Id1=Integer.parseInt(request.getParameter("id1"));
        String Title1=request.getParameter("title");
        String Desc=request.getParameter("description");
        String Time1=request.getParameter("time1");
		String Time2=request.getParameter("time2");
		String Time3=request.getParameter("time3");
		String Time4=request.getParameter("time4");
		String City=request.getParameter("city");
		String Prime1=request.getParameter("price1");
		String Prime2=request.getParameter("price2");
		String Prime3=request.getParameter("price3");

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","root");
        PreparedStatement ps2=con2.prepareStatement("update showtimes set movie_id=?,cinema_name=? ,distance=?,time1=?,time2=?,time3=?,time4=?,city=?,price_prime=?,price_classic_plus=?,price_classic=? where id=?");
       
        ps2.setInt(1,Id1);
        ps2.setString(2,Title1);
        ps2.setString(3,Desc);
        ps2.setString(4, Time1);
        ps2.setString(5,Time2);
        ps2.setString(6,Time3);
        ps2.setString(7,Time4);
        ps2.setString(8,City);
        ps2.setString(9,Prime1);
        ps2.setString(10,Prime2);
        ps2.setString(11,Prime3);
        ps2.setInt(12,Id );
        ps2.executeUpdate();

        response.sendRedirect("AdminTheater.jsp");

    } catch(Exception e){
        out.print(e);
    }
}
%>


</body>
</html>
