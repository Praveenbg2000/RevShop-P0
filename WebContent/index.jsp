<!doctype html>
<html lang="en">
  <head>
    <title>RevShop - Your Favorite Online Store</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/header.css">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/332a215f17.js" crossorigin="anonymous"></script>

    <style>
      body {
        font-family: 'Open Sans', sans-serif;
        color: white;
      }

      .video-background {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        overflow: hidden;
        z-index: -1;
      }

      video {
        min-width: 100%;
        min-height: 100%;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        object-fit: cover; /* Adjust as needed */
      }

      .jumbotron {
        background: rgba(0, 0, 0, 0.6); /* Adding transparency to jumbotron */
        padding: 50px;
      }

      .typewriter h1 {
        overflow: hidden; /* Ensures the text is hidden during animation */
        border-right: .15em solid white; /* Adds cursor effect */
        white-space: nowrap; /* Prevents text from wrapping */
        margin: 0 auto;
        letter-spacing: .15em; /* Spacing between letters */
        width: 0; /* Start with width 0 to reset on each iteration */
        animation: typing 3.5s steps(30, end) infinite, blink-caret .75s step-end infinite;
      }

      @keyframes typing {
        0% { width: 0; }
        50% { width: 100%; }
        100% { width: 0; }
      }

      @keyframes blink-caret {
        from, to { border-color: transparent; }
        50% { border-color: white; }
      }

      .lead {
        animation: fadeIn 4s ease-in-out;
      }

      @keyframes fadeIn {
        0% { opacity: 0; }
        100% { opacity: 1; }
      }

      .btn-primary {
        margin-top: 20px;
        animation: fadeIn 5s ease-in-out;
      }
    </style>
  </head>
  <body>
    <%@include file="include/header.jsp" %>

    <div class="video-background">
        <video autoplay loop muted>
            <source src="videos/indexbackground.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>
    </div>

    <div class="jumbotron text-center">
        <div class="typewriter">
          <h1>Welcome to RevShop</h1>
        </div>
        <p class="lead">Shop the best products across a wide variety of categories at unbeatable prices!</p>
        <a href="login.jsp" class="btn btn-primary btn-lg">Start Shopping</a>
    </div>

    <div class="container">
        <div class="row text-center">
          <!-- Fresh Fruits Category -->
          <div class="col-md-4 product-category">
              <img src="image/freshPomegranates.webp" class="img-fluid" alt="Fresh Fruits" style="width:150px; height:150px;">
              <h3>Fresh Fruits</h3>
              <a href="login.jsp" class="btn btn-outline-primary">Shop Now</a>
          </div>
          
          <!-- Vegetables Category -->
          <div class="col-md-4 product-category">
              <img src="image/freshCucumber.webp" class="img-fluid" alt="Vegetables" style="width:150px; height:150px;">
              <h3>Vegetables</h3>
              <a href="login.jsp" class="btn btn-outline-primary">Shop Now</a>
          </div>
          
          <!-- Dry Fruits Category -->
          <div class="col-md-4 product-category">
              <img src="image/DryFruit.webp" class="img-fluid" alt="Dry Fruits" style="width:150px; height:150px;">
              <h3>Dry Fruits</h3>
              <a href="login.jsp" class="btn btn-outline-primary">Shop Now</a>
          </div>
        </div>
      </div>

      <!-- Footer -->
      
   

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" crossorigin="anonymous"></script>
  </body>
</html>
