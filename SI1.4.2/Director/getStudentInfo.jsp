<%@ page language="java" contentType="application/json; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.json.*" %>

<%
    String idEstudiante1 = request.getParameter("idEstudiante1");
    String idEstudiante2 = request.getParameter("idEstudiante2");
    List<JSONObject> students = new ArrayList<>();

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        // Establece la conexión a la base de datos
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tu_base_de_datos", "tu_usuario", "tu_contraseña");

        String sql = "SELECT tipo_de_documento, nombres, apellidos, genero, telefono, email FROM estudiantes WHERE id IN (?, ?)";
        ps = conn.prepareStatement(sql);
        ps.setString(1, idEstudiante1);
        ps.setString(2, idEstudiante2);
        rs = ps.executeQuery();

        while (rs.next()) {
            JSONObject student = new JSONObject();
            student.put("tipo_de_documento", rs.getString("tipo_de_documento"));
            student.put("nombres", rs.getString("nombres"));
            student.put("apellidos", rs.getString("apellidos"));
            student.put("genero", rs.getString("genero"));
            student.put("telefono", rs.getString("telefono"));
            student.put("email", rs.getString("email"));
            students.add(student);
        }

        response.getWriter().write(new JSONArray(students).toString());
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
