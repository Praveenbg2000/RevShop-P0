<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products - RevShop</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/header.css">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/332a215f17.js" crossorigin="anonymous"></script>
</head>
<body>

<%@include file="include/userheader.jsp" %>

<h1 class="text-center my-4">All Dry Fruits</h1>

<div class="container">
    <div class="row">
        <%
            // Database connection parameters
            String DB_URL = "jdbc:mysql://localhost:3306/revshop";
            String DB_USER = "root";
            String DB_PASSWORD = "Praveen@2000";
           
            try {
                // Load MySQL driver
                Class.forName("com.mysql.cj.jdbc.Driver");
               
                // Establish connection
                Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
               
                // Query to get all products
                String sql = "SELECT * FROM productdry";
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery(sql);
               
                // Loop through the products and display them
                while (resultSet.next()) {
                    String name = resultSet.getString("pname");
                    String description = resultSet.getString("description");
                    double price = resultSet.getDouble("price");
                    String imageUrl = resultSet.getString("image");
        %>
        <div class="col-md-3 mb-4">
            <div class="card" style="width: 18rem;">
                <img class="card-img-top" src="image/<%= imageUrl %>" alt="<%= name %> Image" style="width: 120px; height: 220px; object-fit: cover;">
                <div class="card-body">
                    <h5 class="card-title"><strong><i><%= name %></i></strong></h5>
                    <p class="card-text"><%= description %></p>
                    <p class="card-text">Price: <%= price %></p>
                    <a href="cart.jsp?pname=<%= name %>&price=<%= price %>&description=<%= description %>&image=<%= imageUrl %>" class="btn btn-primary">Add to Cart</a>

                    <a href="checkout.jsp" class="btn btn-success">Buy Now</a>
                </div>
            </div>
        </div>
        <%
                }
               
                // Close resources
                resultSet.close();
                statement.close();
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
        %>
            <p>Error occurred while fetching products: <%= e.getMessage() %></p>
        <%
            }
        %>
    </div> <!-- End of row -->
</div> <!-- End of container -->

</body>

</html>