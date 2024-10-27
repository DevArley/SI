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
                                    <p class="user-name" style="position: relative; left: -117px; top: 22px; color: rgb(255, 255, 255);">Bienvenido,
                                        <c:out value="${sessionScope.email}" />
                                    </p>
                                    <a href="../log/logout.jsp" class="btn btn-warning btn-sm logout-btn">Logout</a>
                                </div>
                            </header>
    <!-- Fetch director's ID using email from session -->
<sql:query var="directorResult" dataSource="${conexionSI}">
    SELECT id FROM usuarios WHERE email = ?
    <sql:param value="${sessionScope.email}" />
</sql:query>
<c:set var="directorId" value="${directorResult.rows[0].id}" scope="session" />

<!-- SQL query to fetch projects without a calificacion for the current director -->
<sql:query var="proyectosSinCalificar" dataSource="${conexionSI}">
    SELECT id, titulo 
    FROM proyecto 
    WHERE id_director = ? AND id_calificacion IS NULL
    <sql:param value="${directorId}" />
</sql:query>


                            <div class="container-fluid">
                                <!-- Menú lateral -->
                                <div class="sidebar">
                                    <h5>Panel de Director</h5>
                                    <a href="index.jsp" class="active"><i class="fas fa-folder-open"></i> Ver Calificaciones</a>
                                    <a href="aproProye.jsp"><i class="fas fa-file-alt"></i>  Aprobar Proyecto
                                    </a>
                                    <a href="formatosGrado.jsp"><i class="fas fa-file-alt"></i> Formatos de Grado</a>
                                    <a href="calendario.jsp"><i class="fas fa-calendar"></i> Calendario Académico</a>
                                    
                                </div>

                                <!-- Contenido principal -->
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
                                                    <h5 class="card-title">Información del Director</h5>
                                                    <p class="card-text">Aquí puedes gestionar la evaluación de
                                                        proyectos y asignar evaluadores.</p>
                                                </div>
                                         
                                      



                                    


    <!-- Fetch director's ID using email from session -->
    <sql:query var="directorResult" scope="request" dataSource="${conexionSI}">
        SELECT id FROM usuarios WHERE email = ?
        <sql:param value="${sessionScope.email}" />
    </sql:query>
    <c:set var="directorId" value="${directorResult.rows[0].id}" scope="session" />

    <!-- Process form submission -->
    <c:if test="${param.action == 'calificar'}">
        <c:catch var="exception">
            <sql:transaction dataSource="${conexionSI}">



               <sql:query var="studentIds">
    SELECT id_estudiante1, id_estudiante2 FROM proyecto WHERE id = ?
    <sql:param value="${param.id_proyecto}" />
</sql:query>

                <!-- Insert new calificación -->
                <sql:update var="insertResult">
    INSERT INTO calificaciones (id_proyecto, id_estudiante1, id_estudiante2, id_director, calificacion, comentario, fecha_calificacion)
    VALUES (?, ?, ?, ?, ?, ?, NOW())
    <sql:param value="${param.id_proyecto}" />
    <sql:param value="${studentIds.rows[0].id_estudiante1}" />
    <sql:param value="${studentIds.rows[0].id_estudiante2}" />
    <sql:param value="${sessionScope.id_director}" />
    <sql:param value="${param.calificacion}" />
    <sql:param value="${param.comentario}" />
</sql:update>
                
                <!-- Get the ID of the newly inserted calificación -->
                <sql:query var="newCalificacionId">
                    SELECT LAST_INSERT_ID() as id
                </sql:query>
                
                <!-- Update the project with the new calificación ID -->
                <sql:update var="updateResult">
                    UPDATE proyecto 
                    SET id_calificacion = ? 
                    WHERE id = ?
                    <sql:param value="${newCalificacionId.rows[0].id}" />
                    <sql:param value="${param.id_proyecto}" />
                </sql:update>
            </sql:transaction>
            
            <c:set var="mensaje" value="Calificación registrada y proyecto actualizado exitosamente." />
        </c:catch>
        
        <c:if test="${not empty exception}">
            <c:set var="error" value="Error al procesar la calificación: ${exception.message}" />
        </c:if>
    </c:if>

    <!-- Display message or error -->
    <c:if test="${not empty mensaje}">
        <div class="alert alert-success">${mensaje}</div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <!-- Fetch and display calificaciones for the director -->
    <sql:query var="result" dataSource="${conexionSI}">
        SELECT 
            c.id_calificacion,
            c.id_proyecto,
            c.id_estudiante1,
            c.id_estudiante2,
            c.id_director,
            c.calificacion,
            c.comentario,
            c.fecha_calificacion,
            p.titulo as proyecto_titulo
        FROM calificaciones c
        JOIN proyecto p ON c.id_proyecto = p.id
        WHERE c.id_director = ?
        <sql:param value="${sessionScope.directorId}" />
    </sql:query>

    
        <h2>Calificaciones</h2>
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>ID Calificación</th>
                        <th>Proyecto</th>
                        <th>ID Estudiante 1</th>
                        <th>ID Estudiante 2</th>
                          <th>ID Director </th>
                        <th>Calificación</th>
                        <th>Comentario</th>
                        <th>Fecha de Calificación</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="fila" items="${result.rows}">
                        <tr>
                            <td><c:out value="${fila.id_calificacion}" /></td>
                            <td><c:out value="${fila.id_proyecto}" /></td>
                            <td><c:out value="${fila.id_estudiante1}" /></td>
                            <td><c:out value="${fila.id_estudiante2}" /></td>
                              <td><c:out value="${fila.id_director}" /></td>
                            <td><c:out value="${fila.calificacion}" /></td>
                            <td><c:out value="${fila.comentario}" /></td>
                            <td><c:out value="${fila.fecha_calificacion}" /></td>
                            <td>
                            <a href="detallesEstudiantes.jsp?estudiante1Id=${fila.id_estudiante1}&estudiante2Id=${fila.id_estudiante2}" 
                               class="btn btn-primary btn-sm">Ver Alumnos</a>
                        </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        
        <a href="#" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#calificarProyectoModal">
            <i class="fas fa-star"></i> Calificar Proyectos
        </a>
    </div>




<div class="container">

<!-- Modal para calificar proyecto -->
<div class="modal fade" id="calificarProyectoModal" tabindex="-1" role="dialog" 
     aria-labelledby="calificarProyectoModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="calificarProyectoModalLabel">Calificar Proyecto</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <c:choose>
                    <c:when test="${not empty proyectosSinCalificar.rows}">
                        <form id="calificarForm" method="post" action="calificarProyecto.jsp">
                            <input type="hidden" name="action" value="calificar">
                            <div class="form-group">
                                <label for="id_proyecto">Seleccionar Proyecto:</label>
                                <select class="form-control" name="id_proyecto" id="id_proyecto" required>
                                    <option value="">Seleccione un proyecto</option>
                                    <c:forEach var="proyecto" items="${proyectosSinCalificar.rows}">
                                        <option value="${proyecto.id}">${proyecto.titulo}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="calificacion">Calificación:</label>
                                <input type="number" class="form-control" name="calificacion" id="calificacion"
                                       min="0" max="10" step="0.1" required />
                            </div>
                            <div class="form-group">
                                <label for="comentario">Comentario:</label>
                                <textarea class="form-control" name="comentario" id="comentario" rows="3"
                                          required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Enviar Calificación</button>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <p>No hay proyectos pendientes de calificación.</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>


<!-- Modal para ver estudiantes -->
<div class="modal fade" id="studentModal" tabindex="-1" role="dialog" aria-labelledby="studentModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="studentModalLabel">Detalles de Alumnos</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Tipo de Documento</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>Género</th>
                            <th>Teléfono</th>
                            <th>Email</th>
                        </tr>
                    </thead>
                    <tbody id="studentDetails">
                        <c:choose>
                            <c:when test="${not empty estudiantesDetalles.row}">
                                <c:forEach var="estudiante" items="${estudiantesDetalles.row}">
                                    <tr>
                                        <td>${estudiante.tipo_de_documento}</td>
                                        <td>${estudiante.nombres}</td>
                                        <td>${estudiante.apellidos}</td>
                                        <td>${estudiante.genero}</td>
                                        <td>${estudiante.telefono}</td>
                                        <td>${estudiante.email}</td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="6">No hay detalles disponibles.</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


  </div>
                                    </div>
  </div>
                              </div>        </div>


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

    
        <script>
    function showStudentInfo(idEstudiante1, idEstudiante2) {
        // Realiza una solicitud AJAX o actualiza el modal con los detalles del estudiante
        // Por ejemplo, puedes hacer otra consulta a un servlet y llenar la tabla en el modal
        $.ajax({
            url: 'tuServletParaDetallesEstudiante', // Cambia a tu servlet
            method: 'GET',
            data: { 
                estudiante1: idEstudiante1, 
                estudiante2: idEstudiante2 
            },
            success: function(response) {
                $('#studentDetails').empty(); // Limpiar el contenido actual
                // Suponiendo que 'response' contiene el HTML para las filas
                $('#studentDetails').html(response);
            }
        });
    }
</script>


        
    


                            
                        </body>

                </html>
