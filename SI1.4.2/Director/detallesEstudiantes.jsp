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
                    <title>Director</title>
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
                                        <c:out value="${sessionScope.email}" />
                                    </p>
                                    <a href="../log/logout.jsp" class="btn btn-warning btn-sm logout-btn">Logout</a>
                                </div>
                            </header>


                        <div class="container-fluid">
                                <!-- Menú lateral -->
                                <div class="sidebar">
                                    <h5>Panel de Director</h5>
                                    <a href="index.jsp" class="active"><i class="fas fa-folder-open"></i> Ver Calificaciones</a>
                                    <a href="aproProye.jsp"><i class="fas fa-file-alt"></i>  Aprobar Proyecto
                                    </a>
                                    <a href="formatosGrado.jsp"><i class="fas fa-file-alt"></i> Formatos de Grado</a>
                                    <a href="calendario.jsp" ><i class="fas fa-calendar"></i> Calendario Académico</a>
                                    
                                </div>







        <div class="main-content">
        <h1>Bienvenido, 
                                        <c:out value="${sessionScope.nombres}" /> 
                                    </h1>
                                    <p>Este es tu panel de control donde puedes gestionar tus actividades como
                                        Director.</p>

                                    <!-- Tarjeta de diseño -->
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="card">
                                                <div class="card-body text-center">
                                                    <h5 class="card-title">Información del Estudiante
                                                    
                                                    </h5>
                                                    <p class="card-text">Aquí puedes ver la informacion de
                                                        un estudiante.</p>
                                                </div>
            
            <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>Tipo de Documento</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Género</th>
                        <th>Teléfono</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                    <sql:query var="detallesEstudiantes" scope="request" dataSource="${conexionSI}">
                        SELECT tipo_de_documento, nombres, apellidos, genero, telefono, email 
                        FROM usuarios 
                        WHERE id IN (?, ?)
                        <sql:param value="${param.estudiante1Id}" />
                        <sql:param value="${param.estudiante2Id}" />
                    </sql:query>

                    <c:if test="${not empty detallesEstudiantes.rows}">
                        <c:forEach var="estudiante" items="${detallesEstudiantes.rows}">
                            <tr>
                                <td>${estudiante.tipo_de_documento}</td>
                                <td>${estudiante.nombres}</td>
                                <td>${estudiante.apellidos}</td>
                                <td>${estudiante.genero}</td>
                                <td>${estudiante.telefono}</td>
                                <td>${estudiante.email}</td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty detallesEstudiantes.rows}">
                        <tr>
                            <td colspan="6">No hay información disponible para los estudiantes.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
                                <a href="index.jsp" style="background-color: #007bff;" class="btn btn-primary back-button">Volver</a>

    </div>
</div>
</div>
</div>
    </div>
    <footer>
        <div class="contact-info">
            <h4>Contacta con nosotros</h4>
            <p><a href="https://www.uts.edu.co">https://www.uts.edu.co</a></p>
            <p>Desarrollo de Sistemas Informáticos</p>
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
