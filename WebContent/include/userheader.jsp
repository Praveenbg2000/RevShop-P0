<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="finalproject.com.model.User" %>

<header class="main-menu menu" style="background-color: orange;">
    <div class="container-fluid">
        <div class="row align-items-center justify-content-center">
            <div class="col-lg-11">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="navbar-brand" href="userindex.jsp">
                        <img src="image/logo.png" alt="logo" style="width: 120px; height: 95px;">
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#myNav"
                        aria-controls="myNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="nav-icon"><i class="fas fa-bars"></i></span>
                    </button>
                    <div class="collapse navbar-collapse main-menu-item" id="myNav">
                        <ul class="navbar-nav">
                            <li class="nav-item"><a class="nav-link" href="userindex.jsp">Home</a></li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">Categories</a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                    <a class="dropdown-item" href="fruit.jsp">Fruits</a>
                                    <a class="dropdown-item" href="vegitable.jsp">Vegetables</a>
                                    <a class="dropdown-item" href="dryfruit.jsp">Dry Fruits</a>
                                </div>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="index.jsp">Logout</a></li>
                            <li class="nav-item"><a class="nav-link" href="myorders.jsp">My Orders</a></li>
                        </ul>

                        <%
                            // Retrieve the user from the session
                            User user = null; // Declare user as null initially
                            try {
                                user = (User) session.getAttribute("auth");
                            } catch (ClassCastException e) {
                                // Handle the exception if the cast fails
                                out.println("Error retrieving user: " + e.getMessage());
                            }

                            if (user != null) {
                        %>
                            <div class="text-right" style="width: 100%;">
                                <h7 style="font-family: emoji; color: black;">Welcome to RevShop, <%= user.getName() %>!</h7>
                            </div>
                        <%
                            } else {
                                // Optionally, display a message when user is not logged in
                                out.println("<div class='text-right' style='width: 100%;'><h7 style='font-family: emoji; color: black;'>Welcome, Guest!</h7></div>");
                            }
                        %>

                        <div class="cart"><a href="cart.jsp"><i class="fas fa-shopping-cart" style="font-size: 45px;"></i></a></div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>

<!-- Include JS scripts -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
