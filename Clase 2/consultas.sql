use inguatSinNormalizar;


-- select * from municipio m where m.id_departamento = 3;

-- GROUP BY
-- ver escuelas y lugares
select count(*) AS "CANTIDAD", m.Etiqueta from escuelas es JOIN ubicacion u on es.id = u.id
JOIN municipio m on m.id = u.id_municipio 
JOIN departamento d on u.id_departamento = d.id
GROUP by m.Etiqueta
Having count(*)  > 10
;

--  cantidad de dias por mercado
SELECT dia.Etiqueta, count(*) as cantidad FROM diaMercado JOIN dia ON diaMercado.id_dia = dia.id JOIN ubicacion ON diaMercado.id_ubicacion = ubicacion.id GROUP by diaMercado.id_dia;



-- Order by 
-- tarifa y horeles con mas de 50 habitaciones, ordenando de menor a mayor
SELECT h.nombre, hab.numero_habitaciones, t.tarifaSencilla from hotel h JOIN habitaciones hab ON h.id_habitaciones = hab.id JOIN tarifas t on h.id_tarifas = t.id WHERE hab.numero_habitaciones > 50
ORDER BY t.tarifaSencilla Desc, h.nombre DESC;

-- 

-- Limit
-- tarifa y horeles con mas de 50 habitaciones, ordenando de menor a mayor
SELECT h.nombre, hab.numero_habitaciones, t.tarifaSencilla from hotel h JOIN habitaciones hab ON h.id_habitaciones = hab.id JOIN tarifas t on h.id_tarifas = t.id WHERE hab.numero_habitaciones > 50
LIMIT 10;

-- 5 agencias de viajes con mas de 3 guias, esto de menor a mayor
SELECT agencia.nombre, COUNT(guia_asociado.id_guia) as num_guias FROM
agencia JOIN guia_asociado on agencia.id = guia_asociado.id_agencia
GROUP BY agencia.nombre 
HAVING num_guias > 3
ORDER BY num_guias desc limit 5;

-- between
SELECT hotel.nombre, tarifas.tarifaSencilla from hotel
JOIN tarifas ON hotel.id_tarifas = tarifas.id
WHERE tarifas.tarifaSencilla
BETWEEN 50 AND 100
Order by tarifas.tarifaSencilla ;



-- lugares sin visita
SELECT u.Etiqueta, vg.fecha AS Ubicacion From municipio u
LEFT JOIN viajeGuia vg ON u.id = vg.id_ubicacion WHERE 
YEAR(vg.fecha) IS NULL or 
MONTH(vg.fecha) IS NULL 

SELECT g.nombre, vg.fecha AS guia FROM Guia g LEFT JOIN viajeGuia vg ON g.id = vg.id_guia WHERE  vg.fecha < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);




