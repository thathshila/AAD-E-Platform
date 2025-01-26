<%--
  Created by IntelliJ IDEA.
  User: Thathshila
  Date: 1/19/2025
  Time: 8:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="lk.ijse.eplatform.dto.UserDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .profile-container {
            max-width: 600px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .profile-container h1 {
            font-size: 2rem;
            font-weight: bold;
            color: #343a40;
        }

        .profile-details {
            margin-top: 20px;
        }

        .profile-details label {
            font-weight: bold;
            color: #555;
        }

        .profile-details p {
            margin-bottom: 15px;
            color: #333;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="profile-container">
        <h1 class="text-center">Your Profile</h1>
        <%
            UserDTO user = (UserDTO) request.getAttribute("user");
            if (user != null) {
        %>
        <div class="profile-details">
            <label>Full Name:</label>
            <p><%= user.getUserName() %></p>

            <label>Email Address:</label>
            <p><%= user.getEmail() %></p>

            <label>Phone Number:</label>
            <p><%= user.getPhone() %></p>

            <label>Address:</label>
            <p><%= user.getAddress() %></p>


            <a href="update-profile.jsp" class="btn btn-primary">Edit Profile</a>
        </div>
        <%
        } else {
        %>
        <p class="text-center text-danger">Unable to load your profile details. Please try again later.</p>
        <%
            }
        %>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


