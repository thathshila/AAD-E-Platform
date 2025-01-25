<%--
  Created by IntelliJ IDEA.
  User: Thathshila
  Date: 1/24/2025
  Time: 12:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.eplatform.dto.ProductDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search, Update, and Delete Product</title>
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
        #productImage {
            max-width: 200px;
            max-height: 200px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Search, Update, and Delete Product</h1>

    <!-- Search Bar -->
    <form id="searchForm" class="mb-4">
        <div class="input-group">
            <input type="text" class="form-control" id="searchInput" placeholder="Search product by name..." required>
            <button type="button" class="btn btn-primary" id="searchBtn">Search</button>
        </div>
    </form>

    <!-- Product Form -->
    <form id="productForm" method="post" action="http://localhost:8080/E_Platform_war_exploded/search-product">
        <div class="mb-3">
            <label for="productId" class="form-label">Product ID</label>
            <input type="text" class="form-control" name="product_id" id="productId" readonly>
        </div>
        <div class="mb-3">
            <label for="productName" class="form-label">Product Name</label>
            <input type="text" class="form-control" name="product_name" id="productName">
        </div>
        <div class="mb-3">
            <label for="productDescription" class="form-label">Product Description</label>
            <textarea class="form-control" name="product_description" id="productDescription" rows="3"></textarea>
        </div>
        <div class="mb-3">
            <label for="productPrice" class="form-label">Product Price</label>
            <input type="number" class="form-control" name="product_price" id="productPrice">
        </div>
        <div class="mb-3">
            <label for="productQuantity" class="form-label">Product Quantity</label>
            <input type="number" class="form-control" name="product_qty" id="productQuantity">
        </div>
        <div class="mb-3">
            <label for="categorySelect" class="form-label">Category</label>
            <input type="text" class="form-control" name="category_id" id="categorySelect">
        </div>
        <div class="mb-3 text-center">
            <img id="productImage" src="" alt="Product Image" class="img-thumbnail">
            <input type="hidden" name="product_img" id="productImgPath">
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
        const productName = $('#searchInput').val();
        if (productName.trim() !== '') {
            $.ajax({
                url: 'http://localhost:8080/E_Platform_war_exploded/search-product',
                type: 'GET',
                data: { product_name: productName },
                success: function (response) {
                    console.log('Success:', response);
                    $('#productId').val(response.productId);
                    $('#productName').val(response.productName);
                    $('#productDescription').val(response.productDescription);
                    $('#productPrice').val(response.productPrice);
                    $('#productQuantity').val(response.productQuantity);
                    $('#categorySelect').val(response.categoryId);
                    $('#productImgPath').val(response.imagePath);
                    $('#productImage').attr('src', response.imagePath);
                },
                error: function () {
                    alert('Product not found or error occurred!');
                }
            });
        } else {
            alert('Please enter a product name!');
        }
    });
</script>
</body>
</html>

