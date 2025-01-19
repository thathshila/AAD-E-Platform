<%--
  Created by IntelliJ IDEA.
  User: Thathshila
  Date: 1/18/2025
  Time: 12:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f3f3f3;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
        }
        .form-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
        .form-title {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }
        .form-note {
            font-size: 12px;
            color: #555;
            margin-top: 10px;
            text-align: center;
        }
        .btn-yellow {
            background-color: #f0c14b;
            border-color: #a88734;
            color: #000;
        }
        .btn-yellow:hover {
            background-color: #ddb347;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2 class="form-title">Create account</h2>
    <form action="admin-register-servlet" method="post">
        <input type="hidden" name="role" value="customer">
        <input type="hidden" name="status" value="active">
        <!-- Name Field -->
        <div class="mb-3">
            <label for="name" class="form-label">Your name</label>
            <input type="text" class="form-control" id="name" name="user_name" placeholder="First and last name" required>
        </div>

        <!-- Email or Phone Field -->
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="text" class="form-control" id="email" name="email" placeholder="Enter your email" required>

<%--            <input type="text" class="form-control" id="email" placeholder="Enter your email" required>--%>
        </div>

        <!-- Password Field -->
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" placeholder="At least 6 characters" required>
            <div class="form-text">Passwords must be at least 6 characters.</div>
        </div>

        <!-- Re-enter Password Field -->
        <div class="mb-3">
            <label for="repassword" class="form-label">Re-enter password</label>
            <input type="password" class="form-control" id="repassword" placeholder="Re-enter your password" required>
        </div>
<form action="home.jsp">
        <!-- Submit Button -->
        <button type="submit" class="btn btn-yellow w-100">register</button></form>
    </form>

    <p class="form-note">
        Already have an account? <a href="signin.jsp">Sign in</a>
    </p>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
