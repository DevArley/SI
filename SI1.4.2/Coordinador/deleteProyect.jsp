<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="../WEB-INF/jspf/conexion.jspf" %>

<sql:query var="checkProject" dataSource="${conexionSI}">
    SELECT * as count FROM proyecto WHERE id = ?
    <sql:param value="${param.id}" />
</sql:query>

<c:choose>
    <c:when test="${checkProject.rows[0].count > 0}">
        <sql:update dataSource="${conexionSI}">
            DELETE FROM proyecto WHERE id = ?
            <sql:param value="${param.id}" />
        </sql:update>
        success
    </c:when>
    <c:otherwise>
        not_found
    </c:otherwise>
</c:choose>