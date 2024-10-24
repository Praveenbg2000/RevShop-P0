<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ include file="include/head.jsp" %>
<%@ include file="include/userheader.jsp" %>
<%@ page import="finalproject.com.model.User" %>
<%@ page import="finalproject.com.model.Admin" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Orders Checked by Admin</title>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
        }
        .gradient-custom {
            background: linear-gradient(to top left, rgba(205, 156, 242, 1), rgba(246, 243, 255, 1));
        }
        h3 {
            font-family: 'Open Sans', sans-serif;
            color: #5f4b8c;
        }
        table {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container my-5 gradient-custom p-4 rounded">
       <%
    // Retrieve the user from the session
    Object auth = session.getAttribute("auth");
     // Declare user outside the if block

    // Check if the user is an instance of User or Admin
    if (auth instanceof User) {
        user = (User) auth; // Assign user if auth is a User
    } else if (auth instanceof Admin) {
        // Handle admin case
        response.sendRedirect("adminDashboard.jsp");
        return;
    } else {
        // Redirect to login if not authenticated
        response.sendRedirect("login.jsp");
        return;
    }

    // Database connection and order retrieval
    List<Map<String, Object>> orders = new ArrayList<>();
    String query = "SELECT * FROM orders WHERE user_id = ?"; // Define query once

    try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/revshop", "root", "Praveen@2000");
         PreparedStatement pstmt = conn.prepareStatement(query)) {

        // Load MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        pstmt.setInt(1, user.getId()); // Use user ID from the session
        try (ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Map<String, Object> order = new HashMap<>();
                order.put("order_id", rs.getString("order_id"));
                order.put("product_name", rs.getString("product_name"));
                order.put("quantity", rs.getInt("quantity"));
                order.put("price", rs.getDouble("price"));
                order.put("order_date", rs.getTimestamp("order_date"));
                order.put("status", rs.getString("status"));
                orders.add(order);
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error fetching orders: " + e.getMessage());
    }
%>

        <h3 class="text-center">My Orders - <%= user.getName() %></h3> <!-- Display user name -->
        <table class="table table-light table-striped">
            <thead>
                <tr>
                    <th scope="col">Order ID</th>
                    <th scope="col">Product Name</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Price</th>
                    <th scope="col">Order Date</th>
                    <th scope="col">Status</th>
                    <th scope="col">Update Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                if (!orders.isEmpty()) {
                    for (Map<String, Object> order : orders) {
                %>
                <tr>
                    <td><%= order.get("order_id") %></td>
                    <td><%= order.get("product_name") %></td>
                    <td><%= order.get("quantity") %></td>
                    <td>Rs.<%= order.get("price") %>/-</td>
                    <td><%= order.get("order_date") %></td>
                    <td><%= order.get("status") != null ? order.get("status") : "Pending" %></td>
                    <td>
                        <form action="UpdateOrderStatusServletbyAdmin" method="post">
                            <input type="hidden" name="order_id" value="<%= order.get("order_id") %>">
                            <select name="new_status" class="form-control">
                                <option value="Pending" <%= "Pending".equals(order.get("status")) ? "selected" : "" %>>Pending</option>
                                <option value="Shipped" <%= "Shipped".equals(order.get("status")) ? "selected" : "" %>>Shipped</option>
                                <option value="Delivered" <%= "Delivered".equals(order.get("status")) ? "selected" : "" %>>Delivered</option>
                                <option value="Cancelled" <%= "Cancelled".equals(order.get("status")) ? "selected" : "" %>>Cancelled</option>
                            </select>
                            <button type="submit" class="btn btn-primary btn-sm mt-2">Update</button>
                        </form>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="7" class="text-center">No orders found.</td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>
    <%@ include file="include/footer.jsp" %>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
