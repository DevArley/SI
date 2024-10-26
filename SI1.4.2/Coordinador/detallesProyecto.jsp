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
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
                    <link rel="stylesheet" href="../assets/css/style.css">
                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                    <title>Coordinador</title>
                </head>

                <body>


                    <style>
                        .header, .footer {
            background-color: #343a40;
            color: white;
            padding: 15px;
            text-align: center;
        }

                        body {
                            display: flex;
                            flex-direction: column;
                            height: 100vh;
                            margin: 0;
                            /* Asegúrate de que no haya márgenes */
                        }

                        /* Estilos del header */
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

                        /* Estilo del contenedor */
                        .container-fluid {
                            display: flex;
                            /* Hacer que el contenedor principal sea un flex container */
                            flex-grow: 1;
                            /* Permitir que el contenedor principal use todo el espacio disponible */
                        }

                        /* Menú lateral */
                        .sidebar {
                            background-color: #f8f9fa;
                            color: #333;
                            width: 250px;
                            padding: 15px;
                            border-right: 1px solid #ddd;
                            /* Añadir borde derecho para separación */
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

                        /* Contenido principal */
                        .main-content {
                            flex-grow: 1;
                            /* Hacer que el contenido principal ocupe el espacio restante */
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
                                    <img class="border-primary" style="border-radius: 50%;" src="../img/S (1).png"
                                        alt="ATENA Logo">
                                </div>
                                <div class="user-info">
                                    <p class="user-name" style="position: relative; left: -117px; top: 22px; color: rgb(255, 255, 255);">Bienvenido,
                                        <c:out value="${sessionScope.nombres}" />
                                    </p>
                                    <a href="../log/logout.jsp" class="btn btn-warning btn-sm logout-btn">Logout</a>
                                </div>
                            </header>

    <div class="container-fluid">
        <div class="sidebar">
            <h5>Panel de Coordinador</h5>
            <a href="index.jsp" ><i class="fas fa-folder-open"></i> Ver
                                        Proyectos</a>
            <a href="consultarInformes.jsp"><i class="fas fa-file-alt"></i> Consultar Informes</a>
            <a href="estudiante.jsp" class="active"><i class="fa fa-search"></i> Consultar Estudiante</a>
            <a href="formatosGrado.jsp"><i class="fas fa-file-alt"></i> Formatos de Grado</a>
            <a href="calendario.jsp"><i class="fas fa-calendar"></i> Calendario Académico</a>
        </div>
        <!-- Contenido principal -->
        <div class="main-content">
            <h1>Bienvenido,
                                        <c:out value="${sessionScope.nombres}" />
                                    </h1>
                                    <p>Este es tu panel de control donde puedes gestionar tus actividades como
                                        coordinador.</p>

            <div class="row">
                       <div class="col-md-12">
                                            <div class="card"style="width: 1092px;">
                                                <div class="card-body text-center">
                                                    <h5 class="card-title">Detalles del Proyecto</h5>
                                                    <p class="card-text">Detalles del proyecto del estudiante con el ID: <c:out value="${param.nombres}" /> <c:out value="${param.id_estudiante}" />.</p>
                                                </div>                 

            <!-- Consulta SQL para obtener los detalles del proyecto -->
            <sql:query var="proyecto" dataSource="${conexionSI}">
                SELECT * 
                FROM proyecto 
                WHERE id_estudiante1 = ? OR id_estudiante2 = ?;
                <sql:param value="${param.id_estudiante}" />
                <sql:param value="${param.id_estudiante}" />
            </sql:query>
            <div class="card-body"style="width: 1051px;">
            <div class="table-responsive">
            <!-- Tabla para mostrar la información del proyecto -->
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Título</th>
                        <th>Descripción</th>
                        <th>Estado Evaluador</th>
                        <th>Estado Director</th>
                        <th>Fecha de Creación</th>
                        <th>Enlace Proyecto</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="fila" items="${proyecto.rows}">
                        <tr>
                            <td style="background-color: rgb(255, 255, 255);"><c:out value="${fila.id}" /></td>
                            <td style="background-color: rgb(255, 255, 255);"><c:out value="${fila.titulo}" /></td>
                            <td style="background-color: rgb(255, 255, 255);"><c:out value="${fila.descripcion}" /></td>
                            <td style="background-color: rgb(255, 255, 255);"><c:out value="${fila.estado_evaluador}" /></td>
                            <td style="background-color: rgb(255, 255, 255);"><c:out value="${fila.estado_director}" /></td>
                            <td style="background-color: rgb(255, 255, 255);"><c:out value="${fila.fecha_creacion}" /></td>
                            <td style="background-color: rgb(255, 255, 255);"><a href="<c:out value='${fila.url}' />" target="_blank">Ver Proyecto</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- Mensaje si no se encuentran proyectos -->
            <c:if test="${empty proyecto.rows}">
                <div class="alert alert-warning" role="alert">
                    No se encontraron proyectos asociados a este estudiante.
                </div>
            </c:if>
        </div>
        </div>
        <a href="estudiante.jsp" class="btn btn-success"> Volver </a>
        </div>
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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>

</html>
