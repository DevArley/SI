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
                                    <p class="user-name" style="position: relative; left: -117px; top: 22px; color: rgb(255, 255, 255);" >Bienvenido,
                                        <c:out value="${sessionScope.email}" />
                                    </p>
                                    <a href="../log/logout.jsp" class="btn btn-warning btn-sm logout-btn">Logout</a>
                                </div>
                            </header>


                            <div class="container-fluid">
                                <!-- Menú lateral -->
                                <div class="sidebar">
                                    <h5>Panel de Director</h5>
                                    <a href="index.jsp"><i class="fas fa-folder-open"></i> Ver Calificaciones</a>
                                    <a href="aproProye.jsp" class="active"><i class="fas fa-file-alt"></i> Aprobar
                                        Proyecto
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
                                            <div class="card" style="width: 1014px;">
                                                <div class="card-body text-center">
                                                    <h5 class="card-title">Información del Director</h5>
                                                    <p class="card-text">Aquí puedes gestionar la evaluación de
                                                        proyectos y asignar evaluadores.</p>
                                                </div>





                                                    <!-- Fetch director's ID using email from session -->
                                                    <sql:query var="directorResult" dataSource="${conexionSI}">
                                                        SELECT id FROM usuarios WHERE email = ?
                                                        <sql:param value="${sessionScope.email}" />
                                                    </sql:query>
                                                    <c:set var="directorId" value="${directorResult.rows[0].id}"
                                                        scope="session" />

                                                    <!-- Query to get projects for the current director -->
                                                    <sql:query var="result" scope="request" dataSource="${conexionSI}">
                                                        SELECT id, titulo, descripcion, url, estado_director,
                                                        id_estudiante1, id_estudiante2, id_evaluador, fecha_creacion,
                                                        estado
                                                        FROM proyecto
                                                        WHERE id_director = ?
                                                        <sql:param value="${directorId}" />
                                                    </sql:query>

                                                    <div class="container">
                                                        <div class="table-responsive">
                                                            <table
                                                                class="table table-striped table-bordered table-hover">
                                                                <thead class="thead-dark">
                                                                    <tr>
                                                                        <th>ID</th>
                                                                        <th>Titulo</th>
                                                                        <th>Descripcion</th>
                                                                        <th>Url</th>
                                                                        <th>Estado Director</th>
                                                                        <th>Id Estudiante1</th>
                                                                        <th>Id Estudiante2</th>

                                                                        <th>Fecha de Creación</th>

                                                                        <th>Acción</th>
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
                                                                                <c:out
                                                                                    value="${fila.estado_director}" />
                                                                            </td>
                                                                            <td>
                                                                                <c:out value="${fila.id_estudiante1}" />
                                                                            </td>
                                                                            <td>
                                                                                <c:out value="${fila.id_estudiante2}" />
                                                                            </td>

                                                                            <td>
                                                                                <c:out value="${fila.fecha_creacion}" />
                                                                            </td>

                                                                            <td>
                                                                                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal"
                    data-target="#asignarEstadoModal${fila.id}">
                Asignar Estado
            </button>
                                                                            </td>
                                                                        </tr>


                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                     
                    
                                    
                                    </c:forEach>
                                    </tbody>
                                    </table>
                                </div>
                            </div>
                            
                            
</div>
                                    </div>
  </div>
                              </div>        </div>
<c:forEach var="fila" items="${result.rows}">
<!-- Modal para asignar estado -->
                                    <div class="modal fade" id="asignarEstadoModal${fila.id}" tabindex="-1"
                                        role="dialog" aria-labelledby="asignarEstadoModalLabel${fila.id}"
                                        aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="asignarEstadoModalLabel${fila.id}">
                                                        Asignar Estado a Proyecto: ${fila.titulo}</h5>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="asignarEstado.jsp" method="post">
                                                        <input type="hidden" name="id_proyecto" value="${fila.id}">
                                                        <div class="form-group">
                                                            <label for="estado_director">Seleccione el estado:</label>
                                                            <select class="form-control" id="estado_director"
                                                                name="estado_director">
                                                                <option value="pendiente"
                                                                    ${fila.estado_director=='pendiente' ? 'selected'
                                                                    : '' }>Pendiente</option>
                                                                <option value="calificado"
                                                                    ${fila.estado_director=='calificado' ? 'selected'
                                                                    : '' }>Calificado</option>
                                                                <option value="rechazado"
                                                                    ${fila.estado_director=='rechazado' ? 'selected'
                                                                    : '' }>Rechazado</option>
                                                            </select>
                                                        </div>
                                                        <button type="submit" class="btn btn-primary">Guardar
                                                            Cambios</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
</c:forEach>

<c:if test="${param.status == 'success'}">
    <script type="text/javascript">
        window.onload = function() {
            alert("Estado modificado satisfactoriamente.");
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
                                function setProjectId(id) {
                                    document.getElementById('id_proyecto').value = id;
                                }
                                function showStudentInfo(idEstudiante1, idEstudiante2) {
                                    // Aquí se pueden hacer consultas a la base de datos para obtener más información si es necesario
                                    document.getElementById('studentId1').textContent = idEstudiante1;
                                    document.getElementById('studentId2').textContent = idEstudiante2;
                                }
                            </script>



                        </body>

                </html>