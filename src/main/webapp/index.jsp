<%--
  Created by IntelliJ IDEA.
  User: Thathshila
  Date: 1/17/2025
  Time: 11:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce Platform</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom CSS */
        .hero {
            background-image: url('https://via.placeholder.com/1920x500'); /* Replace with your image URL */
            background-size: cover;
            background-position: center;
            color: white;
            padding: 50px 0;
            text-align: center;
        }
        .category-img {
            height: 150px;
            object-fit: cover;
        }
        .product-card img {
            height: 200px;
            object-fit: cover;
        }
        .category-section, .product-section {
            margin-top: 30px;
        }
    </style>
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
                    <a class="nav-link" href="admin.jsp">ADMIN</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Categories</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="cart.jsp">Cart <span class="badge bg-primary">0</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="signin.jsp">Login</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<div class="hero">
    <h1>Welcome to E-Shop</h1>
    <p>Discover amazing deals and products tailored for you</p>
</div>

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

<!-- Categories Section -->
<div class="container category-section">
    <h2 class="text-center">Shop by Category</h2>
    <div class="row row-cols-1 row-cols-md-4 g-4">
        <!-- Category Card -->
        <div class="col">
            <div class="card">
                <img src="https://via.placeholder.com/300x150" class="card-img-top category-img" alt="Category Image">
                <div class="card-body text-center">
                    <h5 class="card-title">Electronics</h5>
                </div>
            </div>
        </div>
        <!-- Repeat for more categories -->
        <div class="col">
            <div class="card">
                <img src="https://via.placeholder.com/300x150" class="card-img-top category-img" alt="Category Image">
                <div class="card-body text-center">
                    <h5 class="card-title">Fashion</h5>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Products Section -->
<div class="container product-section">
    <h2 class="text-center">Featured Products</h2>
    <div class="row row-cols-1 row-cols-md-4 g-4">
        <!-- Product Card -->
        <div class="col">
            <a href="toy.jsp">
            <div class="card product-card" >
                <img src="https://via.placeholder.com/200x200" class="card-img-top" alt="Product Image">
                <div class="card-body text-center">
                    <h5 class="card-title">Product Name</h5>
                    <p class="card-text">$99.99</p>
                    <button class="btn btn-primary">Add to Cart</button>
                </div>
            </div>
           </a>

        </div>
        <!-- Repeat for more products -->
        <div class="col">
            <div class="card product-card">
                <img src="https://via.placeholder.com/200x200" class="card-img-top" alt="Product Image">
                <div class="card-body text-center">
                    <h5 class="card-title">Another Product</h5>
                    <p class="card-text">$49.99</p>
                    <button class="btn btn-primary">Add to Cart</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

