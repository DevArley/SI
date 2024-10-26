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
                    <title>Estudiante</title>
                </head>
 <style>
                        body {
                            display: flex;
                            flex-direction: column;
                            height: 100vh;
                            margin: 0;
                            /* Asegúrate de que no haya márgenes */
                        }

                        /* Estilos del header */
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
                            <h5>Panel de Estudiante</h5>
                            <a href="index.jsp" class="active"><i class="fas fa-folder-open"></i> Ver
                                Proyectos</a>
                            <a href="subirDocumentos.jsp" ><i class="fas fa-upload"></i> Subir Documentos</a>
                            <a href="Notas.jsp"><i class="fas fa-clipboard"></i> Consultar Notas</a>
                            <a href="calendario.jsp"><i class="fas fa-calendar"></i> Calendario Académico</a>
                            <a href="formatosGrado.jsp"><i class="fas fa-file-alt"></i> Formatos de Grado</a>
                        </div>

                        <!-- Contenido principal -->
                        <div class="main-content">
                            <h1>Bienvenido,
                                <c:out value="${sessionScope.nombres}" />
                            </h1>
                            <p>Este es tu panel de control donde puedes gestionar tus actividades como estudiante.</p>

                            <!-- Tarjetas de acceso rápido -->
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="card"style="width: 1020.5px;">
                                        <div class="card-body text-center">
                                            <h5 class="card-title">Lista de Proyectos</h5>
                                            <p class="card-text">Consulta los proyectos en los que estás inscrito o
                                                participando.</p>

                                        </div>
                                     

<%-- Obtener el ID del usuario basado en su email --%>
<sql:query var="userQuery" dataSource="${conexionSI}">
    SELECT id FROM usuarios WHERE email = ?
    <sql:param value="${sessionScope.email}" />
</sql:query>

<c:if test="${userQuery.rowCount > 0}">
    <c:set var="userId" value="${userQuery.rows[0].id}" scope="session" />
</c:if>

<%-- Consulta para obtener los proyectos del estudiante --%>
<sql:query var="proyectosEstudiante" dataSource="${conexionSI}">
    SELECT id, titulo, descripcion, url, id_estudiante1, id_estudiante2, id_evaluador, id_director, fecha_creacion, estado_evaluador
    FROM proyecto 
    WHERE id_estudiante1 = ? OR id_estudiante2 = ?
    <sql:param value="${sessionScope.userId}" />
    <sql:param value="${sessionScope.userId}" />
</sql:query>
       <c:choose>
                <c:when test="${proyectosEstudiante.rowCount > 0}">
                    <h2>Tus Proyectos</h2>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover">
                            <thead class="thead-dark">
                                <tr>
                                    <th>ID</th>
                                    <th>Título</th>
                                    <th>Descripción</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="proyecto" items="${proyectosEstudiante.rows}">
                                    <tr>
                                        <td><c:out value="${proyecto.id}" /></td>
                                        <td><c:out value="${proyecto.titulo}" /></td>
                                        <td><c:out value="${proyecto.descripcion}" /></td>
                                        <td>
<button class="btn btn-secondary btn-sm" onclick="showProjectStatus(${proyecto.id})">
    Ver Estado Proyecto
</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:when>
                <c:otherwise>
            <div class="alert alert-info" role="alert">
                No tienes proyectos vinculados actualmente.
            </div>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#proyectosDisponiblesModal">
                Seleccionar un proyecto
            </button>
        </c:otherwise>
    </c:choose>
</div>



  <!-- Modal for Project Status -->
    <div class="modal fade" id="projectStatusModal" tabindex="-1" role="dialog" aria-labelledby="projectStatusModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="projectStatusModalLabel">Estado del Proyecto</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="projectStatusContent">
                    <!-- Project status information will be loaded here -->
                </div>
            </div>
        </div>
    </div>


<!-- Modal de Proyectos Disponibles -->
<div class="modal fade" id="proyectosDisponiblesModal" tabindex="-1" role="dialog" aria-labelledby="proyectosDisponiblesModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="proyectosDisponiblesModalLabel">Proyectos Disponibles</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Consulta para obtener proyectos disponibles -->
                <sql:query var="proyectosDisponibles" dataSource="${conexionSI}">
                    SELECT id, titulo, descripcion
                    FROM proyecto 
                    WHERE id_estudiante1 IS NULL OR id_estudiante2 is NULL
                </sql:query>

                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Título</th>
                            <th>Descripción</th>
                            <th>Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="proyecto" items="${proyectosDisponibles.rows}">
                            <tr>
                                <td><c:out value="${proyecto.id}" /></td>
                                <td><c:out value="${proyecto.titulo}" /></td>
                                <td><c:out value="${proyecto.descripcion}" /></td>
                                <td>
                     <form action="agg/agregarProyecto.jsp" method="post">
    <input type="hidden" name="proyectoId" value="${proyecto.id}">
    <button type="submit" class="btn btn-success btn-sm">Agregar</button>
</form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>

                </div> </div>     </div> </div> </div> </div>
                    


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
  <script
                                src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
                            <script
                                src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
                            <script
                                src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
                                <!-- jQuery CDN -->
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
    <script>
    function showProjectStatus(projectId) {
        $.ajax({
            url: 'getProjectStatus.jsp',
            method: 'GET',
            data: { id: projectId },
            success: function(response) {
                $('#projectStatusContent').html(response);
                $('#projectStatusModal').modal('show');
            },
            error: function(xhr, status, error) {
                console.error('Error en AJAX:', status, error);
                alert('Error al cargar el estado del proyecto.');
            }
        });
    }
    </script>



                            
                        </body>

                </html>