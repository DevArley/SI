<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="../WEB-INF/jspf/conexion.jspf" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="Description" content="Enter your description here" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
                    <link rel="stylesheet" href="../assets/css/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Consultar Calificaciones</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            height: 100vh;
            margin: 0;
        }

        .header,
        .footer {
            background-color: #343a40;
            color: white;
            padding: 15px;
            text-align: center;
        }

        .logo {
            max-width: 50px;
            border-radius: 50%;
        }

        .container-fluid {
            display: flex;
            flex-grow: 1;
        }

        .sidebar {
            background-color: #f8f9fa;
            color: #333;
            width: 250px;
            padding: 15px;
            border-right: 1px solid #ddd;
        }

        .sidebar a {
            color: #333;
            text-decoration: none;
            display: block;
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .sidebar a:hover {
            background-color: #007bff;
            color: white;
        }

        .sidebar .active {
            background-color: #007bff;
            color: white;
        }

        .main-content {
            flex-grow: 1;
            padding: 20px;
            background-color: #f8f9fa;
        }

        .card {
            margin-bottom: 20px;
        }
    </style>
</head>

<body>
    <header class="header-container">
        <div class="logo">
            <img class="border-primary" style="border-radius: 50%;" src="../img/S (1).png" alt="ATENA Logo">
        </div>
        <div class="user-info">
            <p class="user-name"style="position: relative; left: -117px; top: 22px; color: rgb(255, 255, 255);">Bienvenido, <c:out value="${sessionScope.email}" /></p>
            <a href="../log/logout.jsp" class="btn btn-warning btn-sm logout-btn">Logout</a>
        </div>
    </header>

    <div class="container-fluid">
        <div class="sidebar">
            <h5>Panel de Estudiante</h5>
            <a href="index.jsp" ><i class="fas fa-folder-open"></i> Ver Proyectos</a>
            <a href="subirDocumentos.jsp"><i class="fas fa-upload"></i> Subir Documentos</a>
            <a href="Notas.jsp" class="active"><i class="fas fa-clipboard"></i> Consultar Notas</a>
            <a href="calendario.jsp"><i class="fas fa-calendar"></i> Calendario Académico</a>
            <a href="formatosGrado.jsp"><i class="fas fa-file-alt"></i> Formatos de Grado</a>
        </div>

        <div class="main-content">
            <h1>Bienvenido, <c:out value="${sessionScope.nombres}" /></h1>
            <p>Este es tu panel de control donde puedes gestionar tus actividades como estudiante.</p>

            <!-- Tarjeta de Calificaciones -->
            <div class="card">
                <div class="card-body"style="background-color: rgb(255, 255, 255);">
                    <h5 class="card-title">Calificaciones</h5>
                    <p class="card-text">Consulta las calificaciones de tus proyectos.</p>

                    <!-- Consulta para obtener las calificaciones -->
                    <sql:query var="calificaciones" dataSource="${conexionSI}">
                        SELECT id_calificacion, id_proyecto, id_estudiante1, id_estudiante2, id_director, rol_usuario, calificacion, comentario, fecha_calificacion 
                        FROM calificaciones 
                        WHERE id_estudiante1 = ? or id_estudiante2 =?
                        <sql:param value="${sessionScope.userId}" />
                          <sql:param value="${sessionScope.userId}" />
                    </sql:query>

                    <c:choose>
                        <c:when test="${calificaciones.rowCount > 0}">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>ID Calificación</th>
                                            <th>ID Proyecto</th>
                                            <th>ID Estudiante</th>
                                            <th>ID Director</th>
                                            <th>Rol Usuario</th>
                                            <th>Calificación</th>
                                            <th>Comentario</th>
                                            <th>Fecha de Calificación</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="calificacion" items="${calificaciones.rows}">
                                            <tr>
                                                <td><c:out value="${calificacion.id_calificacion}" /></td>
                                                <td><c:out value="${calificacion.id_proyecto}" /></td>
                                                <td><c:out value="${calificacion.id_estudiante}" /></td>
                                                <td><c:out value="${calificacion.id_director}" /></td>
                                                <td><c:out value="${calificacion.rol_usuario}" /></td>
                                                <td><c:out value="${calificacion.calificacion}" /></td>
                                                <td><c:out value="${calificacion.comentario}" /></td>
                                                <td><c:out value="${calificacion.fecha_calificacion}" /></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="alert alert-info" role="alert">
                                No tienes calificaciones registradas.
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>

</html>
