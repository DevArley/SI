<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="../WEB-INF/jspf/conexion.jspf" %>

<c:set var="username" value="${param.username}" />
<c:set var="password" value="${param.password}" />

<c:if test="${not empty username and not empty password}">
    <sql:query dataSource="${conexionSI}" var="result">
        SELECT * FROM administrador WHERE usuario = ? AND passwd = ?
        <sql:param value="${username}" />
        <sql:param value="${password}" />
    </sql:query>
    
    <c:choose>
        <c:when test="${result.rowCount > 0}">
            <c:set var="admin_username" value="${username}" scope="session" />
            <c:redirect url="indexadmin.jsp" />
        </c:when>
        <c:otherwise>
            <c:redirect url="loginadmin.jsp">
                <c:param name="error" value="1" />
            </c:redirect>
        </c:otherwise>
    </c:choose>
</c:if>

<c:if test="${empty username or empty password}">
    <c:redirect url="loginadmin.jsp" />
</c:if>