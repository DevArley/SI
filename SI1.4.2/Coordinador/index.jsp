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
                    </head>

                    <body>

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
                                <!-- Menú lateral -->
                                <div class="sidebar">
                                    <h5>Panel de Coordinador</h5>
                                    <a href="index.jsp" class="active"><i class="fas fa-folder-open"></i> Ver
                                        Proyectos</a>
                                    <a href="consultarInformes.jsp"><i class="fas fa-file-alt"></i> Consultar Informes</a>
                                    <a href="estudiante.jsp"><i class="fa fa-search"></i> Consultar Estudiante</a>
                                    <a href="formatosGrado.jsp"><i class="fas fa-file-alt"></i> Formatos de Grado</a>
                                    <a href="calendario.jsp"><i class="fas fa-calendar"></i> Calendario Académico</a>
                                    <a href="#" data-toggle="modal" data-target="#crearProyectoModal"><i
                                            class="fas fa-plus-circle"></i> Crear Proyecto</a>
                                </div>

                                <!-- Contenido principal -->
                                <div class="main-content">
                                    <h1>Bienvenido,
                                        <c:out value="${sessionScope.nombres}" />
                                    </h1>
                                    <p>Este es tu panel de control donde puedes gestionar tus actividades como
                                        coordinador.</p>

                                    <!-- Tarjeta de diseño -->
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="card"style="width: 1092px;">
                                                <div class="card-body text-center">
                                                    <h5 class="card-title">Información del Coordinador</h5>
                                                    <p class="card-text">Aquí puedes gestionar la evaluación de
                                                        proyectos y asignar evaluadores.</p>
                                                </div>

                                                
                                           

                                    <!-- Consulta para obtener los datos de los proyectos -->
                                    <sql:query var="result" scope="request" dataSource="${conexionSI}">
                                        SELECT id, titulo, descripcion, url, estado_director,  id_estudiante1, id_estudiante2, id_evaluador, id_director,
                                        fecha_creacion, estado FROM proyecto;
                                    </sql:query>



                                    <div class="container">
                                    <div>
                                            <a href="#" data-toggle="modal" data-target="#crearProyectoModal"><i
                                                    class="fas fa-plus-circle"></i> Crear Proyecto</a>
                                                    </div>
                                                    </br>
                                            <!-- Botón para abrir el modal -->
 </div>
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered table-hover">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th>id</th>

                                                        <th>Titulo</th>
                                                        <th>Descripcion</th>
                                                        <th>Url</th>
                                                        <th>Id Estudiante1</th>
                                                          <th>Id Estudiante2</th>
                                                        <th>Id Evaluador</th>
                                                        <th>Id Director</th>
                                                        <th>Fecha de Creación</th>
                                                        <th>Estado</th>
                                                        <th colspan="4">Acciones</th>
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
                                                                <c:out value="${fila.url}" />
                                                            </td>
                                                            <td>
                                                                <c:out value="${fila.id_estudiante1}" />
                                                            </td>
                                                             <td>
                                                                <c:out value="${fila.id_estudiante2}" />
                                                            </td>
                                                            <td>
                                                                <c:out value="${fila.id_evaluador}" />
                                                            </td>
                                                            <td>
                                                                <c:out value="${fila.id_director}" />
                                                            </td>
                                                            <td>
                                                                <c:out value="${fila.fecha_creacion}" />
                                                            </td>
                                                            <td>
                                                                <c:out value="${fila.estado}" />
                                                            </td>
                                                
                                                                


                                                            

                                                                
                                                            <td>
                            <a href="#" class="btn btn-danger btn-sm"
                               onclick="confirmDelete('${fila.id}', '${fila.titulo}')">
                                Eliminar
                            </a>
                        </td>
                                                            <td> <a href="setEvaluador.jsp?id=${fila.id}"
                                                                    class="btn btn-primary btn-sm">Set
                                                                    Evaluador/Director</a>
                                                            </td>
                                                            <td>
                                                                <a href="editIdea.jsp?id=${fila.id}"
                                                                    class="btn btn-primary btn-sm">Editar</a>
                                                            </td>
                                                            <td>
                                                                <a href="estados.jsp?id=${fila.id}"
                                                                    class="btn btn-primary btn-sm">ver estados</a>
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




                            
<!-- Modal de confirmación para cada proyecto -->
                                                                

                            <!-- Procesar la eliminación si se envió el formulario -->
                            <c:if test="${param.action == 'delete' && not empty param.id}">
                                <sql:query var="checkProject" dataSource="${conexionSI}">
                                    SELECT COUNT(*) as count FROM proyecto WHERE id = ?
                                    <sql:param value="${param.id}" />
                                </sql:query>

                                <c:choose>
                                    <c:when test="${checkProject.rows[0].count > 0}">
                                        <sql:update dataSource="${conexionSI}">
                                            DELETE FROM proyecto WHERE id = ?
                                            <sql:param value="${param.id}" />
                                        </sql:update>
                                        <c:set var="message" value="El proyecto ha sido eliminado exitosamente." />
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="message" value="El proyecto no fue encontrado." />
                                    </c:otherwise>
                                </c:choose>
                            </c:if>

                            <!-- Mostrar mensaje de resultado si existe -->
                            <c:if test="${not empty message}">
                                <div class="alert alert-info" role="alert">
                                    ${message}
                                </div>
                            </c:if>


























                            <!-- Modal para crear nuevo proyecto -->
                            <div class="modal fade" id="crearProyectoModal" tabindex="-1" role="dialog"
                                aria-labelledby="crearProyectoModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="crearProyectoModalLabel">Crear Nuevo Proyecto
                                            </h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form method="post" action="addProyecto.jsp">
                                                <div class="form-group">
                                                    <label for="titulo">Título:</label>
                                                    <input type="text" class="form-control" name="titulo" required />
                                                </div>
                                                <div class="form-group">
                                                    <label for="descripcion">Descripción:</label>
                                                    <textarea class="form-control" name="descripcion" rows="3"
                                                        required></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <label for="url">URL:</label>
                                                    <input type="url" class="form-control" name="url" required />
                                                </div>
                                                <button type="submit" class="btn btn-success">Crear Proyecto</button>
                                                
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
<c:if test="${param.status == 'success'}">
    <script type="text/javascript">
        window.onload = function() {
            alert("Proyecto eliminado satisfactoriamente.");
        }
    </script>
</c:if>
<c:if test="${param.status == 'new'}">
    <script type="text/javascript">
        window.onload = function() {
            alert("Proyecto creado satisfactoriamente.");
        }
    </script>
</c:if>
<c:if test="${param.status == 'errornew'}">
    <script type="text/javascript">
        window.onload = function() {
            alert("Error al crear el Proyecto.");
        }
    </script>
</c:if>
<c:if test="${param.status == 'setUpdate'}">
    <script type="text/javascript">
        window.onload = function() {
            alert("Director y Evaluador Agregados Correctamente.");
        }
    </script>
</c:if>
<c:if test="${param.status == 'ErrorUpdate'}">
    <script type="text/javascript">
        window.onload = function() {
            alert("Error al intentar agregar algun director y evaluador.");
        }
    </script>
</c:if>
<c:if test="${param.status == 'proUpdate'}">
    <script type="text/javascript">
        window.onload = function() {
            alert("Idea Proyecto Actualizada Correctamente.");
        }
    </script>
</c:if>
<c:if test="${param.status == 'ErrorproUd'}">
    <script type="text/javascript">
        window.onload = function() {
            alert("Error al intentar actualizar la idea de proyecto.");
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

<script>
    function confirmDelete(id, title) {
        // Mostrar alerta de confirmación
        if (window.confirm("¿Está seguro de que desea eliminar el proyecto '" + title + "'?")) {
            // Redirigir a la acción de eliminación
            window.location.href = "eliminarProyecto.jsp?id=" + id; // Ajusta esta URL según sea necesario
        }
    }
</script>

                            
                        </body>

                </html>