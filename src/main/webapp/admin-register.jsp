<%--
  Created by IntelliJ IDEA.
  User: Thathshila
  Date: 1/19/2025
  Time: 2:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Registration</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .form-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .form-container h2 {
            margin-bottom: 20px;
            text-align: center;
        }
        .btn-primary {
            width: 100%;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Admin Registration</h2>
    <%
        String message = request.getParameter("message");
        String error = request.getParameter("error");
    %>

    <% if (message != null) { %>
    <div class="alert alert-success" role="alert"><%= message %></div>
    <% } else if (error != null) { %>
    <div class="alert alert-danger" role="alert"><%= error %></div>
    <% } %>

    <form action="admin-register-servlet" method="post">
        <input type="hidden" name="role" value="admin">
        <input type="hidden" name="status" value="active">
        <div class="mb-3">
            <label for="userName" class="form-label">Name</label>
            <input type="text" id="userName" name="user_name" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" id="password" name="password" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" id="email" name="email" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="phone" class="form-label">Phone</label>
            <input type="text" id="phone" name="phone" class="form-control">
        </div>
        <div class="mb-3">
            <label for="address" class="form-label">Address</label>
            <input type="text" id="address" name="address" class="form-control">
        </div>
        <button type="submit" class="btn btn-primary">Register</button>
    </form>
</div>

<script>
    document.addEventListener("DOMContentLoaded", () => {
        <% if (message != null) { %>
        Swal.fire({
            icon: 'success',
            title: 'Success',
            text: '<%= message %>',
            confirmButtonColor: '#3085d6',
            confirmButtonText: 'OK'
        });
        <% } else if (error != null) { %>
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: '<%= error %>',
            confirmButtonColor: '#d33',
            confirmButtonText: 'Try Again'
        });
        <% } %>
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

