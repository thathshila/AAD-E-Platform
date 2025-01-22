
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.eplatform.dto.CategoryDTO" %><%--
  Created by IntelliJ IDEA.
  User: Thathshila
  Date: 1/16/2025
  Time: 9:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Management</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<form action="admin.jsp">
    <button type="submit" class="btn btn-danger">home</button>
</form>
<div class="container mt-5">
    <h1 class="text-center mb-4">Category Management</h1>

    <%
        List<CategoryDTO> dataList = (List<CategoryDTO>) request.getAttribute("categoryList");
        if (dataList != null && !dataList.isEmpty()) {
    %>
    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (CategoryDTO categoryDTO : dataList) {
            %>
            <tr>
                <td><%= categoryDTO.getCategoryId() %></td>
                <td><%= categoryDTO.getCategoryName() %></td>
                <td><%= categoryDTO.getDescription() %></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
    <form action="category.jsp">
        <button type="submit" class="btn btn-danger">ADD UPDATE OR Delete Category</button>
    </form>
    <% } else { %>
    <div class="alert alert-warning" role="alert">
        No categories available.
    </div>
    <% } %>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
