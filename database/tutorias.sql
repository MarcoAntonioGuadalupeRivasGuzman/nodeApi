create database tutorias;

use tutorias;

create table login (
	idlogin int auto_increment primary key,
	usuario varchar(256),
	nombre varchar(256),
	password varchar(256),
	tipo int,
	recovery varchar(256)
);

create table carrera(
    idcarrera int auto_increment primary key,
    nombrecarrera varchar(256),
    abreviartura varchar(5)
);

create table unidadacademica (
    idunidadacademica int auto_increment primary key,
    nombre varchar(256)
);

