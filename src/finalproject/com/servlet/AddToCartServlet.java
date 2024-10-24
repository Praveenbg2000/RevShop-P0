package finalproject.com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import finalproject.com.model.CartItem;

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("pname");
        String description = request.getParameter("description");
        String price = request.getParameter("price");

        // Create a cart object or use a list/array in the session
        CartItem item = new CartItem(name, description, Double.parseDouble(price), 1);

        // Add the item to the session
        List<CartItem> cart = (List<CartItem>) request.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            request.getSession().setAttribute("cart", cart);
        }
        cart.add(item);

        // Redirect to the cart page or show a success message
        response.sendRedirect("cart.jsp");
    }
}
