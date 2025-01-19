<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce Home Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="#">E-Shop</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="product.jsp">ProductManage</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="product-list">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="category-list">Categories</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="category.jsp">CategoryManage</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="admin-login.jsp">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="user-list">Users</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Search Bar -->
<div class="container my-4">
    <div class="row">
        <div class="col-md-8 mx-auto">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Search for products...">
                <button class="btn btn-primary">Search</button>
            </div>
        </div>
    </div>
</div>
<a href="index.jsp">home</a>
<h1>IMPLEMENT ADMIN DASHBOARD</h1>
<!-- Filters and Categories -->
<%--<div class="container">--%>
<%--    <div class="row">--%>
<%--        <!-- Filters Sidebar -->--%>
<%--        <div class="col-md-3">--%>
<%--            <h5>Filter By</h5>--%>
<%--            <div class="mb-3">--%>
<%--                <label for="priceRange" class="form-label">Price Range</label>--%>
<%--                <input type="range" class="form-range" id="priceRange" min="0" max="1000" step="10">--%>
<%--            </div>--%>
<%--            <h6>Categories</h6>--%>
<%--            <ul class="list-group">--%>
<%--                <li class="list-group-item"><a href="#">Electronics</a></li>--%>
<%--                <li class="list-group-item"><a href="#">Clothing</a></li>--%>
<%--                <li class="list-group-item"><a href="#">Home Appliances</a></li>--%>
<%--                <li class="list-group-item"><a href="#">Books</a></li>--%>
<%--            </ul>--%>
<%--        </div>--%>

<%--        <!-- Products Section -->--%>
<%--        <div class="col-md-9">--%>
<%--            <h5>Products</h5>--%>
<%--            <div class="row row-cols-1 row-cols-md-3 g-4">--%>
<%--                <!-- Product Card -->--%>
<%--                <div class="col">--%>
<%--                    <div class="card h-100">--%>
<%--                        <img src="https://via.placeholder.com/150" class="card-img-top" alt="Product Image">--%>
<%--                        <div class="card-body">--%>
<%--                            <h5 class="card-title">Product Name</h5>--%>
<%--                            <p class="card-text">$99.99</p>--%>
<%--                            <a href="#" class="btn btn-primary">Add to Cart</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <!-- Repeat Product Card -->--%>
<%--                <div class="col">--%>
<%--                    <div class="card h-100">--%>
<%--                        <img src="https://via.placeholder.com/150" class="card-img-top" alt="Product Image">--%>
<%--                        <div class="card-body">--%>
<%--                            <h5 class="card-title">Another Product</h5>--%>
<%--                            <p class="card-text">$49.99</p>--%>
<%--                            <a href="#" class="btn btn-primary">Add to Cart</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <!-- Add more product cards as needed -->--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
