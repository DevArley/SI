<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="../WEB-INF/jspf/conexion.jspf" %>

<c:if test="${not empty param.id_proyecto and not empty param.estado_director}">
    <sql:update scope="request" dataSource="${conexionSI}">
        UPDATE proyecto SET estado_director = ? WHERE id = ?
        <sql:param value="${param.estado_director}" />
        <sql:param value="${param.id_proyecto}" />
    </sql:update>
    <c:redirect url="aproProye.jsp?status=success" />
        
       
</c:if>
