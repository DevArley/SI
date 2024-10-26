<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    session.invalidate();  // Invalida la sesión actual
    response.sendRedirect("../index.jsp");  // Redirige a la página de inicio de sesión o index
%>
