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
<meta name="Description" content="Enter your description here"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="../assets/css/style2.css">
<title>Coordinador</title>
</head>
<body>
    <style>
        body {
            display: flex;
            flex-direction: column;
            height: 100vh;
            margin: 0; /* Asegúrate de que no haya márgenes */
        }

        /* Estilos del header */
        .header, .footer {
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
            display: flex; /* Hacer que el contenedor principal sea un flex container */
            flex-grow: 1; /* Permitir que el contenedor principal use todo el espacio disponible */
        }

        /* Menú lateral */
        .sidebar {
            background-color: #f8f9fa;
            color: #333;
            width: 250px;
            padding: 15px;
            border-right: 1px solid #ddd; /* Añadir borde derecho para separación */
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
            flex-grow: 1; /* Hacer que el contenido principal ocupe el espacio restante */
            padding: 20px;
            background-color: #f8f9fa;
        }

        .card {
            margin-bottom: 20px;
        }
    </style>
</head>

<body>
    <header>
        <div class="logo">
            <img class="border-primary" style="border-radius: 50%;" src="../img/S (1).png" alt="ATENA Logo">
        </div>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a href="../log/logout.jsp" class="btn btn-warning btn-sm">Logout</a>
                </li>
            </ul>
        </nav>
    </header>

    <div class="container-fluid">
        <!-- Menú lateral -->
        <div class="sidebar">
            <h5>Panel de Coordinador</h5>
            <a href="index.jsp"><i class="fas fa-folder-open"></i> Ver Proyectos</a>
            <a href="asignarEvaluadores.jsp"class="active"><i class="fas fa-user-check"></i> Asignar Evaluadores</a>
            <a href="consultarInformes.jsp"><i class="fas fa-file-alt"></i> Consultar Informes</a>
            <a href="calendario.jsp"><i class="fas fa-calendar"></i> Calendario Académico</a>
        </div>

        <!-- Contenido principal -->
        <div class="main-content">
            <h1>Bienvenido, Coordinador <c:out value="${sessionScope.nombres}" /></h1>
            <p>Este es tu panel de control donde puedes gestionar tus actividades como coordinador.</p>

            <!-- Tarjeta de diseño -->
            <div class="row">
                <div class="col-md-12">
                    <div class="container mt-5">
        <h2>Asignar Evaluadores y Directores a Proyectos</h2>

        <!-- Tabla de proyectos -->
        <!-- Tabla de proyectos -->
        <table class="table table-striped table-bordered table-hover">
            <thead class="thead-dark">
                <tr>
                 <th>Id</th>
                    <th>Título</th>
                    <th>Descripción</th>
                    <th>Estudiante</th>
                    <th>Evaluador</th>
                    <th>Director</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <sql:query var="proyectos" dataSource="${conexionSI}">
                    SELECT p.id, p.titulo, p.descripcion, u.nombres as estudiante,
                           e.nombres as evaluador, d.nombres as director
                    FROM proyecto p
                    LEFT JOIN usuarios u ON p.id_estudiante = u.id
                    LEFT JOIN usuarios e ON p.id_evaluador = e.id
                    LEFT JOIN usuarios d ON p.id_director = d.id
                </sql:query>
                <c:forEach var="proyecto" items="${proyectos.rows}">
                    <tr>
                     <td><c:out value="${proyecto.id}" /></td>
                        <td><c:out value="${proyecto.titulo}" /></td>
                        <td><c:out value="${proyecto.descripcion}" /></td>
                        <td><c:out value="${proyecto.estudiante}" /></td>
                        <td><c:out value="${proyecto.evaluador}" /></td>
                        <td><c:out value="${proyecto.director}" /></td>
                        <td>
                                                            <a href="setEvaluador.jsp?id=${fila.id}" class="btn btn-primary btn-sm">Evaluador</a>
                                                            <a href="setDirector.jsp?id=${fila.id}" class="btn btn-primary btn-sm">Director</a>

                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>


    </div>
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
    
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>


</body>
</html>