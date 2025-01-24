<%@ page import="lk.ijse.eplatform.dto.ProductDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Thathshila
  Date: 1/20/2025
  Time: 6:25 PM
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
        body {
            font-family: Arial, sans-serif;
        }
        .navbar-brand {
            font-size: 1.5rem;
            font-weight: bold;
        }
        .hero {
            background: url('https://via.placeholder.com/1920x600') no-repeat center center/cover; /* Replace with your image */
            height: 20vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: white;
            padding: 0 20px;
            box-shadow: inset 0 0 100px rgba(0, 0, 0, 0.6); /* Adds a dark overlay effect */
            position: relative;
        }

        /* Overlay for better text visibility */
        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5); /* Adds a semi-transparent overlay */
            z-index: 1;
        }

        .hero h1 {
            font-size: 3rem;
            font-weight: 700;
            margin: 0;
            z-index: 2;
            position: relative;
        }

        .hero p {
            font-size: 1.25rem;
            font-weight: 300;
            margin-top: 10px;
            z-index: 2;
            position: relative;
        }
        .hero-carousel img {
            height: 400px;
            object-fit: cover;
        }
        .category-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .category-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }
        .category-card img {
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            object-fit: cover;
            height: 150px;
        }
        .footer {
            background-color: #f8f9fa;
            padding: 20px 0;
        }
        .footer .fa {
            margin-right: 10px;
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
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="new-product-list">Categories</a>
                </li>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link" href="add-cart.jsp">ADD Cart <span class="badge bg-primary">0</span></a>--%>
<%--                </li>--%>
                <li class="nav-item">
                    <a class="nav-link" href="signin.jsp">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="admin.jsp">ADMIN</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="add-cart.jsp">Cart <span class="badge bg-primary"></span></a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<%--category--%>
<%--<div class="container mt-5">--%>
<%--    <div class="category-menu">--%>
<%--        <h5 class="mb-3">All Categories</h5>--%>
<%--        <a href="category" class="btn btn-primary w-100 mb-4" role="button">Add New Product</a>--%>
<%--        <div class="mb-3">--%>
<%--            <label for="categorySelect" class="form-label">Select Category ID</label>--%>
<%--            <select class="form-select" id="categorySelect" name="category_name" required>--%>
<%--                <option value="">Select Category</option>--%>
<%--        <%--%>
<%--            List<String> categoryIds = (List<String>) request.getAttribute("categories");--%>
<%--            if (categoryIds != null && !categoryIds.isEmpty()) {--%>
<%--                for (String categoryName : categoryIds) {--%>
<%--        %>--%>
<%--        <option value="<%= categoryName %>"><%= categoryName %></option>--%>
<%--        <%--%>
<%--            }--%>
<%--        } else {--%>
<%--        %>--%>
<%--        <option value="" disabled>No categories available</option>--%>
<%--        <%--%>
<%--            }--%>
<%--        %>--%>
<%--    </div>--%>
<%--</div>--%>

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
                <button class="btn btn-primary" style="background-color: #f0c14b">Search</button>
            </div>
        </div>
    </div>
</div>
    <a href="new-product-list" class="btn btn-primary w-100" style="background-color:#f0c14b" role="button">SHOP Now</a>

<!-- Hero Carousel -->
<div id="heroCarousel" class="carousel slide hero-carousel" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="uploads/04.webp" class="d-block w-100" alt="Slide 1">
            <div class="carousel-caption d-none d-md-block">
                <h1 style="color: white">Just in: Holiday Gifts</h1>
                <p>Find the perfect gift for your loved ones.</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="uploads/02.jpg" class="d-block w-100" alt="Slide 2">
            <div class="carousel-caption d-none d-md-block">
                <h1 style="color: white">Shop the Latest Trends</h1>
                <p>Explore our new collection.</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="uploads/03.jpg" class="d-block w-100" alt="Slide 3">
            <div class="carousel-caption d-none d-md-block">
                <h1 style="color: white">Exclusive Deals</h1>
                <p>Save more with our special offers.</p>
            </div>
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
    </button>
</div>

<%--<!-- Categories Section -->--%>
<div class="container mt-5">
    <h1 class="text-center mb-4">Our Products</h1>

    <%
        // Fetch the product list passed from the servlet
        List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("productList");
        if (productList != null && !productList.isEmpty()) {
    %>
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
        <%
            for (ProductDTO product : productList) {
        %>
        <div class="col">
            <div class="card h-100">
                <!-- Product Image -->
                <img src="<%= product.getImage_path() %>" class="card-img-top" alt="<%= product.getProductName() %>" style="height: 200px; object-fit: cover;">

                <div class="card-body">
                    <!-- Product Name -->
                    <h5 class="card-title"><%= product.getProductName() %></h5>

                    <!-- Product Description -->
                    <p class="card-text text-muted"><%= product.getProductDescription() %></p>

                    <!-- Product Price -->
                    <p class="fw-bold">Price: $<%= product.getProductPrice() %></p>

                    <!-- Product Quantity -->
                    <p>Available: <%= product.getProductQuantity() %> units</p>

                    <!-- Action Button -->
                    <form action="cart" method="post">
                        <input type="hidden" name="product_id" value="<%= product.getProduct_id() %>">
                        <input type="hidden" name="product_name" value="<%= product.getProductName() %>">
                        <input type="hidden" name="product_price" value="<%= product.getProductPrice() %>">
                        <input type="hidden" name="product_quantity" value="1">
                        <input type="hidden" name="product_image" value="<%= product.getImage_path() %>">
                        <button type="submit" class="btn btn-danger">Add to Cart</button>
                    </form>

                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
    <% } else { %>
    <div class="alert alert-warning text-center" role="alert">
        No products available at the moment.
    </div>
    <% } %>
</div>

<!-- Footer -->
<footer class="footer text-center">
    <div class="container">
        <p>Follow us on</p>
        <div>
            <a href="#"><i class="fa fa-facebook fa-lg"></i></a>
            <a href="#"><i class="fa fa-twitter fa-lg"></i></a>
            <a href="#"><i class="fa fa-instagram fa-lg"></i></a>
            <a href="#"><i class="fa fa-linkedin fa-lg"></i></a>
        </div>
        <p class="mt-3">© 2025 E-Shop. All Rights Reserved.</p>
    </div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
