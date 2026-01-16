<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    // Invalidate the current session
    HttpSession userSession = request.getSession(false);
    if (userSession != null) {
    	userSession.invalidate(); // Invalidate the session
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
</head>
<body>
    <h1>You have been logged out successfully.</h1>
    <p><a href="Login.jsp">Click here to login again</a></p>
</body>
</html>
