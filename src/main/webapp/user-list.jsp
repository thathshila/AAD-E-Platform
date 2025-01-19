<%@ page import="lk.ijse.eplatform.dto.UserDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Thathshila
  Date: 1/19/2025
  Time: 7:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>user Management</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center mb-4">User Management</h1>

    <%
        List<UserDTO> dataList = (List<UserDTO>) request.getAttribute("userList");
        if (dataList != null && !dataList.isEmpty()) {
    %>
    <div class="table-responsive">
        <table class="table table-bordered table-striped">
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
    <form action="admin.jsp">
        <button type="submit" class="btn btn-danger">back to home</button>
    </form>
    <% } else { %>
    <div class="alert alert-warning" role="alert">
        No user available.
    </div>
    <% } %>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
