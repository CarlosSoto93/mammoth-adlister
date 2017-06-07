<%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 6/7/17
  Time: 10:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    if (request.getMethod().equalsIgnoreCase("post")) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username.equals("admin") && password.equals("password")) {
            response.sendRedirect("/profile.jsp");
        }
    }
%>

<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Log In"/>
    </jsp:include>
</head>
<body>

<div>
    <h1>User Login</h1>
    <form class="login-field" action="/login.jsp" method="POST">
        <lable for="username">Username</lable>
        <input id="username" name="username" type="text">
        <br>
        <lable for="password">Password</lable>
        <input id="password" name="password" type="password">
        <br>
        <input type="submit" value="Log In">
    </form>


    <%--If the username submitted is "admin", and the password is "password", redirect the user to the profile page,
     otherwise, redirect back to the login form.--%>

</div>

</body>
</html>
