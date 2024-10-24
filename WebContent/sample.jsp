<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/header.css">
    <title>Welcome to RevShop</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            background-image: url('path/to/your/background-image.jpg'); /* Update the path to your image */
            background-size: cover;
            background-position: center;
            height: 100vh;
            color: white; /* Text color */
        }
        .overlay {
            background-color: rgba(0, 0, 0, 0.5); /* Black overlay with opacity */
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
        h1 {
            font-size: 3rem;
            margin-bottom: 20px;
        }
        p {
            font-size: 1.5rem;
        }
    </style>
</head>
<body>
<%@include file="include/userheader.jsp" %>

<div class="overlay">
    <div>
        <h1>Welcome to RevShop</h1>
        <p>Discover amazing products from a wide variety of categories!</p>
    </div>
    
    
    
    
</div>
<div class="row">
			<!-- Fresh Fruits Category -->
			<div class="col-md-4 product-category">
				<img src="image/freshPomegranates.webp" class="img-fluid"
					alt="Fresh Fruits" style="width: 100px; height: 100px;">
				<h3>Fresh Fruits</h3>
				<a href="fruit.jsp" class="btn btn-outline-primary">View</a>
				<!-- Updated href -->
			</div>

			<!-- Vegetables Category -->
			<div class="col-md-4 product-category">
				<img src="image/freshCucumber.webp" class="img-fluid"
					alt="Vegetables" style="width: 100px; height: 100px;">
				<h3>Vegetables</h3>
				<a href="vegitable.jsp" class="btn btn-outline-primary">View</a>
				<!-- Updated href -->
			</div>

			<!-- Dry Fruits Category -->
			<div class="col-md-4 product-category">
				<img src="image/DryFruit.webp" class="img-fluid" alt="Dry Fruits"
					style="width: 100px; height: 100px;">
				<h3>Dry Fruits</h3>
				<a href="dryfruit.jsp" class="btn btn-outline-primary">View</a>
				<!-- Updated href -->
			</div>
		</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
