<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Movie Search Test</title>
</head>
<body>
<h2>Search Movies</h2>

<!-- Search form -->
<form method="get" action="">
    <input type="text" name="q" placeholder="Enter movie name" 
           value="<%= request.getParameter("q") != null ? request.getParameter("q") : "" %>">
    <button type="submit">Search</button>
</form>

<hr>

<%
    // Database connection
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "root");

    // Get search parameter
    String q = request.getParameter("q");
    PreparedStatement ps;

    if (q != null && !q.trim().isEmpty()) {
        // If user typed something, search by title or description
        ps = con.prepareStatement("SELECT * FROM movies WHERE title LIKE ? OR description LIKE ?");
        ps.setString(1, "%" + q + "%");
        ps.setString(2, "%" + q + "%");
    } else {
        // If search box is empty, show all movies
        ps = con.prepareStatement("SELECT * FROM movies");
    }

    ResultSet rs = ps.executeQuery();

    out.println("<h3>Results:</h3>");
    while (rs.next()) {
        out.println("<p><b>" + rs.getString("title") + "</b> - " + rs.getString("description") + "</p>");
    }

    con.close();
%>

</body>
</html>
