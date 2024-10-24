<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ include file="include/head.jsp" %>
<%@ include file="include/userheader.jsp" %>
<%@ page import="finalproject.com.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Your Cart</title>
    <link rel="stylesheet" href="css/header.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa; /* Light gray background */
        }

        .gradient-custom {
            /* fallback for old browsers */
            background: #cd9cf2;
            /* Chrome 10-25, Safari 5.1-6 */
            background: -webkit-linear-gradient(to top left, rgba(205, 156, 242, 1), rgba(246, 243, 255, 1));
            /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            background: linear-gradient(to top left, rgba(205, 156, 242, 1), rgba(246, 243, 255, 1));
        }

        h3, h4 {
            text-align: center;
            font-family: 'Open Sans', sans-serif;
            color: #5f4b8c;
        }

        .table th, .table td {
            font-family: 'Open Sans', sans-serif;
        }

        .cart-item {
            font-family: emoji;
        }
    </style>
    <script>
        // Function to calculate total price based on quantity
        function updateTotal() {
            let total = 0;
            const rows = document.querySelectorAll('.cart-item');
            rows.forEach(row => {
                const price = parseFloat(row.querySelector('.item-price').textContent.replace('Rs.', '').replace('/-', '').trim());
                const qty = parseInt(row.querySelector('.item-quantity').value) || 0;
                total += price * qty;
            });
            document.getElementById('totalPrice').textContent = total.toFixed(2);
            // Update session total amount
            document.getElementById('totalAmountInput').value = total.toFixed(2);
        }
    </script>
</head>
<body>
    <div class="container my-5 gradient-custom p-4 rounded">
        <h3>Your Cart!</h3>
        <%
            User user1 = (User) session.getAttribute("auth");
            if (user1 != null) {
        %>
            <h4>Welcome to RevShop, <%= user1.getName() %>!</h4>
        <%
            }
        %>
        <table class="table table-light">
            <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Description</th>
                    <th scope="col">Price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Remove</th>
                </tr>
            </thead>
            <tbody>
            <%
                String pname = request.getParameter("pname");
                String price = request.getParameter("price");
                String description = request.getParameter("description");
                String image = request.getParameter("image");

                if (pname != null && price != null && description != null && image != null) {
                    Map<String, String> item = new HashMap<>();
                    item.put("pname", pname);
                    item.put("price", price);
                    item.put("description", description);
                    item.put("image", image);
                    item.put("qty", "1");

                    List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
                    if (cart == null) {
                        cart = new ArrayList<>();
                    }

                    boolean itemExists = false;
                    for (Map<String, String> cartItem : cart) {
                        if (cartItem.get("pname").equals(pname)) {
                            int currentQty = Integer.parseInt(cartItem.get("qty"));
                            cartItem.put("qty", String.valueOf(currentQty + 1));
                            itemExists = true;
                            break;
                        }
                    }

                    if (!itemExists) {
                        cart.add(item);
                    }

                    session.setAttribute("cart", cart);
                }

                List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
                double totalPrice = 0.0;

                if (cart != null && !cart.isEmpty()) {
                    for (Map<String, String> cartItem : cart) {
            %>
                <tr class="cart-item">
                    <td><%= cartItem.get("pname") %></td>
                    <td><%= cartItem.get("description") %></td>
                    <td class="item-price">Rs.<%= cartItem.get("price") %>/-</td>
                    <td>
                        <input type="number" class="item-quantity" value="<%= cartItem.get("qty") != null ? cartItem.get("qty") : 1 %>" min="1" onchange="updateTotal()">
                    </td>
                    <td>
                        <a class="btn btn-sm btn-danger" href="removeFromCart.jsp?id=<%= cartItem.get("pname") %>">Remove</a>
                    </td>
                </tr>
            <%
                        totalPrice += Double.parseDouble(cartItem.get("price")) * (cartItem.get("qty") != null ? Integer.parseInt(cartItem.get("qty")) : 1);
                    }
                    // Set total amount in session
                    session.setAttribute("totalAmount", totalPrice);
                } else {
            %>
            <tr><td colspan="5" class="text-center">Your cart is empty</td></tr>
            <%
                }
            %>
            </tbody>
        </table>

        <!-- Total Price Section -->
        <div class="d-flex justify-content-between py-3">
            <h3>Total Price: <span id="totalPrice">Rs.<%= totalPrice %>/-</span></h3>
            <input type="hidden" id="totalAmountInput" name="totalAmount" value="<%= totalPrice %>">
            <% if (totalPrice > 0) { %>
                <a class="btn btn-primary" href="checkout.jsp">Check Out</a>
            <% } else { %>
                <a class="btn btn-primary" href="cart.jsp">No products to buy.</a>
            <% } %>
        </div>
    </div> <!-- End of Container -->
    <%@ include file="include/footer.jsp" %>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
