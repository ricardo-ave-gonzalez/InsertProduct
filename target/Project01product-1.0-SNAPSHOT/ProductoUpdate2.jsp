<%-- 
    Document   : ProductoUpdate2
    Created on : 13/07/2020, 03:48:04 PM
    Author     : admin
--%>
<%@page import="com.educacionit.jse.integrador.repositories.jdbc.ProductoRepository"%>
<%@page import="com.educacionit.jse.integrador.connector.AdministradorDeConexiones"%>
<%@page import="com.educacionit.jse.integrador.repositories.interfaces.I_ProductoRepository"%>
<%I_ProductoRepository pr = new ProductoRepository(AdministradorDeConexiones.getConnection());%>
<%@page import="com.educacionit.jse.integrador.entidades.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Productos</title>
    </head>
    <body>
        <h1>Update Productos</h1>
        <%
            Producto p = new Producto(
                    Integer.parseInt(request.getParameter("id")),
                    Double.parseDouble(request.getParameter("precio")),
                    request.getParameter("descripcion"));
            pr.update(p);
        %>
        <h3>Se actualizo un Producto!</h3>
        <form action="ingresar.jsp">
            <input type="submit" value="Volver"/>
        </form>
    </body>
</html>
