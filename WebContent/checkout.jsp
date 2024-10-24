<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css"> <!-- Use your custom CSS -->
    <title>Checkout</title>
    <style>
        .mainscreen {
            min-height: 100vh;
            width: 100%;
            display: flex;
            flex-direction: column;
            background-color: #DFDBE5;
            background-image: url("https://wallpaperaccess.com/full/3063067.png");
            color: #963E7B;
        }

        .card {
            width: 60rem;
            margin: auto;
            background: white;
            align-self: center;
            border-radius: 1.5rem;
            box-shadow: 4px 3px 20px #3535358c;
            display: flex;
            flex-direction: row;
        }

        .leftside {
            background: #030303;
            width: 25rem;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-top-left-radius: 1.5rem;
            border-bottom-left-radius: 1.5rem;
        }

        .product {
            object-fit: cover;
            width: 20em;
            height: 20em;
            border-radius: 100%;
        }

        .rightside {
            background-color: #ffffff;
            width: 35rem;
            border-bottom-right-radius: 1.5rem;
            border-top-right-radius: 1.5rem;
            padding: 1rem 2rem 3rem 3rem;
        }

        p {
            display: block;
            font-size: 1.1rem;
            font-weight: 400;
            margin: .8rem 0;
        }

        .inputbox {
            color: #030303;
            width: 100%;
            padding: 0.5rem;
            border: none;
            border-bottom: 1.5px solid #ccc;
            margin-bottom: 1rem;
            border-radius: 0.3rem;
            font-family: 'Roboto', sans-serif;
            color: #615a5a;
            font-size: 1.1rem;
            font-weight: 500;
            outline: none;
        }

        .expcvv {
            display: flex;
            justify-content: space-between;
            padding-top: 0.6rem;
        }

        .expcvv_text {
            padding-right: 1rem;
        }

        .expcvv_text2 {
            padding: 0 1rem;
        }

        .button {
            background: linear-gradient(135deg, #753370 0%, #298096 100%);
            padding: 15px;
            border: none;
            border-radius: 50px;
            color: white;
            font-weight: 400;
            font-size: 1.2rem;
            margin-top: 10px;
            width: 100%;
            letter-spacing: .11rem;
            outline: none;
        }

        .button:hover {
            transform: scale(1.05) translateY(-3px);
            box-shadow: 3px 3px 6px #38373785;
        }

        @media only screen and (max-width: 1000px) {
            .card {
                flex-direction: column;
                width: auto;
            }

            .leftside {
                width: 100%;
                border-top-right-radius: 0;
                border-bottom-left-radius: 0;
                border-top-right-radius: 0;
                border-radius: 0;
            }

            .rightside {
                width: auto;
                border-bottom-left-radius: 1.5rem;
                padding: 0.5rem 3rem 3rem 2rem;
                border-radius: 0;
            }
        }
    </style>
    <script>
        function toggleCardDetails() {
            const paymentType = document.getElementById('paymentType').value;
            const cardDetails = document.getElementById('cardDetails');
            cardDetails.style.display = (paymentType === 'credit' || paymentType === 'debit') ? 'block' : 'none';
        }
    </script>
</head>
<body class="mainscreen">

    <div class="card">
        <div class="leftside">
            <img
                src="image/pexels-janetrangdoan-1128678.jpg"
                class="product"
                alt="Shoes"
            />
        </div>
        <div class="rightside">
            <h2>Checkout</h2>
            <form action="ProcessCheckoutServlet" method="post">
                <div class="form-group">
                    <label for="customerName">Name:</label>
                    <input type="text" class="inputbox" id="customerName" name="customerName" required>
                </div>

                <div class="form-group">
                    <label for="customerEmail">Email:</label>
                    <input type="email" class="inputbox" id="customerEmail" name="customerEmail" required>
                </div>

                <div class="form-group">
                    <label for="customerAddress">Address:</label>
                    <textarea class="inputbox" id="customerAddress" name="customerAddress" required></textarea>
                </div>

                <div class="form-group">
                    <label for="paymentType">Payment Type:</label>
                    <select class="inputbox" id="paymentType" name="paymentType" required onchange="toggleCardDetails()">
                        <option value="None">None</option>
                        <option value="Phonepay">Phonepay</option>
                        <option value="credit">Credit Card</option>
                        <option value="debit">Debit Card</option>
                    </select>
                </div>

                <div id="cardDetails" class="form-group" style="display: none;">
                    <h4>Card Details</h4>
                    <label for="cardNumber">Card Number:</label>
                    <input type="text" class="inputbox" id="cardNumber" name="cardNumber" required>

                    <div class="expcvv">
                        <div>
                            <label for="expiryDate" class="expcvv_text">Expiry Date (MM/YY):</label>
                            <input type="text" class="inputbox" id="expiryDate" name="expiryDate" required>
                        </div>
                        <div>
                            <label for="cvv" class="expcvv_text2">CVV:</label>
                            <input type="text" class="inputbox" id="cvv" name="cvv" required>
                        </div>
                    </div>
                </div>

                <input type="hidden" name="totalAmount" value="${sessionScope.totalAmount}" />

                <button type="submit" class="button">Proceed to Payment</button>
                <br><br><br><a href="cart.jsp" type="button" class="button" style="text-decoration:none;">Cancel order</a>
            </form>
        </div>
    </div>

</body>
</html>
