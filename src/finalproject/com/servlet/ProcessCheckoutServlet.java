package finalproject.com.servlet;

import finalproject.com.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.Map;

@WebServlet("/ProcessCheckoutServlet")
public class ProcessCheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerName = request.getParameter("customerName");
        String customerAddress = request.getParameter("customerAddress");
        String totalAmountStr = request.getParameter("totalAmount");
        double totalAmount = 0.0;

        if (totalAmountStr != null && !totalAmountStr.trim().isEmpty()) {
            try {
                totalAmount = Double.parseDouble(totalAmountStr);
            } catch (NumberFormatException e) {
                response.getWriter().println("Invalid total amount.");
                return;
            }
        }

        String transactionId = "TXN" + System.currentTimeMillis();
        String orderId = "ORD" + System.currentTimeMillis();
        String invoiceDate = new java.text.SimpleDateFormat("dd/MM/yyyy").format(new java.util.Date());

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");

        // Check if the user is logged in
        if (user == null) {
            response.sendRedirect("login.jsp"); // Redirect to login page if user is not authenticated
            return;
        }

        List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");

        if (cart != null && !cart.isEmpty()) {
            // Store order in the database
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/revshop", "root", "Praveen@2000");
                 PreparedStatement pstmt = conn.prepareStatement("INSERT INTO orders (user_id, product_name, quantity, price, order_date, transaction_id, order_id) VALUES (?, ?, ?, ?, NOW(), ?, ?)")) {

                Class.forName("com.mysql.cj.jdbc.Driver");

                for (Map<String, String> cartItem : cart) {
                    pstmt.setInt(1, user.getId());
                    pstmt.setString(2, cartItem.get("pname"));
                    pstmt.setInt(3, Integer.parseInt(cartItem.get("qty")));
                    pstmt.setDouble(4, Double.parseDouble(cartItem.get("price")));
                    pstmt.setString(5, transactionId);
                    pstmt.setString(6, orderId);
                    pstmt.executeUpdate();
                }

            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().println("Database error: " + e.getMessage());
                return;
            }

            session.removeAttribute("cart");

            // Invoice HTML Response
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><head><title>RevShop Payment</title>");
            out.println("<style>body { font-family: Arial; } .invoice { margin-top: 50px; padding: 20px; border: 1px solid #ccc; width: 50%; text-align: center; }</style>");
            out.println("<script>setTimeout(function() { window.location.href = 'confirmation.jsp'; }, 5000);</script></head>");
            out.println("<body><div class='invoice'><h2>Payment Successful!</h2><h3>RevShop Invoice</h3>");
            out.println("<p>Thank you, " + customerName + "!</p><p>Total Amount: ₹" + String.format("%.2f", totalAmount) + "</p>");
            out.println("<p>Transaction ID: " + transactionId + "</p><p>Order ID: " + orderId + "</p><p>Invoice Date: " + invoiceDate + "</p>");
            out.println("<p><strong>Address:</strong> " + customerAddress + "</p><p>Redirecting in 5 seconds...</p></div></body></html>");
        } else {
            response.getWriter().println("<h2>Your cart is empty!</h2>");
        }
    }
}
