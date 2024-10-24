package finalproject.com.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import finalproject.com.connection.DBConnection;

@WebServlet("/InsertProductServlet")
@MultipartConfig(maxFileSize = 16177215) // 15MB
public class ProductInsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form parameters
        String productName = request.getParameter("productname");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        String category = request.getParameter("category");
        String qtyStr = request.getParameter("qty");

        // Get the uploaded image file part
        Part filePart = request.getPart("image"); // Retrieve the file part
        InputStream inputStream = null; // Input stream of the uploaded file

        if (filePart != null) {
            // Obtain input stream of the uploaded file
            inputStream = filePart.getInputStream();
        }

        // Validate parameters
        if (productName == null || productName.trim().isEmpty() ||
            description == null || description.trim().isEmpty() ||
            priceStr == null || priceStr.trim().isEmpty() ||
            category == null || category.trim().isEmpty() ||
            qtyStr == null || qtyStr.trim().isEmpty()) {

            response.getWriter().println("All fields are required.");
            return; // Stop processing further if validation fails
        }

        // Parse numeric values
        double price;
        int quantity;
        try {
            price = Double.parseDouble(priceStr);
            quantity = Integer.parseInt(qtyStr);
        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid price or quantity.");
            return; // Stop processing further if parsing fails
        }
        try {
			Connection conn1 = DBConnection.getConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        // Database connection setup
        String jdbcURL = "jdbc:mysql://localhost:3306/revshop"; // Your DB details
        String dbUser = "root";
        String dbPassword = "Praveen@2000";

        String sql = "INSERT INTO productall (pname, description, price, category, qty, image) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
             PreparedStatement statement = conn.prepareStatement(sql)) {

            // Set parameters for the query
            statement.setString(1, productName);
            statement.setString(2, description);
            statement.setDouble(3, price);
            statement.setString(4, category);
            statement.setInt(5, quantity);
            
            if (inputStream != null) {
                // Fetch input stream for image if available
                statement.setBlob(6, inputStream);
            } else {
                statement.setNull(6, java.sql.Types.BLOB);
            }

            // Execute SQL query to insert data
            int row = statement.executeUpdate();
            if (row > 0) {
                response.getWriter().println("Product inserted successfully!");
                response.sendRedirect("product-insert-result.jsp");
            } else {
                response.getWriter().println("Failed to insert product.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
