<%-- 
    Document   : ProductoRemove2
    Created on : 13/07/2020, 04:09:13 PM
    Author     : admin
--%>

<%@page import="com.educacionit.jse.integrador.repositories.jdbc.ProductoRepository"%>
<%@page import="com.educacionit.jse.integrador.connector.AdministradorDeConexiones"%>
<%@page import="com.educacionit.jse.integrador.repositories.interfaces.I_ProductoRepository"%>
<%I_ProductoRepository pr = new ProductoRepository(AdministradorDeConexiones.getConnection());%>
<%@page import="com.educacionit.jse.integrador.entidades.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Producto Remove</title>
    </head>
    <body>
        <h1>Producto Remove</h1>
        <%
            int id=Integer.parseInt(request.getParameter("id"));
            pr.remove(pr.getById(id));
            out.println("<h3>Se borro el Producto!</h3>");
        %>
        <form action="ingresar.jsp">
            <input type="submit" value="Volver"/>
        </form>
    </body>
</html>
