<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Get the existing session (if any)
    HttpSession ses = request.getSession(false);

    // If session exists, destroy it
    if (ses != null) {
        ses.invalidate();
    }

    // Redirect to login page
    response.sendRedirect("Login.jsp");
%>
