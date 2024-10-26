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
<link rel="stylesheet" href="../assets/css/style.css">
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
                                    
                                </div>

        <!-- Contenido principal -->
        <div class="main-content">
            <h1>Bienvenido, Coordinador <c:out value="${sessionScope.nombres}" /></h1>
            <p>Este es tu panel de control donde puedes gestionar tus actividades como coordinador.</p>

        <div class="row">
                                        <div class="col-md-12">
                                            <div class="card"style="width: 1092px;">
                                                <div class="card-body text-center">
                                                    <h5 class="card-title">Asignar Director y Evaluador</h5>
                                                </div>
    <div class="container">
        
        <div class="card-body"style="width: 1051px;">
        
        
            <c:if test="${param.modifica == null}">
                <sql:query var="proyecto" dataSource="${conexionSI}">
                    SELECT * FROM proyecto WHERE id = ?;
                    <sql:param value="${param.id}" />
                </sql:query>
                <sql:query var="evaluadoresDirectores" dataSource="${conexionSI}">
                    SELECT id, nombres, rol_1, rol_2 FROM usuarios 
                    WHERE rol_1 IN ('Evaluador', 'Director') OR rol_2 IN ('Evaluador', 'Director');
                </sql:query>
                <div class="input-area">
                    <div class="form-group">
                        <form class="form needs-validation" id="edit-project-form" method="post">
                            <table class="table">
                                <c:forEach var="item" items="${proyecto.rows}">
                                    <tr>
                                    </tr>
                                    <tr>
                                        <td style="background-color: rgb(34, 28, 28); color: rgb(255, 255, 255);">Título:</td>
                                        <td style="background-color: rgb(163, 163, 163);">
                                        
                                         <input style="width: 830px; transform: translate(13px, 0px); color: rgb(5, 5, 5); background-color: rgb(252, 252, 252);" 
                       type="text" value="${item.titulo}" disabled />
                <!-- Campo oculto para enviar el valor -->
                <input type="hidden" name="titulo" value="${item.titulo}" />
                                        
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color: rgb(34, 28, 28); color: rgb(255, 255, 255);">Descripción:</td>
                                        <td>
                                        <textarea style="width: 832px; transform: translate(13px, 0px); height: 164px;" disabled>${item.descripcion}</textarea>
                <!-- Campo oculto para enviar el valor -->
                <input type="hidden" name="descripcion" value="${item.descripcion}" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color: rgb(34, 28, 28); color: rgb(255, 255, 255);">URL:</td>
                                        <td style="background-color: rgb(163, 163, 163);">
                                        <input style="width: 828px; transform: translate(16px, 0px); height: 35px; color: rgb(18, 17, 17); background-color: rgb(247, 243, 243);" 
                       type="url" value="${item.url}" disabled />
                <input type="hidden" name="url" value="${item.url}" />
                                        
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td style="background-color: rgb(34, 28, 28); color: rgb(255, 255, 255);">Evaluador:</td>
                                        <td style="background-color: rgb(163, 163, 163);">
                                            <select name="id_evaluador" required style="width: 200px;">
                                                <option value="">Seleccione un evaluador</option>
                                                <c:forEach var="usuario" items="${evaluadoresDirectores.rows}">
                                                    <c:if test="${usuario.rol_1 == 'Evaluador' || usuario.rol_2 == 'Evaluador'}">
                                                        <option value="${usuario.id}" ${usuario.id == item.id_evaluador ? 'selected' : ''}>${usuario.nombres}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color: rgb(34, 28, 28); color: rgb(255, 255, 255);">Director:</td>
                                        <td style="background-color: rgb(163, 163, 163);">
                                            <select name="id_director" required style="width: 200px;">
                                                <option value="">Seleccione un director</option>
                                                <c:forEach var="usuario" items="${evaluadoresDirectores.rows}">
                                                    <c:if test="${usuario.rol_1 == 'Director' || usuario.rol_2 == 'Director'}">
                                                        <option value="${usuario.id}" ${usuario.id == item.id_director ? 'selected' : ''}>${usuario.nombres}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color: rgb(34, 28, 28); color: rgb(255, 255, 255);">Estado:</td>
                                        <td>
                                            ${item.estado == 'true' ? 'Seleccionado' : 'No seleccionado'}
                                            <input type="hidden" name="estado" value="${item.estado}" />
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                            <input type="submit" class="btn btn-success" value="Asignar" />
                            <input type="hidden" name="modifica" value="ST" />
                        </form>
                        <a href="index.jsp" class="btn btn-success"> Volver </a>
                    </div>
                </div>
            </c:if>
            </div>


            <c:if test="${param.modifica != null}">             
                <sql:update var="result" dataSource="${conexionSI}">
                    UPDATE proyecto
                    SET 
                        titulo = ?,
                        descripcion = ?,
                        url = ?,
                        id_evaluador = ?,
                        id_director = ?
                    WHERE id = ?;
                    <sql:param value="${param.titulo}" />
                    <sql:param value="${param.descripcion}" />
                    <sql:param value="${param.url}" />
                    <sql:param value="${param.id_evaluador}" />
                    <sql:param value="${param.id_director}" />
                    <sql:param value="${param.id}" />
                </sql:update>

    
    <c:if test="${result == 1}">
    <script>
        window.location.href = 'index.jsp?status=setUpdate';
    </script>
</c:if>

<c:if test="${result != 1}">
<script>
        window.location.href = 'index.jsp?status=ErrorUpdate';
    </script>
</c:if>

            </c:if>
        </div>
    </div>
       </div>
           </div>
           </div>
            </div></div>
            </div></div>
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