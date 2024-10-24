<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Checkout - RevShop</title>

    <style>

        body {

            font-family: Arial, sans-serif;

            background-color: #f5f5f5;

            margin: 0;

            padding: 0;

        }

        .checkout-container {

            width: 80%;

            max-width: 600px;

            margin: auto;

            margin-top: 40px;

            background-color: white;

            padding: 20px;

            border-radius: 8px;

            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);

        }

        h2 {

            text-align: center;

            color: #333;

        }

        label {

            font-weight: bold;

            margin-top: 10px;

            display: block;

            color: #555;

        }

        input[type="text"],

        input[type="email"],

        textarea,

        select {

            width: calc(100% - 20px);

            padding: 10px;

            margin-top: 5px;

            margin-bottom: 20px;

            border: 1px solid #ccc;

            border-radius: 4px;

            font-size: 16px;

            transition: border-color 0.3s;

        }

        input[type="text"]:focus,

        input[type="email"]:focus,

        textarea:focus,

        select:focus {

            border-color: #28a745;

            outline: none;

        }

        .checkout-button {

            display: block;

            width: 100%;

            padding: 12px;

            background-color: #28a745;

            color: white;

            text-align: center;

            text-decoration: none;

            border: none;

            border-radius: 5px;

            font-size: 18px;

            cursor: pointer;

            transition: background-color 0.3s;

        }

        .checkout-button:hover {

            background-color: #218838;

        }

        #cardDetails {

            margin-top: 20px;

            padding: 15px;

            border: 1px solid #ccc;

            border-radius: 5px;

            background-color: #f9f9f9;

            display: none; /* Initially hidden */

        }

        h4 {

            margin-bottom: 15px;

            color: #333;

        }

    </style>

    <script>

        function toggleCardDetails() {

            var paymentType = document.getElementById("paymentType").value;

            var cardDetails = document.getElementById("cardDetails");



            // Show card details for credit or debit cards, hide otherwise

            if (paymentType === "credit" || paymentType === "debit") {

                cardDetails.style.display = "block"; // Show card details

            } else {

                cardDetails.style.display = "none"; // Hide card details

            }

        }

    </script>

</head>

<body>

    <div class="checkout-container">

        <h2>Checkout</h2>

        <form action="ProcessCheckoutServlet" method="post">

            <label for="customerName">Name:</label>

            <input type="text" id="customerName" name="customerName" required>



            <label for="customerEmail">Email:</label>

            <input type="email" id="customerEmail" name="customerEmail" required>



            <label for="customerAddress">Address:</label>

            <textarea id="customerAddress" name="customerAddress" required></textarea>



            <label for="paymentType">Payment Type:</label>

            <select id="paymentType" name="paymentType" required onchange="toggleCardDetails()">

                <option value="None">None</option>

                <option value="Phonepay">Phonepay</option>

                <option value="credit">CreditCard</option>

                <option value="debit">DebitCard</option>

            </select>



            <div id="cardDetails">

                <h4>Card Details</h4>

                <label for="cardNumber">Card Number:</label>

                <input type="text" id="cardNumber" name="cardNumber" required>



                <label for="expiryDate">ExpiryDate (MM/YY):</label>

                <input type="text" id="expiryDate" name="expiryDate" required>



                <label for="cvv">CVV:</label>

                <input type="text" id="cvv" name="cvv" required>

            </div>



            <input type="hidden" name="totalAmount" value="<%= request.getParameter("totalAmount") %>">

            <button type="submit" class="checkout-button">Proceed to Payment</button>

        </form>

    </div>

</body>

</html>