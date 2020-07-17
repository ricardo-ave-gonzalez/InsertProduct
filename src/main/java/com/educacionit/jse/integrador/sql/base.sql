drop database if exists cafe;
create database cafe;
use cafe;
drop table if exists productos;
create table productos(
    id int auto_increment primary key,
    precio double null,
    descripcion varchar(45) null
    );