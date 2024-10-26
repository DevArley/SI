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
                                    <p class="user-name"style="position: relative; left: -117px; top: 22px; color: rgb(255, 255, 255);">Bienvenido,
                                        <c:out value="${sessionScope.email}" />
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
                                    <a href="estudiante.jsp"class="active"><i class="fa fa-search"></i> Consultar Estudiante</a>
                                    <a href="formatosGrado.jsp"><i class="fas fa-file-alt"></i> Formatos de Grado</a>
                                    <a href="calendario.jsp"><i class="fas fa-calendar"></i> Calendario Académico</a>
                                </div>

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
                                                    <h5 class="card-title">Búsqueda de Estudiantes</h5>
                                                    <p class="card-text">Ingrese el código del estudiante o el nombre para mostrar los datos del proyecto o anteproyecto.</p>
                                                </div>

      <!-- Formulario de búsqueda -->
      <div class="card-body"style="width: 1051px;">
        <form action="" method="get" class="mb-4">
            <div class="form-group">
                <label for="nombres">Nombre del Estudiante:</label>
                <input type="text" id="nombres" name="nombres" class="form-control" value="${param.nombres}" placeholder="Ingrese el nombre del estudiante" />
            </div>
            <div class="form-group">
                <label for="id">ID del Estudiante:</label>
                <input type="text" id="id" name="id" class="form-control" value="${param.id}" placeholder="Ingrese el ID del estudiante" />
            </div>
            <button type="submit" class="btn btn-primary">Buscar</button>
        </form>
        </div>

        
        <sql:query var="estudiantes" dataSource="${conexionSI}" scope="request">
            SELECT * FROM usuarios 
            WHERE rol_1 = 'Estudiante'
            <c:if test="${not empty param.nombres}">
                AND nombres LIKE CONCAT('%', '${param.nombres}', '%') 
            </c:if>
            <c:if test="${not empty param.id}">
                AND id = ${param.id}
            </c:if>
        </sql:query>


        <div class="card-body"style="width: 1051px;">
        <h3>Lista de Estudiantes</h3>
        <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
            <thead>
                <tr>
                    <th>Nombres</th>
                    <th>ID</th>
                    <th>Detalles</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="estudiante" items="${estudiantes.rows}">
                    <tr>
                        <td style="background-color: rgb(255, 255, 255);">${estudiante.nombres}</td>
                        <td style="background-color: rgb(255, 255, 255);">${estudiante.id}</td>
                        <td style="background-color: rgb(255, 255, 255);">
                        <a href="detallesProyecto.jsp?id_estudiante=${estudiante.id}" class="btn btn-primary">Ver Detalles</a>

                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty estudiantes.rows}">
                    <tr>
                        <td colspan="3" class="text-center text-danger">No se encontraron resultados.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
        </div>
        </div>
    </div>
                                        </div>
                                    </div>
                                        </div>
                                    </div>
                                </div>

                            </div>



<!-- Script actualizado -->



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

                        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>


                        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
                        <script
                            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
                        <script
                            src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>



                        </script>

                    </body>

                </html>
