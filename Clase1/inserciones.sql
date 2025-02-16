

-- Inserciones para la tabla Pais (solo Guatemala)
INSERT INTO Pais (nombre) VALUES ('Guatemala');

-- Inserciones para la tabla Departamento
INSERT INTO Departamento (nombre, id_pais) VALUES ('Quetzaltenango', 1);
INSERT INTO Departamento (nombre, id_pais) VALUES ('Guatemala', 1);
INSERT INTO Departamento (nombre, id_pais) VALUES ('Huehuetenango', 1);
INSERT INTO Departamento (nombre, id_pais) VALUES ('Alta Verapaz', 1);

-- Inserciones para la tabla Municipio (municipios de Guatemala)
INSERT INTO Municipio (nombre, id_departamento) VALUES ('La Esperanza', 1);  -- Quetzaltenango
INSERT INTO Municipio (nombre, id_departamento) VALUES ('Guatemala', 2);     -- Guatemala
INSERT INTO Municipio (nombre, id_departamento) VALUES ('Huehuetenango', 3); -- Huehuetenango
INSERT INTO Municipio (nombre, id_departamento) VALUES ('Cobán', 4);        -- Alta Verapaz

-- Inserciones para la tabla Sexo
INSERT INTO Sexo (tipo) VALUES ('Masculino');
INSERT INTO Sexo (tipo) VALUES ('Femenino');

-- Inserciones para la tabla Estado_civil
INSERT INTO Estado_civil (tipo) VALUES ('Soltero');
INSERT INTO Estado_civil (tipo) VALUES ('Casado');
INSERT INTO Estado_civil (tipo) VALUES ('Divorciado');
INSERT INTO Estado_civil (tipo) VALUES ('Viudo');

-- Inserciones para la tabla Persona
INSERT INTO Persona (cui, primer_nombre, segundo_nombre, tercer_nombre, primer_apellido, segundo_apellido, fecha_nacimiento, ubicacion_nacimiento, ubicacion_residencia, id_sexo, id_estado_civil)
VALUES (123456789, 'Carlos', 'Madrigal', 'Enrique', 'Lopez', 'Sánchez', '1990-05-15', 1, 1, 1, 1);

INSERT INTO Persona (cui, primer_nombre, segundo_nombre, tercer_nombre, primer_apellido, segundo_apellido, fecha_nacimiento, ubicacion_nacimiento, ubicacion_residencia, id_sexo, id_estado_civil)
VALUES (987654321, 'Ana', 'María', NULL, 'Gomez', 'Ramirez', '1985-11-20', 2, 2, 2, 2);

-- Inserciones para la tabla Dpi
INSERT INTO Dpi (id_persona, fecha_vencimiento, numero_serie)
VALUES (123456789, '2030-05-15', 11223344);

INSERT INTO Dpi (id_persona, fecha_vencimiento, numero_serie)
VALUES (987654321, '2027-11-20', 55667788);

-- Inserciones para la tabla Acta_nacimiento
INSERT INTO Acta_nacimiento (id_persona, id_padre_1, id_padre_2)
VALUES (123456789, 234567890, 345678901);

INSERT INTO Acta_nacimiento (id_persona, id_padre_1, id_padre_2)
VALUES (987654321, 456789012, 567890123);

-- Inserciones para la tabla Acta_defuncion
INSERT INTO Acta_defuncion (fecha, hora, lugar)
VALUES ('2025-02-01', '15:30:00', 1); -- Municipio de La Esperanza

-- Inserciones para la tabla Regimen_economico
INSERT INTO Regimen_economico (tipo) VALUES ('Separación de bienes');
INSERT INTO Regimen_economico (tipo) VALUES ('Sociedad conyugal');

-- Inserciones para la tabla Acta_matrimonio
INSERT INTO Acta_matrimonio (id_persona_1, id_persona_2, lugar, capitulaciones, id_regimen_economico, id_autoridad)
VALUES (123456789, 987654321, 1, TRUE, 1, 234567890); -- Matrimonio en el municipio de La Esperanza

-- Inserciones para la tabla Obtener_documento
INSERT INTO Obtener_documento (id_documento, id_persona, fecha_pago, lugar_pago, es_a_domicilio, recargo, ubicacion_entrega_domicilio)
VALUES (1, 123456789, '2025-02-01', 1, FALSE, 10.50, 1); -- Pago en el municipio de La Esperanza

-- Inserciones para las tablas de obtención de documentos
INSERT INTO Nacimiento_obtencion_documento (id_acta_nacimiento, id_pago_obtencion_documento)
VALUES (1, 1);

INSERT INTO Defuncion_obtencion_documento (id_acta_defuncion, id_pago_obtencion_documento)
VALUES (1, 1);

INSERT INTO Matrimonio_obtencion_documento (id_acta_matrimonio, id_pago_obtencion_documento)
VALUES (1, 1);

INSERT INTO Divorcio_obtencion_documento (id_acta_divorcio, id_pago_obtencion_documento)
VALUES (1, 1);

-- Inserciones para la tabla Dpi_obtencion_documento
INSERT INTO Dpi_obtencion_documento (id_persona, id_pago_obtencion_documento)
VALUES (123456789, 1);
