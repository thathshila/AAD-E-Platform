<%@ page import="java.util.List" %><%--<%@ page import="lk.ijse.eplatform.dto.CategoryDTO" %>--%>
<%--<%@ page import="java.util.List" %>&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: Thathshila--%>
<%--  Date: 1/19/2025--%>
<%--  Time: 9:32 AM--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--&lt;%&ndash;<%@ page contentType="text/html;charset=UTF-8" language="java" %>&ndash;%&gt;--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
            max-width: 600px;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #007bff;
        }
    </style>
</head>
<body>
<form action="admin.jsp">
    <button type="submit" class="btn btn-danger">home</button>
</form>
<div class="container">
    <h1>Add Product</h1>
    <a href="category-name" class="btn btn-primary w-100" role="button">Add New Product</a>

    <form action="product-new" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="productName" class="form-label">Product Name</label>
            <input type="text" class="form-control" id="productName" name="productName" required>
        </div>
        <div class="mb-3">
            <label for="productDescription" class="form-label">Product Description</label>
            <textarea class="form-control" id="productDescription" name="productDescription" rows="3" required></textarea>
        </div>
        <div class="mb-3">
            <label for="productPrice" class="form-label">Product Price</label>
            <input type="number" class="form-control" id="productPrice" step="0.01" name="productPrice" required>
        </div>
        <div class="mb-3">
            <label for="productQuantity" class="form-label">Product Quantity</label>
            <input type="number" class="form-control" id="productQuantity" name="productQuantity" required>
        </div>
        <div class="mb-3">
            <label for="categorySelect" class="form-label">Select Category ID</label>
            <select class="form-select" id="categorySelect" name="category_id" required>
                <option value="">Select Category</option>
                <%
                    // Fetch the list of category IDs from the request attribute
                    List<Integer> categoryIds = (List<Integer>) request.getAttribute("categoryIds");
                    if (categoryIds != null && !categoryIds.isEmpty()) {
                        for (Integer categoryId : categoryIds) {
                %>
                <option value="<%= categoryId %>"><%= categoryId %></option>
                <%
                    }
                } else {
                %>
                <option value="" disabled>No categories available</option>
                <%
                    }
                %>
            </select>
        </div>
        <div class="mb-3">
            <label for="productImage" class="form-label">Product Image</label>
            <input type="file" class="form-control" id="productImage" name="productImage" accept="image/*" required>
        </div>
        <button type="submit" name="action" value="save" class="btn btn-primary w-100">Add Product</button>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

