<%--
  Created by IntelliJ IDEA.
  User: Thathshila
  Date: 1/18/2025
  Time: 12:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Essentials for Gamers</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .hero-section {
            background: linear-gradient(to right, #1b1f8a, #4b1ba9, #701bd5);
            color: #fff;
            text-align: center;
            padding: 50px 20px;
        }
        .hero-section h1 {
            font-size: 3rem;
            font-weight: bold;
        }
        .categories {
            text-align: center;
            margin: 40px 0;
        }
        .category-item img {
            width: 150px;
            height: auto;
            object-fit: contain;
            transition: transform 0.3s ease;
        }
        .category-item img:hover {
            transform: scale(1.1);
        }
    </style>
</head>
<body>

<!-- Hero Section -->
<div class="hero-section">
    <h1>Essentials for Gamers</h1>
</div>

<!-- Featured Categories Section -->
<div class="container">
    <h2 class="text-center my-4">Featured Categories</h2>
    <div class="row justify-content-center">
        <div class="col-6 col-md-2 text-center category-item">
            <img src="https://via.placeholder.com/150?text=Nintendo+Switch" alt="Nintendo Switch" class="img-fluid">
        </div>
        <div class="col-6 col-md-2 text-center category-item">
            <img src="https://via.placeholder.com/150?text=VR+Headset" alt="VR Headset" class="img-fluid">
        </div>
        <div class="col-6 col-md-2 text-center category-item">
            <img src="https://via.placeholder.com/150?text=Xbox+Series+S" alt="Xbox Series S" class="img-fluid">
        </div>
        <div class="col-6 col-md-2 text-center category-item">
            <img src="https://via.placeholder.com/150?text=Gaming+Laptop" alt="Gaming Laptop" class="img-fluid">
        </div>
        <div class="col-6 col-md-2 text-center category-item">
            <img src="https://via.placeholder.com/150?text=PS+Controller" alt="PS Controller" class="img-fluid">
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

