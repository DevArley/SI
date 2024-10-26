<%@ include file="../WEB-INF/jspf/conexion.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<c:if test="${empty param.proyectoId}">
    <p>Error: El ID del proyecto es requerido.</p>
</c:if>

<c:if test="${not empty param.proyectoId}">
    <sql:query var="latestVersionQuery" dataSource="${conexionSI}">
        SELECT MAX(version_numero) AS max_version FROM versiones WHERE id_proyecto = ?
        <sql:param value="${param.proyectoId}" />
    </sql:query>

    <c:set var="nextVersionNumber" value="${latestVersionQuery.rows[0].max_version != null ? latestVersionQuery.rows[0].max_version + 1 : 1}" />

    <sql:transaction dataSource="${conexionSI}">
        <sql:update var="result">
            INSERT INTO versiones (id_proyecto, id_usuario, version_numero, url_version, fecha_subida, estado_version, comentario)
            VALUES (?, ?, ?, ?, NOW(), 'Pendiente', ?)
            <sql:param value="${param.proyectoId}" />
            <sql:param value="${sessionScope.userId}" /> 
            <sql:param value="${nextVersionNumber}" />
            <sql:param value="${param.url_version}" />
            <sql:param value="${param.comentario}" />
        </sql:update>

        <c:if test="${result != 0}">
            <script>
                window.location.href = 'subirDocumentos.jsp?status=success';

            </script>
        </c:if>
        <c:if test="${result == 0}">
            <script>
                window.location.href = 'subirDocumentos.jsp?status=error';

            </script>
        </c:if>
    </sql:transaction>
</c:if>
