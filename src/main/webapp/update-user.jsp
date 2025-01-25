
<%--
  Created by IntelliJ IDEA.
  User: Thathshila
  Date: 1/25/2025
  Time: 10:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search, Update, and Delete User</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .container {
            margin-top: 50px;
            max-width: 800px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #007bff;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Search, Update, and Delete User</h1>

    <!-- Search Bar -->
    <form id="searchForm" class="mb-4">
        <div class="input-group">
            <input type="text" class="form-control" id="searchInput" placeholder="Search user by username..." required>
            <button type="button" class="btn btn-primary" id="searchBtn">Search</button>
        </div>
    </form>

    <!-- User Form -->
    <form id="userForm" method="post" action="http://localhost:8080/E_Platform_war_exploded/user-search">
        <div class="mb-3">
            <label for="userId" class="form-label">User ID</label>
            <input type="text" class="form-control" name="user_id" id="userId" readonly>
        </div>
        <div class="mb-3">
            <label for="userName" class="form-label">User Name</label>
            <input type="text" class="form-control" name="user_name" id="userName">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" name="password" id="password">
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" name="email" id="email">
        </div>
        <div class="mb-3">
            <label for="phone" class="form-label">Phone</label>
            <input type="text" class="form-control" name="phone" id="phone">
        </div>
        <div class="mb-3">
            <label for="address" class="form-label">Address</label>
            <input type="text" class="form-control" name="address" id="address">
        </div>
        <div class="mb-3">
            <label for="role" class="form-label">Role</label>
            <select class="form-select" name="role" id="role">
                <option value="admin">Admin</option>
                <option value="customer">Customer</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="status" class="form-label">Status</label>
            <select class="form-select" name="status" id="status">
                <option value="active">Active</option>
                <option value="inactive">Inactive</option>
            </select>
        </div>
        <div class="d-flex justify-content-between">
            <button type="submit" class="btn btn-success" name="action" value="update">Update</button>
            <button type="submit" class="btn btn-danger" name="action" value="delete">Delete</button>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
<script>
    $('#searchBtn').on('click', function () {
        const userName = $('#searchInput').val();
        if (userName.trim() !== '') {
            $.ajax({
                url: 'http://localhost:8080/E_Platform_war_exploded/user-search',
                type: 'GET',
                data: { user_name: userName },
                success: function (response) {
                    console.log('Success:', response);
                    $('#userId').val(response.userId);
                    $('#userName').val(response.userName);
                    $('#password').val(response.password); // Masked input
                    $('#email').val(response.email);
                    $('#phone').val(response.phone);
                    $('#address').val(response.address);
                    $('#role').val(response.role);
                    $('#status').val(response.status);
                },
                error: function () {
                    alert('User not found or an error occurred!');
                }
            });
        } else {
            alert('Please enter a username!');
        }
    });
</script>
</body>
</html>
