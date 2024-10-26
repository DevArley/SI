<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="../WEB-INF/jspf/conexion.jspf" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="Description" content="Sistema de Gestión Universitaria"/>
    <title>Sistema Universitario - Dashboard Coordinador</title>
    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
                    <link rel="stylesheet" href="../assets/css/style.css">
     <style>
        body {
            display: flex;
            flex-direction: column;
            height: 100vh;
            margin: 0;
        }
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
                                    <img class="border-primary" style="border-radius: 50%;" src="../img/S (1).png"
                                        alt="ATENA Logo">
                                </div>
                                <div class="user-info">
                                    <p class="user-name"style="position: relative; left: -117px; top: 22px; color: rgb(255, 255, 255);">Bienvenido,
                                        <c:out value="${sessionScope.nombres}" />
                                    </p>
                                    <a href="../log/logout.jsp" class="btn btn-warning btn-sm logout-btn">Logout</a>
                                </div>
                            </header>

    <div class="container-fluid">
                                <!-- Menú lateral -->
                                <div class="sidebar">
                                    <h5>Panel de Coordinador</h5>
                                    <a href="index.jsp" ><i class="fas fa-folder-open"></i> Ver
                                        Proyectos</a>
                                    <a href="consultarInformes.jsp"class="active"><i class="fas fa-file-alt"></i> Consultar Informes</a>
                                    <a href="estudiante.jsp"><i class="fa fa-search"></i> Consultar Estudiante</a>
                                    <a href="formatosGrado.jsp"><i class="fas fa-file-alt"></i> Formatos de Grado</a>
                                    <a href="calendario.jsp"><i class="fas fa-calendar"></i> Calendario Académico</a>
                                </div>


                               <!-- Contenido principal -->
                        <div class="main-content">
                            <h1>Bienvenido,
                                <c:out value="${sessionScope.nombres}" />
                            </h1>
                            <p>Este es tu panel de control donde puedes gestionar tus actividades como estudiante.</p>

                            <!-- Tarjetas de acceso rápido -->
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card"style="width: 1010.5px;">
                                        <div class="card-body text-center">
                                            <h5 class="card-title">Lista de Proyectos</h5>
                                            <p class="card-text">Consulta los proyectos en los que estás inscrito o
                                                participando.</p>

                                        </div>
                             <!-- Consulta para obtener los datos de los proyectos -->
                                    <sql:query var="result" scope="request" dataSource="${conexionSI}">
                                        SELECT id, titulo, descripcion,  estado_evaluador, estado_director,   id_evaluador, id_director,
                                       estado FROM proyecto;
                                    </sql:query>



                                    <div class="container">

                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered table-hover">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th>id</th>

                                                        <th>Titulo</th>
                                                        <th>Descripcion</th>
                                                      
                                                
                                                        <th>Estado Evaluador</th>
                                                        <th>Estado Director</th>
                                                        <th>Id Evaluador</th>
                                                        <th>Id Director</th>
                                                        
                                                        
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="fila" items="${result.rows}">
                                                        <tr>
                                                            <td>
                                                                <c:out value="${fila.id}" />
                                                            </td>
                                                            <td>
                                                                <c:out value="${fila.titulo}" />
                                                            </td>
                                                            <td>
                                                                <c:out value="${fila.descripcion}" />
                                                            </td>
                                                          
                                                            <td>
                                                                <c:out value="${fila.estado_evaluador}" />
                                                            </td>
                                                             <td>
                                                                <c:out value="${fila.estado_director}" />
                                                            </td>
                                                            <td>
                                                                <c:out value="${fila.id_evaluador}" />
                                                            </td>
                                                            <td>
                                                                <c:out value="${fila.id_director}" />
                                                            </td>
                                                           
                                                            
                                                            



                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div></div></div></div></div></div></div></div></div></div></div></div>


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

    <script
                                src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
                            <script
                                src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
                            <script
                                src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>



</body>
</html>
