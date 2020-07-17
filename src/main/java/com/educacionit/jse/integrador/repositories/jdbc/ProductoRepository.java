package com.educacionit.jse.integrador.repositories.jdbc;

import com.educacionit.jse.integrador.entidades.Producto;
import com.educacionit.jse.integrador.repositories.interfaces.I_ProductoRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ricardo
 */
public class ProductoRepository implements I_ProductoRepository{
    private Connection conn;

    public ProductoRepository(Connection conn) {
        this.conn = conn;
    }

    @Override
    public void save(Producto p){
        if(p==null) return;
        try (PreparedStatement ps=conn.prepareStatement(
            "insert into productos (precio,descripcion) values(?,?)",
            PreparedStatement.RETURN_GENERATED_KEYS
        )){
            ps.setDouble(1, p.getPrecio());
            ps.setString(2, p.getDescripcion());
            ps.execute();
            ResultSet rs=ps.getGeneratedKeys();
            if(rs.next()) p.setId(rs.getInt(1));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

 
    @Override
    public void update(Producto p) {
        if(p==null) return;
        try (PreparedStatement ps=conn.prepareStatement(
                "update productos set precio=?, descripcion=? where id=?"
        )){
            ps.setDouble(1, p.getPrecio());
            ps.setString(2, p.getDescripcion());
            ps.setInt(3, p.getId());
            ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Producto> getAll() {
       List<Producto>list=new ArrayList();
        try (ResultSet rs=conn.createStatement().executeQuery("select * from productos")){
            while(rs.next()){
                list.add(new Producto(
                    rs.getInt("id"),
                    rs.getDouble("precio"),
                    rs.getString("descripcion")
                    ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void remove(Producto p) {
        //delete from cursos where id=producto.getId
        if(p==null) return;
        try (PreparedStatement ps=conn.prepareStatement("delete from productos where id=?")){
            ps.setInt(1, p.getId());
            ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
