<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="../../WEB-INF/jspf/conexion.jspf" %>

<%-- Fetch user ID based on email --%>
<sql:query var="userQuery" dataSource="${conexionSI}">
    SELECT id FROM usuarios WHERE email = ?
    <sql:param value="${sessionScope.email}" />
</sql:query>

<c:if test="${userQuery.rowCount > 0}">
    <c:set var="userId" value="${userQuery.rows[0].id}" scope="page" />
</c:if>

<%-- Check if we have both the project ID and the user ID --%>
<c:if test="${not empty param.proyectoId and not empty userId}">
    <%-- Check if id_estudiante1 is occupied --%>
    <sql:query var="projectQuery" dataSource="${conexionSI}">
        SELECT id_estudiante1, id_estudiante2 FROM proyecto WHERE id = ?
        <sql:param value="${param.proyectoId}" />
    </sql:query>

    <c:choose>
        <c:when test="${projectQuery.rows[0].id_estudiante1 == null}">
            <%-- Update id_estudiante1 if it's empty --%>
            <sql:update dataSource="${conexionSI}">
                UPDATE proyecto 
                SET id_estudiante1 = ?
                WHERE id = ?
                <sql:param value="${userId}" />
                <sql:param value="${param.proyectoId}" />
            </sql:update>
        </c:when>
        <c:when test="${projectQuery.rows[0].id_estudiante2 == null}">
            <%-- Update id_estudiante2 if id_estudiante1 is occupied and id_estudiante2 is empty --%>
            <sql:update dataSource="${conexionSI}">
                UPDATE proyecto 
                SET id_estudiante2 = ?
                WHERE id = ?
                <sql:param value="${userId}" />
                <sql:param value="${param.proyectoId}" />
            </sql:update>
        </c:when>
        <c:otherwise>
            <%-- Both slots are occupied --%>
            <c:redirect url="../index.jsp">
                <c:param name="mensaje" value="Error: El proyecto ya tiene dos estudiantes asignados" />
            </c:redirect>
        </c:otherwise>
    </c:choose>

    <c:redirect url="../index.jsp">
        <c:param name="mensaje" value="Proyecto agregado exitosamente" />
    </c:redirect>
</c:if>

<c:if test="${empty param.proyectoId or empty userId}">
    <c:redirect url="../index.jsp">
        <c:param name="mensaje" value="Error: Datos incompletos para agregar el proyecto" />
    </c:redirect>
</c:if>