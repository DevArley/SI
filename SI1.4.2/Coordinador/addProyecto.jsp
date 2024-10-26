<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="../WEB-INF/jspf/conexion.jspf" %>

<%-- Aquí manejarás la inserción del nuevo proyecto --%>
<c:if test="${not empty param.titulo}">
    <sql:update var="result" dataSource="${conexionSI}">
        INSERT INTO proyecto (titulo, descripcion, url, fecha_creacion, estado)
        VALUES (
            '${param.titulo}', 
            '${param.descripcion}', 
            '${param.url}', 
            NOW(), 
            '1' 
        );
    </sql:update>

    <c:if test="${result >= 1}">
<script>
                window.location.href = 'index.jsp?status=new';
            </script>   
</c:if>
<c:if test="${result < 1}">
        <%-- Inserción fallida, redirigir a formatosGrado.jsp con mensaje de error --%>
        <script>
            window.location.href = 'index.jsp?status=errornew';
        </script>
    </c:if>
</c:if>
<%-- Redirigir de vuelta a la página principal y mostrar mensaje --%>
<c:if test="${not empty successMessage}">
    <c:redirect url="index.jsp?message=${successMessage}" />
</c:if>
