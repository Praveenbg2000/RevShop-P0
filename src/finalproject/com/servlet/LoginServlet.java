package finalproject.com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import finalproject.com.connection.DBConnection;
import finalproject.com.doa.AdminDao;
import finalproject.com.doa.Userdoa;
import finalproject.com.model.Admin;
import finalproject.com.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            // Retrieve form parameters
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String role = request.getParameter("role");
            
            // Debugging: check the parameters are correctly passed
            out.println("Email: " + email + ", Password: [PROTECTED], Role: " + role);
            
            // If role is not provided, default to "user"
            if (role == null || role.isEmpty()) {
                role = "user";
            }
            
            // Check for Admin role
            if ("admin".equalsIgnoreCase(role)) {
                out.println("Admin login flow starting...");
                handleAdminLogin(email, password, request, response, out);
            } 
            // Check for User role
            else if ("user".equalsIgnoreCase(role)) {
                out.println("User login flow starting...");
                handleUserLogin(email, password, request, response, out);
            } 
            // Invalid role handling
            else {
                out.println("Invalid role provided. Redirecting to login page...");
                request.getRequestDispatcher("login.jsp").include(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error processing login", e); // Forward exception handling to servlet
        }
    }

    // Method to handle admin login
    private void handleAdminLogin(String email, String password, HttpServletRequest request, HttpServletResponse response, PrintWriter out) 
            throws ServletException, IOException {
        try {
            AdminDao adminDao = new AdminDao(DBConnection.getConnection());
            Admin admin = adminDao.adminLogin(email, password);

            if (admin != null) {
                out.println("Admin login successful.");
                request.getSession().setAttribute("auth", admin);
                response.sendRedirect("admin.jsp");
            } else {
                out.println("Admin login failed.");
                request.getRequestDispatcher("login.jsp").include(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("Error occurred during admin login: " + e.getMessage());
            request.getRequestDispatcher("login.jsp").include(request, response); // Redirect back to login page
        }
    }

    // Method to handle user login
    private void handleUserLogin(String email, String password, HttpServletRequest request, HttpServletResponse response, PrintWriter out) 
            throws ServletException, IOException {
        try {
            Userdoa userDao = new Userdoa(DBConnection.getConnection());
            User user = userDao.userlogin(email, password);

            if (user != null) {
                out.println("User login successful.");
                request.getSession().setAttribute("auth", user);
                response.sendRedirect("userindex.jsp");
            } else {
                out.println("User login failed.");
                request.getRequestDispatcher("login.jsp").include(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("Error occurred during user login: " + e.getMessage());
            request.getRequestDispatcher("login.jsp").include(request, response); // Redirect back to login page
        }
    }
}
