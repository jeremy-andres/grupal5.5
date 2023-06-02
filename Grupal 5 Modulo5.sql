// #1
create database grupal555;
use grupal555;

create user 'admin5555'@'localhost'
identified by '1234567';

grant all privileges on grupal55.* to 'admin5555'@'localhost';

// #2
create table usuario(
	id_usuario int not null auto_increment,
    nombre varchar(20),
    apellido varchar(20),
    contraseña varchar (10),
    zona_horaria varchar(10) default 'UTC-3',
    genero varchar(10),
    telefono_contacto varchar(10),
    
    primary key (id_usuario)
);

create table ingreso_usuario(
	id_ingreso int not null auto_increment,
    id_usuario int,
	fecha_hora_ingreso datetime default now(),
    foreign key(id_usuario) references usuario(id_usuario),

    primary key (id_ingreso)
);

// #3
alter table grupal555.usuario
alter column zona_horaria set default 'UTC-2';

// #4
insert into usuario(nombre, apellido, contraseña, zona_horaria, genero, telefono_contacto)
values
	("Juan", "Pérez", "contra123", "GMT-5", "M", "1234567890"),
	("María", "García", "seguro456", "GMT+1", "F", "9876543210"),
	("Miguel", "Rodríguez", "p@55w0rd", "GMT-8", "M", "4567890123"),
	("Sofía", "Martínez", "secreto789", "GMT-3", "F", "3210987654"),
	("David", "Fernández", "123abc", "GMT+2", "M", "5678901234"),
	("Olivia", "Torres", "qwerty321", "GMT-6", "F", "8901234567"),
	("Daniel", "Gómez", "contra123", "GMT-4", "M", "2345678901"),
	("Ava", "Thomas", "seguro123", "GMT+3", "F", "6789012345");
	
insert into ingreso_usuario( id_usuario, fecha_hora_ingreso)
values
 (1, "2023-01-01"),
 (2, "2023-02-15"),
 (3, "2023-03-10"),
 (4, "2023-04-05"),
 (5, "2023-05-20"),
 (6, "2023-06-12"),
 (7, "2023-07-08"),
 (8, "2023-08-25");

//#5

//#6
create table contactos(
	id_contacto int not null auto_increment,
    id_usuario int,
    numero_telefono varchar(10),
    correo_electronico varchar(25),
    foreign key(id_usuario) references usuario(id_usuario),
    
    primary key (id_contacto)
);

//#7
UPDATE contactos
SET numero_telefono = (
    SELECT telefono_contacto
    FROM usuario
    WHERE usuario.id_usuario = contactos.id_usuario
);
