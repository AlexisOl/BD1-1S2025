CREATE DATABASE inguat;
use inguat;

CREATE TABLE municipio(
	 id int NOT null ,
	 nombre varchar(200) NOT NULL,
	 PRIMARY KEY (id)
);
-- tabla departamento
CREATE TABLE departamento(
	 id int NOT null ,
	 nombre varchar(200) NOT NULL,
	 PRIMARY KEY (id)
);
-- tabla tipo ubicacion (digamos que relacion municipio y departamento ...)
-- tabla de ubicacion
CREATE table ubicacion(
	id int not null auto_increment,
	id_municipio int not null,
	id_departamento  int not null,
	primary key(id),
	FOREIGN KEY (id_municipio) REFERENCES municipio(id),
	FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

-- tabla de escuelas de espaniol
CREATE table escuelas(
	id int not null auto_increment,
	nombre varchar(150) not null,
	direccion text not null,
	telefono int, 
	correo text,
	sitio_web  text,
	id_ubicacion int not null,
	primary key(id),
	FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id)
);

-- **********************************
-- **********************************
-- HOTELES
-- determina la cantidad de estrellas de un hotel
CREATE TABLE clasificacion(
	 id int NOT null auto_increment ,
	 numero_estrellas varchar(100) NOT NULL,
	 PRIMARY KEY (id)
);

-- determina la cantidad de habitaciones
-- *********************
CREATE table habitaciones(
	id int not null auto_increment,
	numero_habitaciones int not null,
	plaza_cama int not null,
	primary key(id)
);

-- tarifas en el hotel
	CREATE table tarifas(
		id int not null auto_increment,
		tarifaSencilla int not null,
		tarifaDoble int not null,
		tarifaTriple int not null,
		tarifaCamaAdicional int not null,
		tarifaHabitacionMultiple int not null,
		primary key(id)
);

-- tabla de hoteles
CREATE table hotel(
	id int not null auto_increment,
	nombre varchar(300) not null,
	direccion text not null,
	-- ver que pasa en el csv
	telefono  int,
	correo text, 
	sitio_web  text,
	id_tarifas int not null,
	id_habitaciones int not null,
	id_clasificacion int ,
	id_ubicacion int not null,
	primary key(id),
	FOREIGN KEY (id_tarifas) REFERENCES tarifas(id),
	FOREIGN KEY (id_habitaciones) REFERENCES habitaciones(id),
	FOREIGN KEY (id_clasificacion) REFERENCES clasificacion(id),
	FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id)
);


-- GUIAS
-- tabla con los idiomas que hablan
CREATE TABLE idiomas(
	 id int NOT null auto_increment ,
	 nombre varchar(200) NOT NULL,
	 PRIMARY KEY (id)
);

-- tabla de la especialidad del guia
CREATE table tipoGuia(
	id int not null auto_increment,
	tipo varchar(300) not null,
	primary key(id)
);

-- tabla meramente del guia
CREATE table Guia(
	carnet int not null,
	nombre varchar(350) not null,
	telefono int, 
	correo text,
	especializado varchar(500),
	id_tipo int not null,
	id_ubicacion int not null,
	primary key(carnet),
	FOREIGN KEY (id_tipo) REFERENCES tipoGuia(id),
	FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id)
);


-- tabla de n idiomas que puede hablar
CREATE table manejo_idiomas(
	id int not null auto_increment,
	id_guia int not null,
	id_idoma int not null,
	primary key(id),
	FOREIGN KEY (id_guia) REFERENCES Guia(carnet),
	FOREIGN KEY (id_idoma) REFERENCES idiomas(id)
);

-- **********************************
-- AGENCIAS DE VIAJE
-- **********************************
-- tabla del tipo de agencia de viaje
CREATE table clasificaion_agencia(
	id int not null auto_increment,
	tipo varchar(300) not null,
	primary key(id)
);

-- tabla de agencia
CREATE table agencia(
	id int not null auto_increment,
	nombre varchar(350) not null,
	direccion text not null,
	telefono  int, 
	correo text,
	sitio_web  text,
	id_tipo int not null,
	id_ubicacion int not null,
	primary key(id),
	FOREIGN KEY (id_tipo) REFERENCES clasificaion_agencia(id),
	FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id)
);

-- tabla de guias que trabajan en agencias
CREATE table guia_asociado(
	id int not null auto_increment,
	id_guia int not null,
	id_agencia int not null,
	primary key(id),
	FOREIGN KEY (id_guia) REFERENCES Guia(carnet),
	FOREIGN KEY (id_agencia) REFERENCES agencia(id)
);

-- tabla de viajes que puede realizar el guia
CREATE table viajeGuia(
	id int not null auto_increment,
	id_ubicacion int not null,
	id_guia int not null,
	fecha date not null,
	primary key(id),
	FOREIGN KEY (id_guia) REFERENCES Guia(carnet),
	FOREIGN KEY (id_ubicacion) REFERENCES municipio(id)
);

-- **********************************
-- TRANSPORTES
-- **********************************
-- tipo de viajes
CREATE table categoriaViaje(
	id int not null auto_increment,
	parada varchar(255) not null,
	primary key(id)
);

-- ti[p de trnasportes]
CREATE table tipoTransporte(
	id int not null auto_increment,
	tipo varchar(255) not null,
	primary key(id)
);

-- tabla de transportes  
CREATE table transporte(
	id int not null auto_increment,
	nombre varchar(255) not null,
	telefono  int,
	correo text,
	id_tipoTransporte int not null,
	id_categoriaViaje int not null,
	id_ubicacion int not null,
	primary key(id),
	FOREIGN KEY (id_tipoTransporte) REFERENCES tipoTransporte(id),
	FOREIGN KEY (id_categoriaViaje) REFERENCES categoriaViaje(id),
	FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id)
);

-- tabla de viajes 
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

-- tabla de horarios
CREATE table horarios(
	id int not null auto_increment,
	horaInicio DATETIME not null,
	horafin DATETIME not null,
	id_viaje int not null,
	primary key(id),
	FOREIGN KEY (id_viaje) REFERENCES viajes(id)
);

-- asosisacion entre buses y agencias de viaje
CREATE table bus_asociado(
	id int not null auto_increment,
	id_transporte int not null,
	id_agencia int not null,
	primary key(id),
	FOREIGN KEY (id_transporte) REFERENCES transporte(id),
	FOREIGN KEY (id_agencia) REFERENCES agencia(id)
);


-- DIAS DE MERCADO --
CREATE TABLE dia(
	 id int NOT null ,
	 Etiqueta varchar(200) NOT NULL,
	 PRIMARY KEY (id)
);
-- tabla de dia de mercado
CREATE TABLE diaMercado(
	 id int NOT null auto_increment,
	 id_dia int  NOT NULL,
	 id_ubicacion int not null,
	 PRIMARY KEY (id),
	 FOREIGN KEY (id_dia) REFERENCES dia(id),
	 FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id)
);

-- FERIAS PATRONALES
CREATE TABLE feriaPatronal(
	 id int not null auto_increment,
	 dia varchar(150) not null,
	 id_ubicacion int not null,
	 PRIMARY KEY (id),
	 FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id)
);






