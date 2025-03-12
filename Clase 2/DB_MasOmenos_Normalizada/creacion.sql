CREATE TABLE municipio(
 id int NOT null ,
 Etiqueta varchar(200) NOT NULL,
 PRIMARY KEY (id)
);
-- ya


-- tabla periodo departamento
CREATE TABLE departamento(
 id int NOT null ,
 Etiqueta varchar(200) NOT NULL,
 PRIMARY KEY (id)
);


-- tabla tipo ubicacion
CREATE TABLE tipoUbicacion(
 id int NOT null auto_increment ,
 descripcion varchar(200) NOT NULL,
 PRIMARY KEY (id)
);




-- tabla de ubicacion
CREATE table ubicacion(
id int not null auto_increment,
id_municipio int not null,
id_departamento  int not null,
id_tipoUbicacion int not null,
primary key(id),
FOREIGN KEY (id_municipio) REFERENCES municipio(id),
FOREIGN KEY (id_departamento) REFERENCES departamento(id),
FOREIGN KEY (id_tipoUbicacion) REFERENCES tipoUbicacion(id)
);





-- tabla de escuelas de espaniol
CREATE table escuelas(
id int not null auto_increment,
nombre varchar(150) not null,
direccion VARCHAR(3000) not null,
telefono varchar(150), 
correo varchar(500),
sitio_web  varchar(500),
id_ubicacion int not null,
primary key(id),
FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id)
);







CREATE table sede_inguat(
id int not null auto_increment,
dependencia varchar(150) not null,
direccion VARCHAR(3000) not null,
telefono varchar(150),
correo varchar(500),
horario_atencion  varchar(1000),
id_ubicacion int not null,
primary key(id),
FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id)


);




CREATE table trabajador(
id int not null auto_increment,
nombre varchar(150) not null,
telefono varchar(150), 
correo varchar(500),
id_sede int not null,
primary key(id),
FOREIGN KEY (id_sede) REFERENCES sede_inguat(id)
);





CREATE TABLE planMaestro(
 id int NOT null auto_increment, -- aca
 tipo varchar(200) NOT NULL,
 PRIMARY KEY (id)
);

CREATE TABLE estado(
 id int NOT null auto_increment, -- aca
 tipo varchar(200) NOT NULL,
 PRIMARY KEY (id)
);



CREATE TABLE convenio_coadmin(
 id int NOT null auto_increment ,
 tipo varchar(200) NOT NULL,
 PRIMARY KEY (id)
);


CREATE TABLE tipo_admin(
 id int NOT null auto_increment ,
 tipos varchar(200) NOT NULL,
 PRIMARY KEY (id)
);


CREATE table administradorAreas(
id int not null auto_increment,
administrador varchar(300) not null,
baseLegalPlanMaestro varchar(1500) ,-- se puede null
id_estado int ,  -- se puede null
id_tipoAdmin  int not null,
id_PlanMaestro int not null,
id_Convenio int , -- se puede null
primary key(id),
FOREIGN KEY (id_estado) REFERENCES estado(id),
FOREIGN KEY (id_tipoAdmin) REFERENCES tipo_admin(id),
FOREIGN KEY (id_PlanMaestro) REFERENCES planMaestro(id),
FOREIGN KEY (id_Convenio) REFERENCES convenio_coadmin(id)
);





CREATE TABLE categoriaArea(
 id int NOT null auto_increment ,
 nombre varchar(200) NOT NULL,
 tipo varchar(300) NOT NULL,
 PRIMARY KEY (id)
);


CREATE TABLE legalidadArea(
 id int NOT null auto_increment ,
 baselegal varchar(200) NOT NULL,
 anioDeclarado int NOT NULL,
 inscripcionJuridica varchar(1500),
 PRIMARY KEY (id)
);


CREATE table valorArea(
id int not null auto_increment,
valorUnitario varchar(150) not null,
totalSuma int,
totalGlobal varchar(500),
primary key(id)
);


CREATE table areasProtegidas(
id int not null auto_increment,
codigo  varchar(300) not null,
nombre varchar(350) not null,
region varchar(350) not null,
id_legalidad  int not null,
id_valorArea int not null,
id_categoria int not null,
id_administracion int not null,
id_ubicacion int not null,
primary key(id),
FOREIGN KEY (id_legalidad) REFERENCES legalidadArea(id),
FOREIGN KEY (id_valorArea) REFERENCES valorArea(id),
FOREIGN KEY (id_categoria) REFERENCES categoriaArea(id),
FOREIGN KEY (id_administracion) REFERENCES administradorAreas(id),
FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id)
);





CREATE TABLE clasificaion(
 id int NOT null auto_increment ,
 numero_estrellas varchar(200) NOT NULL,
 PRIMARY KEY (id)
);


CREATE table habitaciones(
id int not null auto_increment,
numero_habitaciones int not null,
plaza_cama int not null,
primary key(id)
);


CREATE table tarifas(
id int not null auto_increment,
tarifaSencilla int not null,
tarifaDoble int not null,
tarifaTriple int not null,
tarifaCamaAdicional int not null,
tarifaHabitacionMultiple int not null,
primary key(id)
);


CREATE table hotel(
id int not null auto_increment,
nombre varchar(350) not null,
direccion varchar(1500) not null,
telefono  varchar(150),
correo varchar(500), 
sitio_web  varchar(500),
id_tarifas int not null,
id_habitaciones int not null,
id_clasificacion int ,
id_ubicacion int not null,
primary key(id),
FOREIGN KEY (id_tarifas) REFERENCES tarifas(id),
FOREIGN KEY (id_habitaciones) REFERENCES habitaciones(id),
FOREIGN KEY (id_clasificacion) REFERENCES clasificaion(id),
FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id)
);



CREATE TABLE idiomas(
 id int NOT null auto_increment ,
 nombre varchar(200) NOT NULL,
 PRIMARY KEY (id)
);


CREATE table tipoGuia(
id int not null auto_increment,
tipo varchar(300) not null,
primary key(id)
);


CREATE table Guia(
id int not null auto_increment,
carnet int not null,
nombre varchar(350) not null,
telefono varchar(350), 
correo varchar(500),
especializado varchar(500),
id_tipo int not null,
id_ubicacion int not null,
primary key(id),
FOREIGN KEY (id_tipo) REFERENCES tipoGuia(id),
FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id)
);




CREATE table manejo_idiomas(
id int not null auto_increment,
id_guia int not null,
id_idoma int not null,
primary key(id),
FOREIGN KEY (id_guia) REFERENCES Guia(id),
FOREIGN KEY (id_idoma) REFERENCES idiomas(id)
);




CREATE TABLE otroIdioma(
 id int not null auto_increment,
 id_guia int not null,
 idioma varchar(100),
 primary key(id),
 FOREIGN KEY (id_guia) REFERENCES Guia(id)

);



CREATE table clasificaion_agencia(
id int not null auto_increment,
tipo varchar(300) not null,
primary key(id)
);


CREATE table agencia(
id int not null auto_increment,
nombre varchar(350) not null,
direccion varchar(1500) not null,
telefono  varchar(350), 
correo varchar(500),
sitio_web  varchar(500),
id_tipo int not null,
id_ubicacion int not null,
primary key(id),
FOREIGN KEY (id_tipo) REFERENCES clasificaion_agencia(id),
FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id)
);


CREATE table guia_asociado(
id int not null auto_increment,
id_guia int not null,
id_agencia int not null,
primary key(id),
FOREIGN KEY (id_guia) REFERENCES Guia(id),
FOREIGN KEY (id_agencia) REFERENCES agencia(id)
);




CREATE table viajeGuia(
id int not null auto_increment,
id_ubicacion int not null,
id_guia int not null,
fecha date not null,
primary key(id),
FOREIGN KEY (id_guia) REFERENCES Guia(id),
FOREIGN KEY (id_ubicacion) REFERENCES municipio(id)
);











CREATE table categoriaViaje(
id int not null auto_increment,
parada varchar(300) not null,
primary key(id)
);


CREATE table tipoTransporte(
id int not null auto_increment,
tipo varchar(300) not null,
primary key(id)
);






CREATE table transporte(
id int not null auto_increment,
nombre varchar(350) not null,
telefono  varchar(300),
correo varchar(500),
id_tipoTransporte int not null,
id_categoriaViaje int not null,
id_ubicacion int not null,
primary key(id),
FOREIGN KEY (id_tipoTransporte) REFERENCES tipoTransporte(id),
FOREIGN KEY (id_categoriaViaje) REFERENCES categoriaViaje(id),
FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id)
);


CREATE table viajes(
id int not null auto_increment,
ubicacionInicio int not null,
ubicacionFin int not null,
id_transporte int not null,
primary key(id),
FOREIGN KEY (id_transporte) REFERENCES transporte(id),
FOREIGN KEY (ubicacionInicio) REFERENCES ubicacion(id),
FOREIGN KEY (ubicacionFin) REFERENCES ubicacion(id)
);


CREATE table horarios(
id int not null auto_increment,
horaInicio DATETIME not null,
horafin DATETIME not null,
id_viaje int not null,
primary key(id),
FOREIGN KEY (id_viaje) REFERENCES viajes(id)
);


CREATE table bus_asociado(
id int not null auto_increment,
id_transporte int not null,
id_agencia int not null,
primary key(id),
FOREIGN KEY (id_transporte) REFERENCES transporte(id),
FOREIGN KEY (id_agencia) REFERENCES agencia(id)
);


CREATE TABLE dia(
 id int NOT null ,
 Etiqueta varchar(200) NOT NULL,
 PRIMARY KEY (id)
);


CREATE TABLE diaMercado(
 id int NOT null auto_increment,
 id_dia int  NOT NULL,
 id_ubicacion int not null,
 PRIMARY KEY (id),
 FOREIGN KEY (id_dia) REFERENCES dia(id),
 FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id)


);


CREATE TABLE feriaPatronal(
id int not null auto_increment,
dia varchar(150) not null,
 id_ubicacion int not null,
 PRIMARY KEY (id),
 FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id)
);



CREATE table supervisor_Escuela(
id int not null auto_increment,
id_supervisor int not null,
id_escuela int not null,
primary key(id),
FOREIGN KEY (id_supervisor) REFERENCES trabajador(id),
FOREIGN KEY (id_escuela) REFERENCES escuelas(id)
);
CREATE table supervisor_Hoteles(
id int not null auto_increment,
id_supervisor int not null,
id_hotel int not null,
primary key(id),
FOREIGN KEY (id_supervisor) REFERENCES trabajador(id),
FOREIGN KEY (id_hotel) REFERENCES hotel(id)
);
CREATE table supervisor_Agencia(
id int not null auto_increment,
id_supervisor int not null,
id_agencia int not null,
primary key(id),
FOREIGN KEY (id_supervisor) REFERENCES trabajador(id),
FOREIGN KEY (id_agencia) REFERENCES agencia(id)
);
CREATE table supervisor_Area(
id int not null auto_increment,
id_supervisor int not null,
id_area int not null,
primary key(id),
FOREIGN KEY (id_supervisor) REFERENCES trabajador(id),
FOREIGN KEY (id_area) REFERENCES areasProtegidas(id)
);






