<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="../WEB-INF/jspf/conexion.jspf" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="Description" content="Enter your description here"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <title>Login Admin</title>
    <style>
        body, html {
            height: 100%;
        }
        .centered-form {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f0f0;
        }
        .login-form {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 40px;
            border-radius: 10px;
            width: 100%;
            max-width: 400px;
        }
        .login-form h3 {
            color: #fff;
            margin-bottom: 20px;
            text-align: center;
        }
        .btn-primary {
            background-color: #0066cc;
            border-color: #0066cc;
            width: 100%;
        }
        .alternative-login {
            margin-top: 20px;
            text-align: center;
        }
        .alternative-login a {
            color: #4db8ff;
            display: inline-block;
            margin: 0 10px;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <img class="border-primary" style="border-radius: 50%;" src="../img/S (1).png" alt="ATENA Logo">
        </div>
        <nav>
            <!-- Add navigation items if needed -->
        </nav>
    </header>
    <div class="centered-form" ">
        <div class="login-form">
            <h3>Iniciar Sesión</h3>
            <form id="login-form" action="controladorLogin.jsp" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label text-white">Usuario:</label>
                    <input type="text" class="info" id="username" name="username" placeholder="Usuario" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label text-white">Contraseña:</label>
                    <input type="password" class="info" id="password" name="password" placeholder="Contraseña" required>
                </div>
                <button type="submit" id="admin-login-btn" class="btn ">Ingresar</button>
            </form>
            
            <c:if test="${param.error == '1'}">
                <div class="alert alert-danger mt-3" role="alert">
                    Usuario o contraseña incorrectos. Por favor, intente de nuevo.
                </div>
            </c:if>
            
      
        </div>
    </div>
    
    <footer>
        <div class="contact-info">
            <h4>Contacta con nosotros</h4>
            <p><a href="https://www.uts.edu.co">https://www.uts.edu.co</a></p>
        <p>Desarrollo de Sistemas Informaticos</p>
            <p><a href="Yeliecerprada@uts.edu ">Yeliecerprada@uts.edu </a></p>
            <p><a href="earleyrangel@uts.edu.co ">earleyrangel@uts.edu.co </a></p>
            
        </div>
        <div class="additional-links">
            <a href="#">Look at my songs in Soundcloud</a>
            <a href="#">Que lindos churcos :)</a>
        </div>
    </footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.0/js/bootstrap.min.js"></script>
</body>
</html>