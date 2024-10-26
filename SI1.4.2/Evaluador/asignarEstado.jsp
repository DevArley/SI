<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="../WEB-INF/jspf/conexion.jspf" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Asignar Estado</title>
</head>
<body>
    <c:if test="${not empty param.id_proyecto and not empty param.estado_evaluador}">
        <sql:update dataSource="${conexionSI}">
            UPDATE proyecto 
            SET estado_evaluador = ?
                
            WHERE id = ?
            <sql:param value="${param.estado_evaluador}" />
            <sql:param value="${param.id_proyecto}" />
        </sql:update>
        
        <c:set var="mensaje" value="Estado del proyecto actualizado correctamente." />
    </c:if>

    <c:if test="${empty param.id_proyecto or empty param.estado_evaluador}">
        <c:set var="mensaje" value="Error: Faltan parámetros necesarios para actualizar el estado del proyecto." />
    </c:if>

    <script>
        alert("${mensaje}");
        window.location.href = "index.jsp"; // Redirect back to the evaluator page
    </script>
</body>
</html>