<%--
  Created by IntelliJ IDEA.
  User: Thathshila
  Date: 1/18/2025
  Time: 12:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Landing Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Hero Section Styling */
        .hero {
            height: 100vh;
            background: url('https://via.placeholder.com/1920x1080') no-repeat center center fixed; /* Replace with your image URL */
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            text-align: center;
            color: #fff;
        }

        /* Overlay for Dark Effect */
        .hero::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            z-index: 1;
        }

        /* Text and Buttons */
        .hero-content {
            z-index: 2;
            max-width: 700px;
            padding: 20px;
        }

        .hero h1 {
            font-size: 3.5rem;
            font-weight: bold;
            margin-bottom: 20px;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.5);
        }

        .hero p {
            font-size: 1.25rem;
            margin-bottom: 30px;
            line-height: 1.6;
        }

        .btn-custom {
            padding: 12px 30px;
            border-radius: 50px;
            font-size: 1.1rem;
            font-weight: 500;
            transition: all 0.3s ease-in-out;
        }

        .btn-custom-primary {
            background-color: #0d6efd;
            color: #fff;
        }

        .btn-custom-primary:hover {
            background-color: #0056b3;
            box-shadow: 0px 4px 10px rgba(13, 110, 253, 0.3);
        }

        .btn-custom-outline {
            border: 2px solid #fff;
            color: #fff;
        }

        .btn-custom-outline:hover {
            background-color: #fff;
            color: #000;
        }
    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark py-3">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">E-Shop</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link active" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="cart.jsp">Cart</a></li>
                <li class="nav-item"><a class="nav-link" href="#">About</a></li>
                <li class="nav-item"><a class="nav-link" href="signin.jsp">Login</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero">
    <div class="hero-content text-center">
        <h1>Welcome to E-Shop</h1>
        <p>Discover incredible products and exclusive deals tailored just for you!</p>
        <div>
            <a href="signup.jsp" class="btn btn-custom btn-custom-primary me-2">Sign Up Now</a>
            <a href="signin.jsp" class="btn btn-custom btn-custom-outline">Sign In</a>
        </div>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
