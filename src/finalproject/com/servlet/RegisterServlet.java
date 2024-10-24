package finalproject.com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user-register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String name = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("repassword");

        // Check if passwords match
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Passwords do not match!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Insert the user into the database
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish connection to database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/revshop", "root", "Praveen@2000");

            // Prepare SQL query to insert the new user
            String sql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);

            // Execute the insert query
            int result = ps.executeUpdate();

            // Check if insert was successful
            if (result > 0) {
                // Redirect to login page after successful registration
                response.sendRedirect("login.jsp");
            } else {
                // Registration failed, display error message
                request.setAttribute("errorMessage", "Registration failed! Please try again.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }

            // Close PreparedStatement and connection
            ps.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            // Handle database errors
            e.printStackTrace();
            System.out.print(e);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
