<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
    <title>Sistema Universitario</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitterbootstrap/4.6.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fontawesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <title>Sistema de Gestión</title>
</head>

<body>
    
    
    <header>
    <div class="logo">
        <img class="border-primary" style="border-radius: 50%;" src="../img/S (1).png" alt="ATENA Logo">
    </div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a href="logout.jsp" class=" btn-warning">Logout</a>
            </li>
        </ul>
    </nav>
</header>


<main>
 <c:if test="${param.status == 'success'}">
                <script type="text/javascript">
                    window.onload = function() {
                        alert("Usuario eliminado satisfactoriamente.");
                    }
                </script>
            </c:if>
            <c:if test="${param.status == 'error'}">
                <script type="text/javascript">
                    window.onload = function() {
                        alert("No se pudo eliminar el usuario ya que cuenta con proyectos activos.");
                    }
                </script>
            </c:if>

    <div class="card-body " style="background-color: rgb(255, 255, 255);">
        <h5 class="card-title">Datos de Usuarios</h5>
        
        <!-- Consulta para obtener los datos de los usuarios -->
        <sql:query var="result" scope="request" dataSource="${conexionSI}">
            SELECT id, tipo_de_documento, nombres, apellidos, genero, telefono, rol_1, rol_2, email, estado 
            FROM usuarios;
        </sql:query>
        
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>Cédula</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Género</th>
                        <th>Teléfono</th>
                        <th>Rol 1</th>
                        <th>Rol 2</th>
                        <th>Email</th>
                        <th>Estado</th>
                        <th colspan="2">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="fila" items="${result.rows}">
                        <tr>
                            <td><c:out value="${fila.id}" /></td>
                            <td><c:out value="${fila.nombres}" /></td>
                            <td><c:out value="${fila.apellidos}" /></td>
                            <td><c:out value="${fila.genero}" /></td>
                            <td><c:out value="${fila.telefono}" /></td>
                            <td><c:out value="${fila.rol_1}" /></td>
                            <td><c:out value="${fila.rol_2}" /></td>
                            <td><c:out value="${fila.email}" /></td>
                            <td><c:out value="${fila.estado}" /></td>
                            <td>
                                <a href="dltUser.jsp?id=${fila.id}" class="btn btn-danger btn-sm">Eliminar</a>
                            </td>
                            <td>
                                <a href="editUser.jsp?id=${fila.id}" class="btn   btn-primary btn-sm">Editar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div >
        
        <a href="addUser.jsp" class="btn buton">Nuevo Usuario</a>
    </div>

    
</main>
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

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitterbootstrap/4.6.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
        function showAlert(message) {
            alert(message);
        }
    </script>
</body>
</html>
