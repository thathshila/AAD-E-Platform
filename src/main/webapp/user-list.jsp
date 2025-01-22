<%@ page import="lk.ijse.eplatform.dto.UserDTO" %>
<%@ page import="java.util.List" %><%--
<%--  Created by IntelliJ IDEA.--%>
<%--  User: Thathshila--%>
<%--  Date: 1/19/2025--%>
<%--  Time: 7:29 PM--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #007bff;
            text-align: center;
            margin-bottom: 30px;
        }
        .btn-back {
            background-color: #6c757d;
            border: none;
            font-weight: bold;
        }
        .btn-back:hover {
            background-color: #5a6268;
        }
        .table-striped tbody tr:hover {
            background-color: #f2f2f2;
        }
        .alert-warning {
            text-align: center;
            font-size: 1.1rem;
        }
        .btn-wrapper {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="btn-wrapper">
        <form action="admin.jsp">
            <button type="submit" class="btn btn-back">Back to Home</button>
        </form>
    </div>
    <h1>User Management</h1>
    <%
        List<UserDTO> dataList = (List<UserDTO>) request.getAttribute("userList");
        if (dataList != null && !dataList.isEmpty()) {
    %>
    <div class="table-responsive">
        <table class="table table-bordered table-striped text-center">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Role</th>
                <th>Status</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (UserDTO userDTO : dataList) {
            %>
            <tr>
                <td><%= userDTO.getUserId() %></td>
                <td><%= userDTO.getUserName() %></td>
                <td><%= userDTO.getEmail() %></td>
                <td><%= userDTO.getPhone() %></td>
                <td><%= userDTO.getAddress() %></td>
                <td><%= userDTO.getRole() %></td>
                <td><%= userDTO.getStatus() %></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
    <% } else { %>
    <div class="alert alert-warning mt-4">
        No users available.
    </div>
    <% } %>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
