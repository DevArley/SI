<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="../WEB-INF/jspf/conexion.jspf" %>

<sql:query var="projectQuery" dataSource="${conexionSI}">
    SELECT id_director, id_evaluador, estado_evaluador, estado_director
    FROM proyecto
    WHERE id = ?
    <sql:param value="${param.id}" />
</sql:query>

<c:if test="${projectQuery.rowCount > 0}">
    <c:set var="project" value="${projectQuery.rows[0]}" />
    
    <sql:query var="evaluadorQuery" dataSource="${conexionSI}">
        SELECT nombres, apellidos, email
        FROM usuarios
        WHERE id = ?
        <sql:param value="${project.id_evaluador}" />
    </sql:query>

    <sql:query var="directorQuery" dataSource="${conexionSI}">
        SELECT nombres, apellidos, email
        FROM usuarios
        WHERE id = ?
        <sql:param value="${project.id_director}" />
    </sql:query>

    <c:if test="${evaluadorQuery.rowCount > 0 && directorQuery.rowCount > 0}">
        <c:set var="evaluador" value="${evaluadorQuery.rows[0]}" />
        <c:set var="director" value="${directorQuery.rows[0]}" />

        <h4>Información del Evaluador</h4>
        <p><strong>Nombre:</strong> ${evaluador.nombres} ${evaluador.apellidos}</p>
        <p><strong>Email:</strong> ${evaluador.email}</p>
        <p><strong>Estado del proyecto (Evaluador):</strong> ${project.estado_evaluador}</p>

        <hr>

        <h4>Información del Director</h4>
        <p><strong>Nombre:</strong> ${director.nombres} ${director.apellidos}</p>
        <p><strong>Email:</strong> ${director.email}</p>
        <p><strong>Estado del proyecto (Director):</strong> ${project.estado_director}</p>
    </c:if>
</c:if>