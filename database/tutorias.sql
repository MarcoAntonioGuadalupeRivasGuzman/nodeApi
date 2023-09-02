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

create table persona (
    idpersona int auto_increment primary key,
    nombres varchar(256),
    apellidop varchar(256),
    apellidom varchar(256),
    codigo varchar(12),
    correoinstitucional varchar(256),
    fkidunidadacademica int,
    constraint `fkidunidadacademica`
        foreign key (fkidunidadacademica) references unidadacademica (idunidadacademica)
        on delete cascade
        on update cascade
);

create table materia (
    idmateria int auto_increment primary key,
    nombremateria varchar(256),
    grupo varchar(10),
    semestre varchar(10),
    turno varchar(10),
    fkidcarrera int,
    constraint `fkidcarrera`
        foreign key (fkidcarrera) references carrera (idcarrera)
        on delete cascade
        on update cascade
);

create table alumno (
    idalumno int auto_increment primary key,
    semestre int,
    tipo varchar(10),
    fkidpersona int,
    fkidcarrera int,
    constraint `fkidpersona`
        foreign key (fkidpersona) references persona (idpersona),
        foreign key (fkidcarrera) references carrera (idcarrera)
        on delete cascade
        on update cascade
);

create table docente (
    iddocente int auto_increment primary key,
    fkidpersona int, 
    fkidcarrera int,
    constraint `fkiddocente`
        foreign key (fkidpersona) references persona (idpersona),
        foreign key (fkidcarrera) references carrera (idcarrera)
        on delete cascade
        on update cascade
);