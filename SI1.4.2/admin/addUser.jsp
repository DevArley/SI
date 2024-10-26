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
        <link rel="stylesheet" href="../assets/css/styleadminuser.css">


        <title>Gestión del Sistema</title>
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
    
    <div class="cont">
  <div class="containers">
        <c:if test="${param.nombres == null}">
            <form class="cards needs-validation" method="post">
                <div class="card-bodys" style="background-color: rgb(255, 255, 255);">
                    <h4 class="card-title text-center">Datos del Usuario</h4>
                    <div class="form-group"style="color: rgb(0, 0, 0);">
                        <label for="nombres">Nombres:</label>
                        <input type="text" class="form-control" name="nombres" style="color: rgb(0, 0, 0);" required />
                    </div>
                    <div class="form-group"style="color: rgb(0, 0, 0);">
                        <label for="apellidos">Apellidos:</label>
                        <input type="text" class="form-control" name="apellidos" style="color: rgb(0, 0, 0);" required />
                    </div>
                    <div class="form-group"style="color: rgb(0, 0, 0);">
                        <label for="tipo_de_documento">Tipo de Documento:</label>
                        <select name="tipo_de_documento" class="form-control" style="color: rgb(0, 0, 0);" required>
                            <option value="CC">Cédula de Ciudadanía</option>
                            <option value="CE">Cédula de Extranjería</option>
                            <option value="TI">Tarjeta de Identidad</option>
                            <option value="Pasaporte">Pasaporte</option>
                        </select>
                    </div>
                    <div class="form-group"style="color: rgb(0, 0, 0);">
                        <label for="id">Número de Documento:</label>
                        <input type="text" class="form-control" name="id" required style="color: rgb(0, 0, 0);"/>
                    </div>
                    <div class="form-group" style="color: rgb(0, 0, 0);">
                        <label for="genero">Género:</label>
                        <select name="genero" class="form-control" required>
                            <option value="">-- Seleccione Género --</option>
                            <option value="Masculino">Masculino</option>
                            <option value="Femenino">Femenino</option>
                            <option value="Otro">Otro</option>
                        </select>
                    </div>
                    <div class="form-group"style="color: rgb(0, 0, 0);">
                        <label for="telefono">Teléfono:</label>
                        <input type="text" class="form-control" name="telefono" required style="color: rgb(0, 0, 0);" />
                    </div>
                    <div class="form-group"style="color: rgb(0, 0, 0);">
                        <label for="rol_1">Rol 1:</label>
                        <select name="rol_1" class="form-control" required>
                            <option value="">-- Seleccione Rol --</option>
                            <option value="Coordinador">Coordinador</option>
                            <option value="Director">Director</option>
                            <option value="Evaluador">Evaluador</option>
                            <option value="Estudiante">Estudiante</option>
                        </select>
                    </div>
                    <div class="form-group"style="color: rgb(0, 0, 0);">
                        <label for="rol_2">Rol 2:</label>
                        <select name="rol_2" class="form-control">
                            <option value="Ninguno">Ninguno</option>
                            <option value="Coordinador">Coordinador</option>
                            <option value="Director">Director</option>
                            <option value="Evaluador">Evaluador</option>
                            <option value="Estudiante">Estudiante</option>
                        </select>
                    </div>
                    <div class="form-group"style="color: rgb(0, 0, 0);">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" name="email" required style="color: rgb(0, 0, 0);"/>
                    </div>
                    <div class="form-group"style="color: rgb(0, 0, 0);">
                        <label for="passwd">Contraseña:</label>
                        <input type="password" class="form-control" name="passwd" required style="color: rgb(0, 0, 0);"/>
                    </div>
                    <div class="form-group"style="color: rgb(0, 0, 0);">
                        <label for="estado">Estado:</label>
                        <select name="estado" class="form-control" required>
                            <option value="Activo">Activo</option>
                            <option value="Inactivo">Inactivo</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-success">Crear Usuario</button>
                </div>
                        <a href="indexadmin.jsp" style="background-color: #007bff;" class="btn btn-primary back-button">Volver</a>

            </form>
        </c:if>

        <c:if test="${param.nombres != null}">
            <sql:update var="result" dataSource="${conexionSI}">
                INSERT INTO usuarios (id, tipo_de_documento, nombres, apellidos, genero, telefono, rol_1, rol_2, email, passwd, estado)
                VALUES (
                    '${param.id}', 
                    '${param.tipo_de_documento}', 
                    '${param.nombres}', 
                    '${param.apellidos}', 
                    '${param.genero}', 
                    '${param.telefono}', 
                    '${param.rol_1}', 
                    '${param.rol_2}', 
                    '${param.email}', 
                    '${param.passwd}', 
                    '${param.estado}'
                );
            </sql:update>

            <c:if test="${result >= 1}">
                <div class="alert alert-success text-center">
                    ¡Usuario creado satisfactoriamente!
                                            <a href="indexadmin.jsp" style="background-color: #007bff;" class="btn btn-primary back-button">Volver</a>

                </div>
            </c:if>
        </c:if>

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
