package com.educacionit.jse.integrador.repositories.interfaces;

import com.educacionit.jse.integrador.entidades.Producto;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public interface I_ProductoRepository {
    void save(Producto p);
    void remove(Producto p);
    void update(Producto p);
    default Producto getById(int id){
        return getAll()
                .stream()
                .filter(c->c.getId()==id)
                .findAny()
                .orElse(new Producto());
    } 
    List<Producto>getAll();
    default List<Producto>getLikeDescripcion(String descripcion){
        if(descripcion==null) return new ArrayList<Producto>();
        return getAll()
                .stream()
                .filter(p->p.getDescripcion().toLowerCase().contains(descripcion.toLowerCase()))
                .collect(Collectors.toList());
    }
    default List<Producto>getLikePrecioAndDescripcion(Double precio, String descripcion){
        if(precio ==null || descripcion==null) return new ArrayList<Producto>();
        return getAll()
                .stream()
                .filter(p->p.getPrecio()==precio)
                .filter(p->p.getDescripcion().toLowerCase().contains(descripcion.toLowerCase()))
                .collect(Collectors.toList());
    }
}