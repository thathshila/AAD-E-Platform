<%--
  Created by IntelliJ IDEA.
  User: Thathshila
  Date: 1/25/2025
  Time: 3:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1 class="text-center mt-5">You have successfully logged out!</h1>
    <p class="text-center">We hope to see you again soon!</p>
    <%
        // Invalidate the session without redeclaring it
        session.invalidate();  // Invalidates the current session
    %>
    <div class="text-center mt-3">
        <a href="index.jsp" class="btn btn-primary">Go to Home</a>
    </div>
</div>
</body>
</html>

