<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .container {
            margin-top: 50px;
            max-width: 600px;
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
        .btn-home {
            margin-bottom: 20px;
            font-weight: bold;
            background-color: #6c757d;
            border: none;
        }
        .btn-home:hover {
            background-color: #5a6268;
        }
        .form-label {
            font-weight: bold;
        }
        .btn-primary {
            font-weight: bold;
            background-color: #007bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <form action="admin.jsp" class="text-start mb-4">
        <button type="submit" class="btn btn-home w-100">Home</button>
    </form>

    <h1>Add Product</h1>

    <a href="category-name" class="btn btn-primary w-100 mb-4" role="button">Add New Product</a>

    <form action="product-new" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="productName" class="form-label">Product Name</label>
            <input type="text" class="form-control" id="productName" name="productName" placeholder="Enter product name" required>
        </div>
        <div class="mb-3">
            <label for="productDescription" class="form-label">Product Description</label>
            <textarea class="form-control" id="productDescription" name="productDescription" rows="3" placeholder="Enter product description" required></textarea>
        </div>
        <div class="mb-3">
            <label for="productPrice" class="form-label">Product Price</label>
            <input type="number" class="form-control" id="productPrice" name="productPrice" step="0.01" placeholder="Enter product price" required>
        </div>
        <div class="mb-3">
            <label for="productQuantity" class="form-label">Product Quantity</label>
            <input type="number" class="form-control" id="productQuantity" name="productQuantity" placeholder="Enter product quantity" required>
        </div>
        <div class="mb-3">
            <label for="categorySelect" class="form-label">Select Category ID</label>
            <select class="form-select" id="categorySelect" name="category_id" required>
                <option value="">Select Category</option>
                <%
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
