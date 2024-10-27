<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="../WEB-INF/jspf/conexion.jspf" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Procesar Calificación</title>
</head>
<body>


    <!-- Fetch director's ID using email from session -->
    <sql:query var="directorResult" dataSource="${conexionSI}">
        SELECT id FROM usuarios WHERE email = ?
        <sql:param value="${sessionScope.email}" />
    </sql:query>
    <c:set var="directorId" value="${directorResult.rows[0].id}" scope="session" />

    <c:catch var="exception">
        <sql:transaction dataSource="${conexionSI}">
            <!-- Fetch student IDs from proyecto table -->
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
                <sql:param value="${directorId}" />
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
                , id_director=?
                WHERE id = ?
                <sql:param value="${newCalificacionId.rows[0].id}" />
                <sql:param value="${directorId}" />
                <sql:param value="${param.id_proyecto}" />
            </sql:update>
        </sql:transaction>
        
        <c:redirect url="index.jsp">
            <c:param name="mensaje" value="Calificación registrada y proyecto actualizado exitosamente." />
        </c:redirect>
    </c:catch>
    
    <c:if test="${not empty exception}">
        <c:redirect url="index.jsp">
            <c:param name="error" value="Error al procesar la calificación: ${exception.message}" />
        </c:redirect>
    </c:if>
</body>
</html>
