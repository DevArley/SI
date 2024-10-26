<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="../WEB-INF/jspf/conexion.jspf" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema Universitario - Modificar Usuario</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitterbootstrap/4.6.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fontawesome/5.15.4/css/all.min.css">
    <%-- <link rel="stylesheet" href="../assets/css/style.css"> --%>
        <link rel="stylesheet" href="../assets/css/editaadmin.css">

        <title>Gestión del Sistema</title>
</head>

        
<body >

   
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

   
        <div class="container">
            <div class="card"style="background-color: rgb(255, 255, 255);">
                <div class="content">
                    <h1 class="heading">Actualizar Usuario</h1>
                    
                    <c:if test="${param.modifica == null}">
                        <sql:query var="usuario" dataSource="${conexionSI}">
                            SELECT * FROM usuarios WHERE id = ?;
                            <sql:param value="${param.id}" />
                        </sql:query>
                        
                        <div class="form-group">
                            <form class="needs-validation" method="post">
                                <table>
                                    <c:forEach var="item" items="${usuario.rows}">
                                        <input type="hidden" name="id" value="${item.id}" />
                                        
                                        <tr>
                                            <td>Tipo de Documento:</td>
                                            <td>
                                                <select name="tipo_de_documento" required>
                                                    <option value="${item.tipo_de_documento}">${item.tipo_de_documento}</option>
                                                    <option value="CC">Cédula de Ciudadanía</option>
                                                    <option value="CE">Cédula de Extranjería</option>
                                                    <option value="TI">Tarjeta de Identidad</option>
                                                    <option value="Pasaporte">Pasaporte</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Nombres:</td>
                                            <td><input type="text" name="nombres" value="${item.nombres}" required /></td>
                                        </tr>
                                        <tr>
                                            <td>Apellidos:</td>
                                            <td><input type="text" name="apellidos" value="${item.apellidos}" required /></td>
                                        </tr>
                                        <tr>
                                            <td>Género:</td>
                                            <td>
                                                <select name="genero" required>
                                                    <option value="${item.genero}">${item.genero}</option>
                                                    <option value="Masculino">Masculino</option>
                                                    <option value="Femenino">Femenino</option>
                                                    <option value="Otro">Otro</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Teléfono:</td>
                                            <td><input type="text" name="telefono" value="${item.telefono}" required /></td>
                                        </tr>
                                        <tr>
                                            <td>Email:</td>
                                            <td><input type="email" name="email" value="${item.email}" required /></td>
                                        </tr>
                                        <tr>
                                            <td>Estado:</td>
                                            <td>
                                                <select name="estado" required>
                                                    <option value="${item.estado}">${item.estado}</option>
                                                    <option value="Activo">Activo</option>
                                                    <option value="Inactivo">Inactivo</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                                
                                <div style="text-align: center; margin-top: 2rem;">
                                    <input type="submit" class="btn btn-success" value="Actualizar" />
                                    <input type="hidden" name="modifica" value="ST" />
                                    <a href="indexadmin.jsp" class="btn btn-primary">Volver</a>
                                </div>
                            </form>
                        </div>
                    </c:if>

                    <c:if test="${param.modifica != null}">
                        <sql:update var="result" dataSource="${conexionSI}">
                            UPDATE usuarios
                            SET 
                                tipo_de_documento = '${param.tipo_de_documento}',
                                nombres = '${param.nombres}',
                                apellidos = '${param.apellidos}',
                                genero = '${param.genero}',
                                telefono = '${param.telefono}',
                                email = '${param.email}',
                                estado = '${param.estado}'
                            WHERE id = '${param.id}';
                        </sql:update>

                        <div style="text-align: center; padding: 2rem;">
                            <c:if test="${result == 1}">
                                <p class="para">¡Registro actualizado satisfactoriamente!</p>
                            </c:if>
                            <c:if test="${result != 1}">
                                <p class="para" style="color: #dc3545;">Error al actualizar el registro.</p>
                            </c:if>
                            <a href="indexadmin.jsp" class="btn btn-primary">Volver</a>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>



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
</body>
</html>
