<%-- 
    Document   : ProductoUpdate
    Created on : 13/07/2020, 01:17:32 PM
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
        <title>Update Productos</title>
    </head>
    <body>
        <h1>Update Productos</h1>
        <% Producto producto = pr.getById(Integer.parseInt(request.getParameter("id")));%>
        <table>
            <form action="ProductoUpdate2.jsp"> 
                <tr>
                    <td>Id:</td>
                    <td><input type="text" name="id" value="<% out.print(producto.getId());%>"/></td>
                </tr>
                <tr>
                    <td>Precio:</td>
                    <td><input type="number" name="precio" value="<% out.print(producto.getPrecio());%>"/></td>
                </tr>
                <tr>
                    <td>Descripcion:</td>
                    <td><input type="text" name="descripcion" value="<% out.print(producto.getDescripcion());%>"/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Modificar"/></td>
                    <td></td>
                </tr>
            </form>
                <form action="ingresar.jsp">
                    <input type="submit" value="volver"/>
                </form>    
        </table>
    </body>
</html>
