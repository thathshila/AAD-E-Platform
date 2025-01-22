
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.eplatform.dto.ProductDTO" %><%--
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
    <h1 class="text-center mb-4">Product Management</h1>

    <%
        List<ProductDTO> dataList = (List<ProductDTO>) request.getAttribute("productList");
        if (dataList != null && !dataList.isEmpty()) {
    %>
    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
            <tr>
                <th>ProductId</th>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>CategoryId</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (ProductDTO productDTO : dataList) {
            %>
            <tr>
                <td><%= productDTO.getProduct_id() %></td>
                <td><%= productDTO.getProductName() %></td>
                <td><%= productDTO.getProductDescription() %></td>
                <td><%= productDTO.getProductPrice() %></td>
                <td><%= productDTO.getProductQuantity()%></td>
                <td><%= productDTO.getCategory_id()%></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
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
