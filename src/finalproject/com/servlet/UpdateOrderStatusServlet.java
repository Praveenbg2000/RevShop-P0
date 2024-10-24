package finalproject.com.servlet;

import finalproject.com.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/UpdateOrderStatusServlet")
public class UpdateOrderStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");

        if (user != null) {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            String status = request.getParameter("status");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/revshop", "root", "Praveen@2000");

                String sql = "UPDATE orders SET status = ? WHERE order_id = ? AND user_id = ?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, status);
                pstmt.setInt(2, orderId);
                pstmt.setInt(3, user.getId());
                pstmt.executeUpdate();

                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

            response.sendRedirect("myorders.jsp"); // Redirect back to orders page
        } else {
            response.sendRedirect("userindex.jsp"); // Redirect to login if not authenticated
        }
    }
}

