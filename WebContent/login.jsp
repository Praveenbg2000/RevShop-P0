<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <%@ include file="include/head.jsp" %>
    <link rel="stylesheet" href="css/header.css">
    <style>
        :root {
            --background: #1a1a2e;
            --color: #ffffff;
            --primary-color: #0f3460;
        }

        * {
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            margin: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
            color: var(--color);
            letter-spacing: 1px;
            transition: background 0.2s ease;
            position: relative;
            overflow: hidden;
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
            min-width: 50%;
            min-height: 50%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            object-fit: cover;
        }

        a {
            text-decoration: none;
            color: var(--color);
        }

        h1 {
            font-size: 2.5rem;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            z-index: 1; /* Ensure the container is above the video */
        }

        .login-container {
            width: 22.2rem;
            position: relative;
        }

        .form-container {
            border: 1px solid hsla(0, 0%, 65%, 0.158);
            box-shadow: 0 0 36px 1px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            backdrop-filter: blur(20px);
            padding: 2rem;
            z-index: 99;
        }

        .login-container form input,
        .login-container form select {
            display: block;
            padding: 14.5px;
            width: 100%;
            margin: 2rem 0;
            color: var(--color);
            outline: none;
            background-color: #9191911f;
            border: none;
            border-radius: 5px;
            font-weight: 500;
            font-size: 15px;
            backdrop-filter: blur(15px);
        }

        .login-container form input:focus,
        .login-container form select:focus {
            box-shadow: 0 0 16px 1px rgba(0, 0, 0, 0.2);
            animation: wobble 0.3s ease-in;
        }

        .login-container form select {
            -webkit-appearance: none; /* Remove default styling */
            -moz-appearance: none;
            appearance: none;
            background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="white"><polygon points="4,6 8,10 12,6"/></svg>');
            background-repeat: no-repeat;
            background-position: right 10px center;
            background-size: 10px;
            padding-right: 30px; /* Add space for the arrow */
        }

        .login-container form button {
            background-color: var(--primary-color);
            color: var(--color);
            display: block;
            padding: 13px;
            border-radius: 5px;
            outline: none;
            font-size: 18px;
            letter-spacing: 1.5px;
            font-weight: bold;
            width: 100%;
            cursor: pointer;
            margin-bottom: 2rem;
            transition: all 0.1s ease-in-out;
            border: none;
        }

        .login-container form button:hover {
            box-shadow: 0 0 10px 1px rgba(0, 0, 0, 0.15);
            transform: scale(1.02);
        }

        .register-forget {
            margin: 1rem 0;
            display: flex;
            justify-content: space-between;
        }

        @keyframes wobble {
            0% {
                transform: scale(1.025);
            }
            25% {
                transform: scale(1);
            }
            75% {
                transform: scale(1.025);
            }
            100% {
                transform: scale(1);
            }
        }
    </style>
</head>
<body>
<%@ include file="include/header.jsp" %>

<div class="video-background">
    <video autoplay loop muted>
    <source src="videos/1851768-uhd_3840_2160_30fps.mp4" type="video/mp4">
    Your browser does not support the video tag.
</video>

</div>

<div class="container">
    <div class="login-container">
        <div class="form-container">
            <h1 class="opacity">LOGIN</h1>
            <form action="user-login" method="post">
                <input type="email" name="email" placeholder="Enter email" required>
                <input type="password" name="password" placeholder="Enter Password" required>
                <select name="role" required>
                    <option value="" disabled selected>Select Role</option>
                    <option value="user">User</option>
                    <option value="admin">Admin</option>
                </select>
                <button type="submit">Login</button>
            </form>
            <div class="register-forget">
                <a href="register.jsp">Register</a>
            </div>
        </div>
    </div>
</div>

<%@ include file="include/footer.jsp" %>
</body>
</html>
