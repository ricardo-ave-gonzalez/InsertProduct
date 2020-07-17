<%-- 
    Document   : ingresar
    Created on : 21/06/2020, 03:20:38 AM
    Author     : Ricardo
--%>
<%@page import="com.educacionit.jse.integrador.utils.html.HtmlTable"%>
<%@page import="com.educacionit.jse.integrador.repositories.jdbc.ProductoRepository"%>
<%@page import="com.educacionit.jse.integrador.repositories.interfaces.I_ProductoRepository"%>
<%@page import="com.educacionit.jse.integrador.connector.AdministradorDeConexiones"%>
<%I_ProductoRepository pr = new ProductoRepository(AdministradorDeConexiones.getConnection());%>
<%@page import="com.educacionit.jse.integrador.entidades.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresar Productos</title>
    </head>
    <body>
        <h1>Ingrese un Producto</h1>
        <hr>
        <form>
            <table>
                <tr>
                    <td>Precio: </td>
                    <td><input name="precio"/></td>
                </tr>
                <tr>
                    <td>Descripcion: </td>
                    <td><input type="text" name="descripcion"/></td>
                </tr>
                <tr>
                    <td>Ingresar: </td>
                    <td><input type="submit" value="Agregar"/></td>
                </tr>
                <tr>
                    <td><input type="reset" value="Borrar"/></td>
                    <td><input type="submit" value="Agregar"/></td>
                </tr>
            </table>
        </form>
        <hr>
        <%
            try {
                Double precio = Double.valueOf(request.getParameter("precio"));
                String descripcion = request.getParameter("descripcion");
                if (precio != null && descripcion != null && descripcion.length() >= 3) {
                    Producto p = new Producto(precio, descripcion);
                    pr.save(p);
                    out.println("<h3>Se ingreso un curso id: " + p.getId() + "</h3>");
                } else {
                    out.println("<h3>Falta completar parametros</h3>");
                }
            } catch (Exception e) {
                out.println("<h3>Falta completar parametros</h3>");
            }


        %>
        <form>
            Buscar Descripcion:
            <input type="text" name="buscarDesc"/>
            <input type="submit" value="Buscar"/>
        </form>   
        <%            
            //out.print(new HtmlTable<Producto>().getTable(pr.getAll()));
         
            String buscarDesc = request.getParameter("buscarDesc");
            if (buscarDesc == null)
                out.print(new HtmlTable<Producto>().getTable(pr.getAll(), "ProductoRemove.jsp", "ProductoUpdate.jsp"));
            else
                out.println(new HtmlTable<Producto>()
                        .getTable(
                                pr.getLikeDescripcion(buscarDesc), "ProductoRemove.jsp", "ProductoUpdate.jsp"));
        %>    
    </body>
</html>
