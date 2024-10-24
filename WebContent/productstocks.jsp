<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Product Stocks</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/header.css">
    <style>
        .success-message {
            color: green;
        }
        .error-message {
            color: red;
        }
    </style>
</head>
<body>
<%@ include file="include/adminheader.jsp" %>

<div class="container">

    <%
        // Display success or error message if it exists
        String updateMessage = (String) session.getAttribute("updateMessage");
        if (updateMessage != null) {
    %>
        <h2 ><%= updateMessage %></h2>
    <%
        // Remove the message from the session after displaying it
        session.removeAttribute("updateMessage");
        }
    %>

    <%
        String DB_URL = "jdbc:mysql://localhost:3306/revshop";
        String DB_USER = "root";
        String DB_PASSWORD = "Praveen@2000";
        Connection connection = null;

        try {
            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            
            // Fetching products for display
            String sql = "SELECT * FROM productall"; 
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            // Check if the ResultSet is empty
            if (!resultSet.isBeforeFirst()) {
                out.println("<p>No products found.</p>");
            } else {
                %>
                <h3 class="my-4">Current Product Stocks</h3>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Image Path</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                    while (resultSet.next()) {
                        int id = resultSet.getInt("pid");
                        double price = resultSet.getDouble("price");
                        String name = resultSet.getString("pname");
                        int qty = resultSet.getInt("qty");
                        String image = resultSet.getString("image");
                        String cat = resultSet.getString("category");
                    %>
                        <tr>
                            <td><%= id %></td>
                            <td><%= name %></td>
                            <td><%= cat %></td>
                            <td>
                                <form action="UpdateStockServlet" method="post">
                                    <input type="hidden" name="productId" value="<%= id %>">
                                    <input type="number" name="price" value="<%= price %>" step="0.01" min="0" class="form-control" required>
                            </td>
                            <td>
                                    <input type="number" name="quantity" value="<%= qty %>" min="0" class="form-control" required>
                            </td>
                            <td>
                            <input type="text" name="image" value="<%= image %>" min="0" class="form-control" required>
                            </td>
                            <td>
                                    <button type="submit" class="btn btn-success btn-sm">Update</button>
                                </form>
                            </td>
                        </tr>
                    <%
                    }
                    %>
                    </tbody>
                </table>
                <%
            }
            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException sqlEx) {
            out.println("<p>Error in SQL: " + sqlEx.getMessage() + "</p>");
            sqlEx.printStackTrace();
        } catch (ClassNotFoundException cnfEx) {
            out.println("<p>JDBC Driver not found: " + cnfEx.getMessage() + "</p>");
        } catch (Exception e) {
            out.println("<p>General error: " + e.getMessage() + "</p>");
        }
    %>
</div>

<%@ include file="include/footer.jsp" %>
</body>
</html>
