CREATE DATABASE IF NOT EXISTS RENAP;

USE RENAP;

-- ubicaciones
CREATE TABLE Pais(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(200) NOT NULL
);

CREATE TABLE Departamento(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	id_pais INT NOT NULL,
	FOREIGN KEY (id_pais) REFERENCES Pais(id)
);

CREATE TABLE Municipio(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(300) NOT NULL,
	id_departamento INT NOT NULL,
	FOREIGN KEY (id_departamento) REFERENCES Departamento(id)
);

-- informacion de persona 
CREATE TABLE Sexo(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	tipo VARCHAR(100) NOT NULL
);

CREATE TABLE Estado_civil(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	tipo VARCHAR(100) NOT NULL
);

CREATE TABLE Persona(
<<<<<<< HEAD
	cui INT NOT NULL  PRIMARY KEY,
=======
	cui INT NOT NULL PRIMARY KEY,
>>>>>>> refs/remotes/origin/main
	primer_nombre VARCHAR(200) NOT NULL, 
	segundo_nombre VARCHAR(200), 
	tercer_nombre VARCHAR(200),
	primer_apellido VARCHAR(200) NOT NULL, 
	segundo_apellido VARCHAR(200),
	fecha_nacimiento DATE NOT NULL,
	ubicacion_nacimiento INT NOT NULL,
	ubicacion_residencia INT NOT NULL,
	id_sexo INT NOT NULL,
	id_estado_civil INT NOT NULL,
	FOREIGN KEY (ubicacion_nacimiento) REFERENCES Municipio(id),
	FOREIGN KEY (ubicacion_residencia) REFERENCES Municipio(id),
	FOREIGN KEY (id_sexo) REFERENCES Sexo(id),
	FOREIGN KEY (id_estado_civil) REFERENCES Estado_civil(id)
);

-- informacion de documentos 
-- DPI

-- acta nacimiento
CREATE TABLE Dpi (
    id_persona INT NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    numero_serie INT NOT NULL,
    PRIMARY KEY (id_persona),  
    FOREIGN KEY (id_persona) REFERENCES Persona(cui)  
);


-- acta nacimiento
CREATE TABLE Acta_nacimiento(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_persona INT NOT NULL,
	id_padre_1 INT NOT NULL, 
	id_padre_2 INT NOT NULL,
	FOREIGN KEY (id_persona) REFERENCES Persona(cui),
	FOREIGN KEY (id_padre_1) REFERENCES Persona(cui),
	FOREIGN KEY (id_padre_2) REFERENCES Persona(cui)
);

-- acta defuncion
CREATE TABLE Acta_defuncion(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fecha DATE NOT NULL,
	hora TIMESTAMP NOT NULL, 
	lugar INT NOT NULL,
	FOREIGN KEY (lugar) REFERENCES Municipio(id)
);

-- muchas posibles causas
CREATE TABLE Causas_muerte (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	detalle VARCHAR(350) NOT NULL,
	id_acta_defuncion INT NOT NULL,
	FOREIGN KEY (id_acta_defuncion) REFERENCES Acta_defuncion(id)
);

-- acta matrimonio
CREATE TABLE Regimen_economico (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	tipo VARCHAR(350) NOT NULL
);

CREATE TABLE Acta_matrimonio(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_persona_1 INT NOT NULL, 
	id_persona_2 INT NOT NULL, 
	lugar INT NOT NULL,
	capitulaciones BOOLEAN NOT NULL,
	id_regimen_economico INT NOT NULL, 
	id_autoridad INT NOT NULL, 
	FOREIGN KEY (id_persona_1) REFERENCES Persona(cui),
	FOREIGN KEY (id_persona_2) REFERENCES Persona(cui),
	FOREIGN KEY (lugar) REFERENCES Municipio(id),
	FOREIGN KEY (id_regimen_economico) REFERENCES Regimen_economico(id),
	FOREIGN KEY (id_autoridad) REFERENCES Persona(cui)
);

-- acta de divorcio
CREATE TABLE Acta_divorcio(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_acta_matrimonio INT NOT NULL, 
	fecha DATE NOT NULL, 
	id_autoridad INT NOT NULL, 
	motivo VARCHAR(400) NOT NULL, 
	FOREIGN KEY (id_acta_matrimonio) REFERENCES Acta_matrimonio(id),
	FOREIGN KEY (id_autoridad) REFERENCES Persona(cui)
);

-- informacion de forma de compra
CREATE TABLE Tarifario(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	tipo VARCHAR(300) NOT NULL,
	precio DECIMAL(10, 2) NOT NULL
);

-- definicion virtual/presencial
CREATE TABLE Tipo_tramite(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	tipo VARCHAR(300) NOT NULL
);

-- generacion de boleta de pago
CREATE TABLE Obtener_documento(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_documento INT NOT NULL,              
    id_persona INT NOT NULL,                
    fecha_pago DATE NOT NULL,               
    lugar_pago INT NOT NULL,       
    es_a_domicilio BOOLEAN DEFAULT 0,      
    recargo DECIMAL(10, 2),                 
    ubicacion_entrega_domicilio INT NOT NULL, 
    FOREIGN KEY (id_documento) REFERENCES Tarifario(id), 
    FOREIGN KEY (id_persona) REFERENCES Persona(cui),
    FOREIGN KEY (lugar_pago) REFERENCES Tipo_tramite(id),
    FOREIGN KEY (ubicacion_entrega_domicilio) REFERENCES Municipio(id)
);

-- determina el tipo de documento a pagar
CREATE TABLE Nacimiento_obtencion_documento(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_acta_nacimiento INT NOT NULL,
	id_pago_obtencion_documento INT NOT NULL,
	FOREIGN KEY (id_acta_nacimiento) REFERENCES Acta_nacimiento(id), 
	FOREIGN KEY (id_pago_obtencion_documento) REFERENCES Obtener_documento(id)
);

CREATE TABLE Defuncion_obtencion_documento(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_acta_defuncion INT NOT NULL,
	id_pago_obtencion_documento INT NOT NULL,
	FOREIGN KEY (id_acta_defuncion) REFERENCES Acta_defuncion(id), 
	FOREIGN KEY (id_pago_obtencion_documento) REFERENCES Obtener_documento(id)
);

CREATE TABLE Matrimonio_obtencion_documento(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_acta_matrimonio INT NOT NULL,
	id_pago_obtencion_documento INT NOT NULL,
	FOREIGN KEY (id_acta_matrimonio) REFERENCES Acta_matrimonio(id), 
	FOREIGN KEY (id_pago_obtencion_documento) REFERENCES Obtener_documento(id)
);

CREATE TABLE Divorcio_obtencion_documento(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_acta_divorcio INT NOT NULL,
	id_pago_obtencion_documento INT NOT NULL,
	FOREIGN KEY (id_acta_divorcio) REFERENCES Acta_divorcio(id), 
	FOREIGN KEY (id_pago_obtencion_documento) REFERENCES Obtener_documento(id)
);


CREATE TABLE Dpi_obtencion_documento (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_persona INT NOT NULL,
    id_pago_obtencion_documento INT NOT NULL,
    FOREIGN KEY (id_persona) REFERENCES Dpi(id_persona),
    FOREIGN KEY (id_pago_obtencion_documento) REFERENCES Obtener_documento(id)
);

