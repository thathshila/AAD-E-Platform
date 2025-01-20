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
        body {
            font-family: Arial, sans-serif;
        }
        .navbar-brand {
            font-size: 1.5rem;
            font-weight: bold;
        }
        .hero {
            background: url('https://via.placeholder.com/1920x600') no-repeat center center/cover; /* Replace with your image */
            height: 30vh;
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
</div>

<!-- Hero Carousel -->
<div id="heroCarousel" class="carousel slide hero-carousel" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="images/04.webp" class="d-block w-100" alt="Slide 1">
            <div class="carousel-caption d-none d-md-block">
                <h5>Just in: Holiday Gifts</h5>
                <p>Find the perfect gift for your loved ones.</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="images/02.jpg" class="d-block w-100" alt="Slide 2">
            <div class="carousel-caption d-none d-md-block">
                <h5>Shop the Latest Trends</h5>
                <p>Explore our new collection.</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="images/03.jpg" class="d-block w-100" alt="Slide 3">
            <div class="carousel-caption d-none d-md-block">
                <h5>Exclusive Deals</h5>
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

<!-- Categories Section -->
<div class="container my-5">
    <h2 class="text-center mb-4">Shop by Categories</h2>
    <div class="row g-4">
        <div class="col-md-3">
            <div class="card category-card shadow-sm border-0">
                <!-- Card Image -->
                <img src="images/03.jpg" alt="Toys" class="card-img-top rounded-top" style="height: 200px; object-fit: cover;">

                <!-- Card Body -->
                <div class="card-body text-center">
                    <!-- Title -->
                    <h5 class="card-title fw-bold">Toys</h5>
                    <!-- Buttons -->
                    <form action="toy.jsp" class="mb-2">
                        <button class="btn btn-warning text-dark fw-semibold w-100">Shop Now</button>
                    </form>
                    <form action="cart.jsp">
                        <button class="btn btn-outline-warning fw-semibold w-100">Add to Cart</button>
                    </form>
                </div>
            </div>
        </div>


        <div class="col-md-3">
            <div class="card category-card shadow-sm border-0">
                <!-- Card Image -->
                <img src="images/03.jpg" alt="Toys" class="card-img-top rounded-top" style="height: 200px; object-fit: cover;">

                <!-- Card Body -->
                <div class="card-body text-center">
                    <!-- Title -->
                    <h5 class="card-title fw-bold">Toys</h5>
                    <!-- Buttons -->
                    <form action="toy.jsp" class="mb-2">
                        <button class="btn btn-warning text-dark fw-semibold w-100">Shop Now</button>
                    </form>
                    <form action="cart.jsp">
                        <button class="btn btn-outline-warning fw-semibold w-100">Add to Cart</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card category-card shadow-sm border-0">
                <!-- Card Image -->
                <img src="images/03.jpg" alt="Toys" class="card-img-top rounded-top" style="height: 200px; object-fit: cover;">

                <!-- Card Body -->
                <div class="card-body text-center">
                    <!-- Title -->
                    <h5 class="card-title fw-bold">Toys</h5>
                    <!-- Buttons -->
                    <form action="toy.jsp" class="mb-2">
                        <button class="btn btn-warning text-dark fw-semibold w-100">Shop Now</button>
                    </form>
                    <form action="cart.jsp">
                        <button class="btn btn-outline-warning fw-semibold w-100">Add to Cart</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card category-card shadow-sm border-0">
                <!-- Card Image -->
                <img src="images/03.jpg" alt="Toys" class="card-img-top rounded-top" style="height: 200px; object-fit: cover;">

                <!-- Card Body -->
                <div class="card-body text-center">
                    <!-- Title -->
                    <h5 class="card-title fw-bold">Toys</h5>
                    <!-- Buttons -->
                    <form action="toy.jsp" class="mb-2">
                        <button class="btn btn-warning text-dark fw-semibold w-100">Shop Now</button>
                    </form>
                    <form action="cart.jsp">
                        <button class="btn btn-outline-warning fw-semibold w-100">Add to Cart</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Categories Section -->
<div class="container my-5">
    <h2 class="text-center mb-4">Shop by Categories</h2>
    <div class="row g-4">
        <div class="col-md-3">
            <div class="card category-card shadow-sm border-0">
                <!-- Card Image -->
                <img src="images/03.jpg" alt="Toys" class="card-img-top rounded-top" style="height: 200px; object-fit: cover;">

                <!-- Card Body -->
                <div class="card-body text-center">
                    <!-- Title -->
                    <h5 class="card-title fw-bold">Toys</h5>
                    <!-- Buttons -->
                    <form action="toy.jsp" class="mb-2">
                        <button class="btn btn-warning text-dark fw-semibold w-100">Shop Now</button>
                    </form>
                    <form action="cart.jsp">
                        <button class="btn btn-outline-warning fw-semibold w-100">Add to Cart</button>
                    </form>
                </div>
            </div>
        </div>


        <div class="col-md-3">
            <div class="card category-card shadow-sm border-0">
                <!-- Card Image -->
                <img src="images/03.jpg" alt="Toys" class="card-img-top rounded-top" style="height: 200px; object-fit: cover;">

                <!-- Card Body -->
                <div class="card-body text-center">
                    <!-- Title -->
                    <h5 class="card-title fw-bold">Toys</h5>
                    <!-- Buttons -->
                    <form action="toy.jsp" class="mb-2">
                        <button class="btn btn-warning text-dark fw-semibold w-100">Shop Now</button>
                    </form>
                    <form action="cart.jsp">
                        <button class="btn btn-outline-warning fw-semibold w-100">Add to Cart</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card category-card shadow-sm border-0">
                <!-- Card Image -->
                <img src="images/03.jpg" alt="Toys" class="card-img-top rounded-top" style="height: 200px; object-fit: cover;">

                <!-- Card Body -->
                <div class="card-body text-center">
                    <!-- Title -->
                    <h5 class="card-title fw-bold">Toys</h5>
                    <!-- Buttons -->
                    <form action="toy.jsp" class="mb-2">
                        <button class="btn btn-warning text-dark fw-semibold w-100">Shop Now</button>
                    </form>
                    <form action="cart.jsp">
                        <button class="btn btn-outline-warning fw-semibold w-100">Add to Cart</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card category-card shadow-sm border-0">
                <!-- Card Image -->
                <img src="images/03.jpg" alt="Toys" class="card-img-top rounded-top" style="height: 200px; object-fit: cover;">

                <!-- Card Body -->
                <div class="card-body text-center">
                    <!-- Title -->
                    <h5 class="card-title fw-bold">Toys</h5>
                    <!-- Buttons -->
                    <form action="toy.jsp" class="mb-2">
                        <button class="btn btn-warning text-dark fw-semibold w-100">Shop Now</button>
                    </form>
                    <form action="cart.jsp">
                        <button class="btn btn-outline-warning fw-semibold w-100">Add to Cart</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

