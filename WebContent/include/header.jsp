<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<header class="main-menu menu" style="background-color:orange;">
          <div class="container-fluid">
              <div class="row align-items-center justify-content-center">
                  <div class="col-lg-11">
                      <nav class="navbar navbar-expand-lg navbar-light">
                          <a class="navbar-brand" href="index.jsp">
                              <img src="image/logo.png"alt="logo" style="width:120px;height:95px;">
                          </a>
                          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#myNav"aria-control="myNav" aria-expanded="false" aria-label="toggle navigation">
                              <span class="nav-icon">
                                  <i class="fas fa-bars"></i>
                              </span>
                          </button>
                          <div class="collapse navbar-collapse main-menu-item"id="myNav">
                              <ul class="navbar-nav">
                                  <li class="nav-item">
                                      <a class="nav-link" href="index.jsp">Home</a>
                                  </li>
                                  <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="navbarDropdown_1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Categories</a>
                                    <div class="dropdown-menu"aria-labelledby="navbarDropdown_1">
                                        <a class="dropdown-item" href="login.jsp">Fruits</a>
                                        <a class="dropdown-item" href="login.jsp">Vegitables</a>
                                        <a class="dropdown-item" href="login.jsp">Dry Fruits</a>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link"href="login.jsp">Login</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link"href="register.jsp">Register</a>
                                </li>
                              </ul>

                          </div>
                          <div class="d-flex">
                              <div class="cart">
                                  <div class="cart"><a href="login.jsp"><i class="fas fa-shopping-cart" style="font-size: 45px;"></i></a></div>
                              </div>
                          </div>
                      </nav>
                  </div>
              </div>
          </div>
      </header>
      <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  