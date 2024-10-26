<%@ include file="../WEB-INF/jspf/conexion.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<c:if test="${empty param.titulo || empty param.url_formato}">
    <p>Error: Tanto el título como la URL del formato son requeridos.</p>
</c:if>

<c:if test="${not empty param.titulo && not empty param.url_formato}">
    <sql:transaction dataSource="${conexionSI}">
        <!-- Inserción del nuevo formato de grado -->
        <sql:update var="result">
            INSERT INTO formatos_grado (titulo, url_formato)
            VALUES (?, ?)
            <sql:param value="${param.titulo}" />
            <sql:param value="${param.url_formato}" />
        </sql:update>

        <!-- Notificación de éxito o error -->
        <c:if test="${result != 0}">
            <script>
                window.location.href = 'formatosGrado.jsp?status=success';
            </script>
        </c:if>
        <c:if test="${result == 0}">
            <script>
                window.location.href = 'formatosGrado.jsp?status=error';
            </script>
        </c:if>
    </sql:transaction>
</c:if>
