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
    <title>Sistema Universitario - Formatos de Grado</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
            <img class="border-primary" style="border-radius: 50%;" src="../img/S (1).png" alt="ATENA Logo">
        </div>
        <div class="user-info">
            <p class="user-name" style="position: relative; left: -117px; top: 22px; color: rgb(255, 255, 255);">Bienvenido, <c:out value="${sessionScope.email}" /></p>
            <a href="../log/logout.jsp" class="btn btn-warning btn-sm logout-btn">Logout</a>
        </div>
    </header>

    <div class="container-fluid">
        <div class="sidebar">
                                    <h5>Panel de Coordinador</h5>
                                    <a href="index.jsp" ><i class="fas fa-folder-open"></i> Ver
                                        Proyectos</a>
                                    <a href="consultarInformes.jsp"><i class="fas fa-file-alt"></i> Consultar Informes</a>
                                    <a href="estudiante.jsp"><i class="fa fa-search"></i> Consultar Estudiante</a>
                                    <a href="formatosGrado.jsp"class="active"><i class="fas fa-file-alt"></i> Formatos de Grado</a>
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
            <div class="card" style="width: 1092px;">
                <div class="card-body text-center">
                    <h5 class="card-title">Agregar de Formatos de Grado</h5>
                    <p class="card-text">Aquí puedes gestionar los formatos de grado.</p>
                    </div>
                    <div>
                    <a href="#"  data-toggle="modal" data-target="#agregarFormatoModal" style="width: 378px; transform: translate(42px, 0px);">
                        <i class="fas fa-plus-circle"></i> Agregar Formato
                    </a>
                    </div>

                    <!-- Modal -->
                    

                    <sql:query var="formatos" scope="request" dataSource="${conexionSI}">
                        SELECT id, titulo, url_formato FROM formatos_grado;
                    </sql:query>
                    <div class="card-body"style="width: 1051px;">
                    <div class="table-responsive">
                    <c:choose>
                        <c:when test="${not empty formatos.rows}">
                            <table class="table table-striped table-bordered table-hover">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>ID</th>
                                        <th>Título</th>
                                        <th>URL</th>
                                        <th colspan="4">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="formato" items="${formatos.rows}">
                                        <tr>
                                            <td  style="background-color: rgb(255, 255, 255);"><c:out value="${formato.id}"/></td>
                                            <td  style="background-color: rgb(255, 255, 255);"><c:out value="${formato.titulo}"/></td>
                                            <td  style="background-color: rgb(255, 255, 255);"><a href="${formato.url_formato}" target="_blank">Ver Formato</a></td>
                                            <td style="background-color: rgb(255, 255, 255);">
                                                                <a href="editForm.jsp?id=${formato.id}"
                                                                    class="btn btn-primary btn-sm">Editar</a>
                                                            </td>
                                                            <td style="background-color: rgb(255, 255, 255);">
                            <a class="btn btn-danger btn-sm"
       href="formatosGrado.jsp?action=delete&id=${formato.id}"
       onclick="return confirm('¿Está seguro que desea eliminar el formato ${formato.titulo}?');">
        Eliminar
    </a>
                        </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <p>No hay formatos por el momento.</p>
                        </c:otherwise>
                    </c:choose>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

      
                                    </div>
                                </div>

                            </div>


                            <div class="modal fade" id="agregarFormatoModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="modalLabel">Agregar Nuevo Formato</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                
                                <form action="addFormat.jsp" method="POST">
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label for="titulo">Título del Formato</label>
                                            <input type="text" class="form-control" id="titulo" name="titulo" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="url_formato">URL del Formato</label>
                                            <input type="url" class="form-control" id="url_formato" name="url_formato" required>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                        <button type="submit" class="btn btn-primary">Guardar Formato</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>




<c:if test="${param.action == 'delete' && not empty param.id}">
    <sql:query var="checkProject" dataSource="${conexionSI}">
        SELECT COUNT(*) as count FROM formatos_grado WHERE id = ?
        <sql:param value="${param.id}" />
    </sql:query>

    <c:choose>
        <c:when test="${checkProject.rows[0].count > 0}">
            <sql:update dataSource="${conexionSI}">
                DELETE FROM formatos_grado WHERE id = ?
                <sql:param value="${param.id}" />
            </sql:update>
            <c:set var="message" value="El Formato de proyecto ha sido ELIMINADO exitosamente." />
            <script>
            window.location.reload();
            </script>
        </c:when>
        <c:otherwise>
            <c:set var="message" value="El proyecto no fue encontrado." />
        </c:otherwise>
    </c:choose>
</c:if>
<c:if test="${param.status == 'success'}">
    <script type="text/javascript">
        window.onload = function() {
            alert("Formatos de proyecto de grado CREADO Correctamente.");
        }
    </script>
</c:if>
<c:if test="${param.status == 'error'}">
    <script type="text/javascript">
        window.onload = function() {
            alert("No se pudo CREAR el  formato de proyecto.");
        }
    </script>
</c:if>
<c:if test="${param.status == 'successedit'}">
    <script type="text/javascript">
        window.onload = function() {
            alert("Formatos de  proyecti de grado EDITADO Correctamente.");
        }
    </script>
</c:if>
<c:if test="${param.status == 'errordelt'}">
    <script type="text/javascript">
        window.onload = function() {
            alert("No se pudo ELIMINAR el formato de proyecto de grado.");
        }
    </script>
</c:if>

<c:if test="${param.status == 'erroredit'}">
    <script type="text/javascript">
        window.onload = function() {
            alert("No se pudo MODIFICAR el  formato de proyecto de grado.");
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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>
</html>