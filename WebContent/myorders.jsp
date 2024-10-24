<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ include file="include/head.jsp" %>
<%@ include file="include/userheader.jsp" %>
<%@ page import="finalproject.com.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>My Orders</title>
    <link rel="stylesheet" href="css/header.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
        }

        .gradient-custom {
            /* fallback for old browsers */
            background: #cd9cf2;
            /* Chrome 10-25, Safari 5.1-6 */
            background: -webkit-linear-gradient(to top left, rgba(205, 156, 242, 1), rgba(246, 243, 255, 1));
            /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
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
        <h3 class="text-center">My Orders</h3>
        <%
            // Retrieve the user from the session
            User user1 = (User) session.getAttribute("auth");
            if (user1 == null) {
                // If user is not logged in, redirect to login page
                response.sendRedirect("login.jsp");
                return; // Exit to prevent further processing
            }

            // Connect to the database to retrieve orders
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            List<Map<String, Object>> orders = new ArrayList<>();

            try {
                // Load the database driver (e.g., MySQL)
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/revshop", "root", "Praveen@2000");

                // Query to get orders for the logged-in user
                String sql = "SELECT * FROM orders WHERE user_id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, user1.getId());
                rs = pstmt.executeQuery();

                // Retrieve orders
                while (rs.next()) {
                    Map<String, Object> order = new HashMap<>();
                    order.put("order_id", rs.getString("order_id")); // Use getString instead of getInt
                    order.put("product_name", rs.getString("product_name"));
                    order.put("quantity", rs.getInt("quantity"));
                    order.put("price", rs.getDouble("price"));
                    order.put("order_date", rs.getTimestamp("order_date"));
                    order.put("status", rs.getString("status")); // Ensure status is retrieved
                    orders.add(order);
                }

            } catch (Exception e) {
                e.printStackTrace(); // Log the error to the console
                out.println("Error fetching orders: " + e.getMessage());
            } finally {
                // Close resources in finally block to avoid resource leaks
                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
        %>

        <table class="table table-light table-striped">
            <thead>
                <tr>
                    <th scope="col">Order ID</th>
                    <th scope="col">Product Name</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Price</th>
                    <th scope="col">Order Date</th>
                    <th scope="col">Status</th>
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
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="6" class="text-center">No orders found.</td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>
    <!-- End of Container -->
    <%@ include file="include/footer.jsp" %>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
