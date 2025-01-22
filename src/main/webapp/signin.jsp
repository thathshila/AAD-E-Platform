<%--
  Created by IntelliJ IDEA.
  User: Thathshila
  Date: 1/18/2025
  Time: 12:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
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
        .divider {
            margin: 20px 0;
            text-align: center;
        }
        .divider::before,
        .divider::after {
            content: "";
            flex: 1;
            height: 1px;
            background: #ccc;
            margin: 0 10px;
        }
        .footer-links {
            font-size: 12px;
            text-align: center;
            margin-top: 20px;
            color: #555;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2 class="form-title">Sign in</h2>
<%--    <form action="index.jsp">--%>
    <form action="new-product-list">
        <!-- Email or Phone Field -->
        <div class="mb-3">
            <label for="email" class="form-label">Email or mobile phone number</label>
            <input type="text" class="form-control" id="email" placeholder="Enter your email or phone" required>
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" placeholder="password" required>
        </div>

        <!-- Submit Button -->
        <button type="submit" class="btn btn-yellow w-100">Sign in</button>
    </form>

    <!-- Create Account -->
    <p class="form-note">
        <strong>New to us?</strong> <a href="signup.jsp">Create your account</a>
    </p>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
