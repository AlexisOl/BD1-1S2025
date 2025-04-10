
create database if not exists  clase4;
use clase4;

create table zona(
    id int primary key not null auto_increment,
    tipo varchar(50)
  );


create table tipoAsentamiento(
        id int primary key not null auto_increment,
        nombre varchar(50)
);

create table estado(
        id int primary key not null auto_increment,
        nombre varchar(50)
);

create table municipio (
        id int primary key not null auto_increment,
        nombre varchar(50),
        idEstado int not null,
        foreign key (idEstado) references estado(id)
    );

create table ciudad (
        id int primary key not null auto_increment, 
        nombre varchar(50),
        id_municipio int not null,
        foreign key (id_municipio) references municipio(id)
    );

create table  asentamiento (
        id int primary key not null auto_increment, 
        nombre varchar(50),
        id_ciudad int not null,
        id_tipo_asentamiento int not null,
        foreign key (id_ciudad) references ciudad(id),
        foreign key (id_tipo_asentamiento) references tipoAsentamiento(id)

    );

create table oficina (
        id int primary key not null auto_increment, 
        idEstado int not null,
        foreign key (idEstado) references estado(id)

    );

create table    oficiaAsentamiento(
        id int primary key not null auto_increment,
        idOficina int not null,
        idAsentamiento int not null,
        foreign key (idOficina) references oficina(id),
        foreign key (idAsentamiento) references asentamiento(id)
);

create table    departamentalCodigoPostal(
        id int primary key not null auto_increment,
        id_d_cp int not null,
        id_oficina int not null,
        foreign key (id_oficina) references oficina(id)
    );

create table codigoPostal(
        id int primary key not null auto_increment ,
        codigo int,
        id_oficinaAsentamiento int,
        id_zona int,
        foreign key (id_zona) references zona(id),
        foreign key (id_oficinaAsentamiento) references oficiaAsentamiento(id)
    );
    



 create table  clientes(
        cui int primary key not null, 
        nombre varchar(200),
        direccion varchar(254)
 );
       

create table    TelefonosClientes(
        id int primary key not null auto_increment, 
        telefono bigint,
        cui int not null,
        foreign key (cui) references clientes(cui)
);

create table  pedidos (
        id int primary key not null auto_increment, 
        fecha date ,
        costo decimal
    
);
create table  pedidosRemitente (
        id int primary key not null auto_increment, 
        personaRemitente int not null,
        idPedido int not null,
        foreign key (personaRemitente) references clientes(cui),
        foreign key (idPedido) references pedidos(id)
);

create table  pedidosReceptor (
        id int primary key not null auto_increment, 
        idPedido int not null,
        personaReceptor int not null,
        foreign key (idPedido) references pedidos(id),
        foreign key (personaReceptor) references clientes(cui)
);