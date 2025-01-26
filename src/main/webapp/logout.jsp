<%--
  Created by IntelliJ IDEA.
  User: Thathshila
  Date: 1/25/2025
  Time: 3:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa; /* Light background */
            font-family: 'Arial', sans-serif;
        }
        .logout-container {
            max-width: 500px;
            margin: 100px auto; /* Center the container */
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Subtle shadow */
            text-align: center;
        }
        h1 {
            color: #007bff; /* Primary color */
            font-size: 1.8rem;
            margin-bottom: 20px;
        }
        p {
            color: #6c757d; /* Muted color */
            font-size: 1rem;
            margin-bottom: 30px;
        }
        .btn-primary {
            padding: 10px 20px;
            border-radius: 30px; /* Rounded button */
            font-size: 1rem;
            font-weight: 500;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="logout-container">
    <h1>You have successfully logged out!</h1>
    <p>We hope to see you again soon!</p>
    <%
        session.invalidate();  // Invalidates the current session
    %>
    <div>
        <a href="index.jsp" class="btn btn-primary">Go to Home</a>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

