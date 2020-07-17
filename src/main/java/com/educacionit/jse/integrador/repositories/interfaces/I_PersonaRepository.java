package com.educacionit.jse.integrador.repositories.interfaces;



import com.educacionit.jse.integrador.entidades.Persona;
import java.util.List;
import java.util.stream.Collectors;
public interface I_PersonaRepository {
    void add(Persona persona);
    void remove(Persona persona);
    List<Persona>getAll();
    default List<Persona>getByApellido(String apellido){
        return getAll()
                .stream()
                .filter(p->p.getApellido().equalsIgnoreCase(apellido))
                .collect(Collectors.toList());
    }
    default List<Persona>getLikeApellido(String apellido){
        return getAll()
                .stream()
                .filter(p->p.getApellido().toLowerCase().contains(apellido.toLowerCase()))
                .collect(Collectors.toList());
    }
    default List<Persona>getLikeApellidoAndNombre(String apellido,String nombre){
        return getAll()
                .stream()
                .filter(p->p.getApellido().toLowerCase().contains(apellido.toLowerCase())
                        && p.getNombre().toLowerCase().contains(nombre.toLowerCase()))
                .collect(Collectors.toList());
    }
    default List<Persona>getLikeApellidoOrNombre(String apellido,String nombre){
        return getAll()
                .stream()
                .filter(p->p.getApellido().toLowerCase().contains(apellido.toLowerCase())
                        || p.getNombre().toLowerCase().contains(nombre.toLowerCase()))
                .collect(Collectors.toList());
    }
}
