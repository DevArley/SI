<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="../WEB-INF/jspf/conexion.jspf" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema Universitario</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitterbootstrap/4.6.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fontawesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="../assets/css/style.css">
</head>

<body>

<header>
    <div class="logo">
        <img class="border-primary" style="border-radius: 50%;" src="../img/S (1).png" alt="ATENA Logo">
    </div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a href="logout.jsp" class="btn-warning">Logout</a>
            </li>
        </ul>
    </nav>
</header>

<main>
    <div class="container">
        <div class="content" id="mostrar5-content">
            <div class="card-body">
                <div class="heading">Resultado</div>
                <div class="container">

                    <!-- Verificación de dependencias y eliminación segura -->
                    <%
                    try {
                        // Intentar eliminar el proyecto
                    %>
                        <sql:update var="result" dataSource="${conexionSI}">
                            DELETE FROM proyecto WHERE id = ?
                            <sql:param value="${param.id}" />
                        </sql:update>

                        <c:choose>
                            <c:when test="${result == 1}">
                                <!-- Redirigir con parámetro de éxito -->
                                <script>
                                    window.location.href = "index.jsp?status=success";
                                </script>
                            </c:when>
                            <c:otherwise>
                                <!-- Redirigir con parámetro de error -->
                                <script>
                                    window.location.href = "index.jsp?status=error";
                                </script>
                            </c:otherwise>
                        </c:choose>
                    <%
                    } catch (Exception e) {
                    %>
                        <!-- Redirigir con parámetro de error debido a excepciones -->
                        <script>
                            window.location.href = "index.jsp?status=error";
                        </script>
                    <%
                    }
                    %>

                    <button class="btn btn-success custom-button" id="mostrar5-button-volver" onclick="window.location.href='index.jsp'">Volver</button>
                </div>
            </div>
        </div>
    </div>
</main>

<footer>
    <div class="contact-info">
        <h4>Contacta con nosotros</h4>
        <p><a href="https://www.uts.edu.co">https://www.uts.edu.co</a></p>
        <p>Desarrollo de Sistemas Informaticos</p>
        <p><a href="mailto:Yeliecerprada@uts.edu">Yeliecerprada@uts.edu</a></p>
        <p><a href="mailto:earleyrangel@uts.edu.co">earleyrangel@uts.edu.co</a></p>
    </div>
    <div class="additional-links">
        <a href="#">Look at my songs in Soundcloud</a>
        <a href="#">Que lindos churcos :)</a>
    </div>
</footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitterbootstrap/4.6.0/js/bootstrap.min.js"></script>

<c:if test="${param.status == 'success'}">
    <script type="text/javascript">
        window.onload = function() {
            alert("Proyecto eliminado satisfactoriamente.");
        }
    </script>
</c:if>
<c:if test="${param.status == 'error'}">
    <script type="text/javascript">
        window.onload = function() {
            alert("No se pudo eliminar el proyecto ya que cuenta con calificaciones asociadas.");
        }
    </script>
</c:if>

</body>
</html>
