<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="WEB-INF/jspf/conexion.jspf" %>

<%-- Lógica de autenticación --%>
<c:if test="${param.username != null && param.password != null}">
    <sql:query var="result" dataSource="${conexionSI}">
        SELECT * FROM usuarios WHERE email = ? AND passwd = ?
        <sql:param value="${param.username}" />
        <sql:param value="${param.password}" />
    </sql:query>
    
    <c:choose>
        <c:when test="${result.rowCount > 0}">
            <c:set var="user" value="${result.rows[0]}" />
            <c:set var="nombres" value="${user.nombres}" scope="session" />
            <c:set var="email" value="${user.email}" scope="session" />
            <c:set var="rol1" value="${user.rol_1}" />
            <c:set var="rol2" value="${user.rol_2}" />
            
            <c:choose>
                <c:when test="${rol1 eq 'Estudiante' && (empty rol2 || rol2 eq 'Ninguno')}">
                    <c:redirect url="/Estudiante/index.jsp" />
                </c:when>
                <c:when test="${rol1 eq 'Evaluador' && (empty rol2 || rol2 eq 'Ninguno')}">
                    <c:redirect url="/Evaluador/index.jsp" />
                </c:when>
                <c:when test="${rol1 eq 'Coordinador' && (empty rol2 || rol2 eq 'Ninguno')}">
                    <c:redirect url="/Coordinador/index.jsp" />
                </c:when>
                <c:when test="${rol1 eq 'Director' && (empty rol2 || rol2 eq 'Ninguno')}">
                    <c:redirect url="/Director/index.jsp" />
                </c:when>
                <c:when test="${not empty rol2 && rol2 ne 'Ninguno'}">
                    <c:set var="userRoles" value="${rol1},${rol2}" scope="session" />
                    <c:redirect url="index.jsp" />
                </c:when>
                <c:otherwise>
                    <c:set var="loginError" value="Rol no reconocido" />
                </c:otherwise>
            </c:choose>
        </c:when>
        <c:otherwise>
            <c:set var="loginError" value="Usuario o contraseña incorrectos" />
        </c:otherwise>
    </c:choose>
</c:if>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <title>Sistema de Gestión</title>
</head>
<body>
    <header>
        <div class="logo">
            <img class="border-primary" style="border-radius: 50%;" src="img/S (1).png" alt="ATENA Logo">
        </div>
    </header>

    <main>
        <div class="background-image">
            <!-- Background image of the building -->
        </div>
        
        <div class="content">
            <h1>Proyecto S.I</h1>
            <h2>Sistema de informes de gestión de proyectos</h2>
        </div>
        
        <div class="login-form">
            <h3>Accede a la plataforma</h3>
            <form action="" method="post">
                <div>
                    <label for="username">Nombre de usuario</label>
                    <br>
                    <input  class="info" type="email" id="username" name="username" placeholder="Email" required>
                </div>
                
                <div>
                    <label for="password">Contraseña</label>
                                        <br>

                    <input class="info" type="password" id="password" name="password" placeholder="Contraseña" required>
                </div>
                
                <div>
                    <button type="submit" class="btn ">Acceder</button>
                </div>
            </form>
            
            <c:if test="${not empty loginError}">
                <p style="color: red;">${loginError}</p>
            </c:if>
            
            <div class="alternative-login">
                <p>Ingrese como Administrador:</p>
                <a href="admin/loginadmin.jsp" class="btn ">Ingresar con su correo Administrador</a>
            </div>

        </div>
    </main>

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

    <c:if test="${not empty userRoles}">
        <script>
            $(document).ready(function(){
                $('#rolModal').modal('show');
            });
        </script>




        <!-- Modal -->
        <div class="modal fade" id="rolModal" tabindex="-1" role="dialog" aria-labelledby="rolModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="rolModalLabel">Selecciona tu rol</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <c:forEach items="${userRoles.split(',')}" var="rol">
                                <c:if test="${rol != 'Ninguno'}">
                                    <div class="col-md-6 mb-3">
                                        <div class="card">
                                            <div class="card-body">
                                                <h5 class="card-title">${rol}</h5>
                                                <a href="${rol}/index.jsp" class="btn btn-primary">Seleccionar ${rol}</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:if>

</body>
</html>
