<%--
  Created by IntelliJ IDEA.
  User: Thathshila
  Date: 1/19/2025
  Time: 8:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - E-Commerce Platform</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f9f9f9;
        }
        .profile-header {
            background-color: #f8f9fa;
            padding: 30px;
            margin-bottom: 30px;
            text-align: center;
        }
        .profile-header img {
            border-radius: 50%;
            width: 120px;
            height: 120px;
        }
        .profile-details {
            background-color: #fff;
            padding: 30px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }
        .profile-details .list-group-item {
            border: none;
        }
        .profile-details .list-group-item:hover {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>

<!-- Profile Header -->
<div class="container">
    <div class="profile-header">
        <img src="https://via.placeholder.com/120" alt="User Profile Picture">
        <h2>John Doe</h2>
        <p>johndoe@example.com</p>
    </div>

    <!-- Profile Information -->
    <div class="profile-details">
        <h4>Your Profile</h4>
        <ul class="list-group">
            <li class="list-group-item">
                <strong>Username:</strong> johndoe
            </li>
            <li class="list-group-item">
                <strong>Email:</strong> johndoe@example.com
            </li>
            <li class="list-group-item">
                <strong>Phone:</strong> +123 456 7890
            </li>
            <li class="list-group-item">
                <strong>Address:</strong> 1234 Elm St, Springfield, IL, 62701
            </li>
        </ul>
    </div>

    <!-- Order History -->
    <div class="profile-details">
        <h4>Your Order History</h4>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Order ID</th>
                <th>Product</th>
                <th>Quantity</th>
                <th>Status</th>
                <th>Date</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>#12345</td>
                <td>Wireless Headphones</td>
                <td>1</td>
                <td>Shipped</td>
                <td>Jan 10, 2025</td>
            </tr>
            <tr>
                <td>#12346</td>
                <td>Smart Watch</td>
                <td>2</td>
                <td>Delivered</td>
                <td>Dec 5, 2024</td>
            </tr>
            <!-- More orders can be added here -->
            </tbody>
        </table>
    </div>

    <!-- Profile Update Button -->
    <div class="text-center">
        <a href="update-profile" class="btn btn-primary">Update Profile</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

