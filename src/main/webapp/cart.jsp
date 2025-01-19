<%--
  Created by IntelliJ IDEA.
  User: Thathshila
  Date: 1/18/2025
  Time: 12:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Landing Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom CSS */
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            background: url('https://via.placeholder.com/1920x1080') no-repeat center center fixed; /* Replace with your image URL */
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .overlay {
            background-color: rgba(0, 0, 0, 0.5); /* Add a dark overlay */
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
        }
        .content {
            position: relative;
            z-index: 2;
            color: white;
            text-align: center;
        }
        .btn-custom {
            width: 200px;
            margin: 10px;
            font-size: 18px;
        }
    </style>
</head>
<body>
<!-- Background Overlay -->
<div class="overlay"></div>

<!-- Content -->
<div class="content">
    <h1 class="mb-4">Welcome to E-Shop</h1>
    <p class="mb-4">Sign up to start shopping or sign in to access your account.</p>
    <div>
        <a href="signup.jsp" class="btn btn-primary btn-custom">Sign Up Now</a>
        <a href="signin.jsp" class="btn btn-outline-light btn-custom">Sign In</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

