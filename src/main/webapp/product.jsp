<%--
  Created by IntelliJ IDEA.
  User: Thathshila
  Date: 1/19/2025
  Time: 9:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 50px;
        }
        h1 {
            margin-bottom: 30px;
        }
        .form-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .btn {
            margin-right: 10px;
        }
        table {
            margin-top: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="text-center">Product Management</h1>

    <!-- Add Product Form -->
    <div class="form-container">
        <h2>Add Product</h2>
        <form action="product-servlet" method="post">
<%--            <div class="mb-3">--%>
<%--                <label for="productId" class="form-label">Product Id</label>--%>
<%--                <input type="number" class="form-control" id="productId" name="productId" required>--%>
<%--            </div>--%>
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
                <input type="number" step="0.01" class="form-control" id="productPrice" name="productPrice" required>
            </div>
            <div class="mb-3">
                <label for="productQuantity" class="form-label">Product Quantity</label>
                <input type="number" class="form-control" id="productQuantity" name="productQuantity" required>
            </div>
            <div class="mb-3">
                <label for="categoryId" class="form-label">Category Id</label>
                <input type="number" class="form-control" id="categoryId" name="categoryId" required>
            </div>
            <input type="hidden" name="action" value="save">
            <button  type="submit" class="btn btn-primary">Add Product</button>
        </form>
    </div>

    <!-- Product List -->
    <h2 class="mt-5">Product List</h2>
    <table class="table table-bordered table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <!-- Sample data, replace with server-generated content -->
        <tr>
            <td>1</td>
            <td>Sample Product</td>
            <td>This is a sample description.</td>
            <td>99.99</td>
            <td>50</td>
            <td>
                <form action="product-servlet" method="get" style="display: inline;">
                    <input type="hidden" name="productId" value="1">
                    <input type="hidden" name="action" value="update">
                    <button type="submit" class="btn btn-success btn-sm">Update</button>
                </form>
                <form action="product-servlet" method="post" style="display: inline;">
                    <input type="hidden" name="productId" value="1">
                    <input type="hidden" name="action" value="delete">
                    <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                </form>
            </td>
        </tr>
        <!-- End Sample -->
        </tbody>
    </table>
</div>
</body>
</html>

