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

create table datospersonales (
    iddatos int auto_increment primary key,
    fechanacimiento date,
    celular varchar(15),
    direccion varchar(256),
    genero varchar(10),
    estadocivil varchar(256),
    numhijos int, 
    correopersonal varchar(256),
    telefonofamiliar varchar(15),
    actividadlaboral boolean,
    empresa varchar(256),
    horariotrabajo varchar(256),
    bachillerato varchar(256),
    fkidpersona int,
    constraint `fkiddatospersonales`
        foreign key (fkidpersona) references persona (idpersona)
        on delete cascade
        on update cascade
);

create table administrativo (
    idadministrativo int auto_increment primary key,
    fkidpersona int,
    constraint `fkidadministrativo`
        foreign key (fkidpersona) references persona (idpersona)
        on delete cascade
        on update cascade
);

create table calendarioescolar (
    idcalendario int auto_increment primary key,
    periodo varchar(256),
    coordinador varchar(256),
    inicio date,
    fin date,
    estatusactivo boolean,
    encargadoctrlescolar varchar(256),
    nombrecalendario varchar(256),
    fkidunidadacademica int,
    constraint `fkicalendario`
        foreign key (fkidunidadacademica) references unidadacademica (idunidadacademica)
        on delete cascade
        on update cascade
);

create table grupo (
    idgrupo int auto_increment primary key,
    fkiddocente int, 
    fkidmateria int,
    fkidcalendario int,
    constraint `fkidgrupo`
        foreign key (fkiddocente) references docente (iddocente),
        foreign key (fkidmateria) references materia (idmateria),
        foreign key (fkidcalendario) references calendarioescolar (idcalendario)
        on delete cascade
        on update cascade
);

create table fichamedica (
    idfichamedica int auto_increment primary key,
    tiposangre varchar(5),
    anteojos boolean,
    problemaauditivo boolean,
    protesis boolean,
    alergias boolean,
    enfermedadcronica boolean,
    tomamedicamento boolean,
    numsegurosocial varchar(20),
    vigenciasegurosocial date,
    clinicasegurosocial varchar(256),
    viviconpadres boolean,
    pareja boolean,
    estres boolean,
    fkidpersona int,
    constraint `fkidfichamedica`
        foreign key (fkidpersona) references persona (idpersona)
        on delete cascade
        on update cascade
);

create table alumnogrupo (
    idalumnogrupo int auto_increment primary key,
    fkidalumno int,
    fkidgrupo int,
    constraint `fkidalumnogrupo`
        foreign key (fkidalumno) references alumno (idalumno),
        foreign key (fkidgrupo) references grupo (idgrupo)
        on delete cascade
        on update cascade
);