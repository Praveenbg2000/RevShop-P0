package finalproject.com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import finalproject.com.connection.DBConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateStockServlet")
public class UpdateStockServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get product ID, new stock quantity, price, and image name from the request
        String productId = request.getParameter("productId");  // Add productId
        String newStockQty = request.getParameter("quantity");
        String newPrice = request.getParameter("price");
        String imageName = request.getParameter("image"); // Get the image name from the form

        // Fallback to default image if no image name is provided
        if (imageName == null || imageName.isEmpty()) {
            System.out.print("Enter Image Path"); // Set to default image if none provided
        }

        if (productId == null || newStockQty == null || newPrice == null 
            || productId.isEmpty() || newStockQty.isEmpty() || newPrice.isEmpty()) {
            // Handle missing or invalid input
            response.getWriter().println("<h2>Product ID, Stock Quantity, Price, and Image Name must be provided.</h2>");
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Establish a connection
            conn = DBConnection.getConnection();

            // Update both the price, stock quantity, and image for the product in the productall table
            String updateStockSQL = "UPDATE productall SET price = ?, qty = ?, image = ? WHERE pid = ?";  // Ensure correct column names

            // Prepare the statement
            stmt = conn.prepareStatement(updateStockSQL);
            stmt.setDouble(1, Double.parseDouble(newPrice));  // Set new price
            stmt.setInt(2, Integer.parseInt(newStockQty));    // Set new quantity
            stmt.setString(3, imageName);                      // Use the provided image name
            stmt.setInt(4, Integer.parseInt(productId));      // Set product ID

            // Execute the update
            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                response.getWriter().println("<h2>Stock, price, and image updated successfully for product ID: " + productId + "</h2>");
                response.sendRedirect("productstocks.jsp");

            } else {
                response.getWriter().println("<h2>Product not found with ID: " + productId + "</h2>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("<h2>Error updating product: " + e.getMessage() + "</h2>");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("<h2>Database driver not found: " + e.getMessage() + "</h2>");
        } 
    }
}
