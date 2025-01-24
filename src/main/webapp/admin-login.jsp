<%--
  Created by IntelliJ IDEA.
  User: Thathshila
  Date: 1/19/2025
  Time: 1:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
        .form-control:focus {
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            border-color: #007bff;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .forgot-password {
            font-size: 0.9rem;
        }
        .register-link {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2 class="text-center mb-4">Login</h2>
    <form action="admin.jsp" method="get">
        <div class="mb-3">
            <label for="email" class="form-label">Email:</label>
            <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password:</label>
            <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required>
        </div>
        <div class="d-flex justify-content-between align-items-center mb-3">
            <a href="forgot-password.jsp" class="forgot-password">Forgot Password?</a>
        </div>
        <button type="submit" class="btn btn-primary w-100">Login</button>
    </form>
    <div class="register-link mt-4">
        <p>Don't have an account? <a href="admin-register.jsp">Register now</a></p>
    </div>
</div>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


