<%--
  Created by IntelliJ IDEA.
  User: Thathshila
  Date: 1/19/2025
  Time: 8:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My E-Commerce Platform</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #ffffff;
        }
        .navbar {
            background-color: #343a40;
        }
        .navbar-brand, .nav-link {
            color: white !important;
        }
        .navbar-toggler-icon {
            background-color: white;
        }
        .hero-section {
            background-image: url('https://via.placeholder.com/1920x600'); /* Placeholder image */
            background-size: cover;
            background-position: center;
            height: 60vh;
            color: #4b8edd;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }
        .hero-section h1 {
            font-size: 3rem;
            font-weight: bold;
        }
        .category-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            text-align: center;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .category-card img {
            max-width: 100%;
            border-radius: 5px;
        }
        .footer {
            background-color: #343a40;
            color: white;
            padding: 20px 0;
            text-align: center;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">My E-Commerce</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Shop</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Categories</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Cart</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="view-profile.jsp">Profile</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero-section">
    <div>
        <h1>Welcome to My E-Commerce Platform</h1>
        <p>Discover the best products from top brands at unbeatable prices!</p>
        <a href="#" class="btn btn-warning btn-lg">Shop Now</a>
    </div>
</section>

<!-- Featured Categories Section -->
<section class="container mt-5">
    <h2 class="text-center mb-4">Featured Categories</h2>
    <div class="row">
        <div class="col-md-4 mb-4">
            <div class="category-card">
                <img src="https://via.placeholder.com/300x200" alt="Category 1">
                <h4>Electronics</h4>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="category-card">
                <img src="https://via.placeholder.com/300x200" alt="Category 2">
                <h4>Fashion</h4>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="category-card">
                <img src="https://via.placeholder.com/300x200" alt="Category 3">
                <h4>Home & Kitchen</h4>
            </div>
        </div>
    </div>
</section>

<!-- Featured Products Section -->
<section class="container mt-5">
    <h2 class="text-center mb-4">Featured Products</h2>
    <div class="row">
        <div class="col-md-3 mb-4">
            <div class="card">
                <img src="https://via.placeholder.com/300x200" class="card-img-top" alt="Product 1">
                <div class="card-body">
                    <h5 class="card-title">Product Name</h5>
                    <p class="card-text">$199.99</p>
                    <a href="#" class="btn btn-warning">Add to Cart</a>
                </div>
            </div>
        </div>
        <div class="col-md-3 mb-4">
            <div class="card">
                <img src="https://via.placeholder.com/300x200" class="card-img-top" alt="Product 2">
                <div class="card-body">
                    <h5 class="card-title">Product Name</h5>
                    <p class="card-text">$299.99</p>
                    <a href="#" class="btn btn-warning">Add to Cart</a>
                </div>
            </div>
        </div>
        <div class="col-md-3 mb-4">
            <div class="card">
                <img src="https://via.placeholder.com/300x200" class="card-img-top" alt="Product 3">
                <div class="card-body">
                    <h5 class="card-title">Product Name</h5>
                    <p class="card-text">$149.99</p>
                    <a href="#" class="btn btn-warning">Add to Cart</a>
                </div>
            </div>
        </div>
        <div class="col-md-3 mb-4">
            <div class="card">
                <img src="https://via.placeholder.com/300x200" class="card-img-top" alt="Product 4">
                <div class="card-body">
                    <h5 class="card-title">Product Name</h5>
                    <p class="card-text">$89.99</p>
                    <a href="#" class="btn btn-warning">Add to Cart</a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="footer">
    <p>&copy; 2025 My E-Commerce Platform. All rights reserved.</p>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
