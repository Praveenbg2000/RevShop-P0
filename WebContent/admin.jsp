<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add New Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/header.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Open Sans', sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Video background styling */
        .video-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: -1;
        }

        video {
            min-width: 100%;
            min-height: 100%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            object-fit: cover; /* Ensures the video covers the entire background */
        }

        .container {
            position: relative;
            z-index: 1; /* Ensures the container is above the video */
        }

        .card {
            border-radius: 30px;
            background: rgba(255, 255, 255, 0.8);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #7CB9E8;
            color: #fff;
            border-radius: 30px 30px 0 0;
            font-size: 24px;
        }

        .form-control, .form-control-file {
            border-radius: 15px;
        }

        .btn {
            border-radius: 30px;
        }
    </style>
</head>
<body>

<%@include file="include/adminheader.jsp" %>

<div class="video-background">
    <video autoplay loop muted>
        <source src="videos/your-video.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>
</div>

<div class="container">
    <div class="card w-50 mx-auto my-5">
        <div class="card-header text-center">Add New Product</div>
        <form class="container p-4" action="InsertProductServlet" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label>Product Name:</label>
                <input type="text" id="productname" name="productname" class="form-control" required placeholder="Enter product name">
            </div>
            <div class="form-group">
                <label>Product Description:</label>
                <textarea id="description" name="description" class="form-control" required placeholder="Enter product description"></textarea>
            </div>
            <div class="form-group">
                <label>Price:</label>
                <input type="number" id="price" name="price" class="form-control" required step="0.01" placeholder="Enter price">
            </div>
            <div class="form-group">
                <label>Category:</label>
                <select id="category" class="form-control" name="category" required>
                    <option value="" disabled selected>Category</option>
                    <option value="fruit">Fruits</option>
                    <option value="vegetable">Vegetables</option>
                    <option value="dryfruit">Dry Fruits</option>
                </select>
            </div>
            <div class="form-group">
                <label>Quantity:</label>
                <input type="number" id="qty" name="qty" class="form-control" required placeholder="Enter quantity">
            </div>
            <div class="form-group">
                <label>Product Image:</label>
                <input type="text" id="image" name="image" class="form-control-file">
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary btn-lg">Add Product</button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
