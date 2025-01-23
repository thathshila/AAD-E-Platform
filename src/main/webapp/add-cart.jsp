<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.eplatform.dto.ProductDTO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Products</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .container {
            margin-top: 50px;
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #007bff;
        }
        .btn-primary, .btn-danger {
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Manage Products</h1>

    <!-- Search Bar -->
    <form action="product-list" method="get" class="mb-4">
        <div class="input-group">
            <input type="text" class="form-control" name="query" placeholder="Search products..." required>
            <button type="submit" name="action" value="search" class="btn btn-primary">Search</button>
        </div>
    </form>

    <!-- Add New Product Button -->
    <div class="text-end mb-3">
        <a href="product.jsp" class="btn btn-success">Add New Product</a>
    </div>

    <!-- Product Table -->
    <table class="table table-bordered table-hover">
        <thead class="table-dark">
        <tr>
            <th>Product ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Category ID</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<ProductDTO> products = (List<ProductDTO>) request.getAttribute("products");
            if (products != null && !products.isEmpty()) {
                for (ProductDTO product : products) {
        %>
        <tr>
            <td><%= product.getProduct_id() %></td>
            <td><%= product.getProductName() %></td>
            <td><%= product.getProductDescription() %></td>
            <td>$<%= product.getProductPrice() %></td>
            <td><%= product.getProductQuantity() %></td>
            <td><%= product.getCategory_id() %></td>
            <td>
                <!-- Update Button -->
                <form action="manageProducts" method="get" style="display:inline;">
                    <input type="hidden" name="productId" value="<%= product.getProduct_id() %>">
                    <button type="submit" name="action" value="edit" class="btn btn-primary btn-sm">Update</button>
                </form>

                <!-- Delete Button -->
                <form action="manageProducts" method="post" style="display:inline;">
                    <input type="hidden" name="productId" value="<%= product.getProduct_id() %>">
                    <button type="submit" name="action" value="delete" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this product?');">Delete</button>
                </form>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="7" class="text-center">No products found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
