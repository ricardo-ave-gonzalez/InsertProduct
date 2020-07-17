package com.educacionit.jse.integrador.test;

import com.educacionit.jse.integrador.connector.AdministradorDeConexiones;
import com.educacionit.jse.integrador.entidades.Producto;
import com.educacionit.jse.integrador.repositories.interfaces.I_ProductoRepository;
import com.educacionit.jse.integrador.repositories.jdbc.ProductoRepository;
//import com.educacionit.jse.integrador.repositories.interfaces.I_ProductoRepository;
//import com.educacionit.jse.integrador.repositories.jdbc.ProductoRepository;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;



public class RepositoryTest {

    /**
     *
     * @param args
     * @throws Exception
     */
    public static void main(String[] args) throws Exception{
       /* try (Connection conn=AdministradorDeConexiones.getConnection()){
            conn
                    .createStatement()
                    .execute(
                    "insert into productos (precio,descripcion)  values"
                    + "('25','Cafe molido')"
                    );
            
            String query="insert into productos (precio,descripcion) values"
                    + "('300','cafe en granos')";
            Statement st=conn.createStatement();
            st.execute(query);
            System.out.println("Esperando 10 segundos.");
            Thread.sleep(10000);
            ResultSet rs=conn.createStatement().executeQuery("select * from productos");
            while(rs.next()){
                System.out.println(
                        rs.getInt("id")+"\t"+
                        rs.getDouble("precio")+"\t"+
                        rs.getString("descripcion")
                );
            }
            System.out.println("Esperando 10 segundos.");
            Thread.sleep(10000);         
        } catch (Exception e) {
            e.printStackTrace();
        }*/

        //I_ProductoRepository pr=new ProductoRepository(AdministradorDeConexiones.getConnection());
        
        //Producto producto = new Producto(250,"cafe molido");
        //pr.save(producto);
        
        I_ProductoRepository pr= new ProductoRepository(AdministradorDeConexiones.getConnection());
        
        //pr.remove(pr.getById(13));
        Producto producto = pr.getById(6);
        producto.setDescripcion("Cafe molido y en grano");
        pr.update(producto);
        
        
        
        
    }      
}
