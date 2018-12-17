SET SEARCH_PATH TO Representantes, Geografico, Casillas, Partidos_politicos;

CREATE OR REPLACE VIEW edadRepresentantesAprobados AS 
SELECT id_representante, CAST(EXTRACT(Year FROM age(fecha_nac)) AS Int) AS edad
FROM Representante_preliminar NATURAL JOIN Representante_aprobado;

CREATE OR REPLACE VIEW totalRepresentantesAprobadosPorEstado AS
SELECT id_estado, COUNT(id_representante) AS total_repre_aprobado
FROM Representante_aprobado
GROUP BY id_estado;

CREATE OR REPLACE VIEW cantidadMujeresPorEstado AS
SELECT id_estado, COUNT(sexo) AS total_repre_aprobado_F
FROM Representante_preliminar NATURAL JOIN Representante_aprobado
WHERE sexo = 'M'
GROUP BY id_estado;

CREATE OR REPLACE VIEW cantidadHombresPorEstado AS
SELECT id_estado, COUNT(sexo) AS total_repre_aprobado_M
FROM Representante_preliminar NATURAL JOIN Representante_aprobado
WHERE sexo = 'H'
GROUP BY id_estado;

CREATE OR REPLACE VIEW asistenciasRepresentantesACPorEstado AS
SELECT id_estado, COUNT(id_estado) AS total_asis_recibidas
FROM Asistencia NATURAL JOIN Representante_ante_casilla
GROUP BY id_estado;

CREATE OR REPLACE VIEW asistenciasRepresentantesACEsperadasPorEstado AS
SELECT id_estado, COUNT(id_representante)*3 AS total_asis_esperadas
FROM Representante_ante_casilla
GROUP BY id_estado;

CREATE OR REPLACE VIEW totalRepresentantesPrePorEstado AS
SELECT id_estado, COUNT(id_estado) AS total_repre_preli
FROM Representante_preliminar NATURAL JOIN Distrito_federal
GROUP BY id_estado;

CREATE OR REPLACE VIEW totalRepresentantesAproPorEstado AS
SELECT id_estado, COUNT(id_estado) AS total_repre_apro
FROM Representante_aprobado
GROUP BY id_estado;

CREATE OR REPLACE VIEW totalOperaciones AS
SELECT id_representante,
       sum(inserts) AS total_insert,
       sum(updates) AS total_update,
       sum(deletes) AS total_delete
FROM (SELECT id_representante,
             (CASE WHEN operacion = 'I' THEN 1 ELSE 0 END) AS inserts,
             (CASE WHEN operacion = 'U' THEN 1 ELSE 0 END) AS updates,
             (CASE WHEN operacion = 'D' THEN 1 ELSE 0 END) AS deletes
      FROM log_representantes_aprobados
      GROUP BY id_representante, operacion
      ) contador
GROUP BY id_representante;

CREATE OR REPLACE VIEW representantesEnEstadosDistintos AS
SELECT d.id_representante,
       d.id_estado AS nombre_estado_domicilio,
       d.id_distrito_federal AS nombre_distrito_F_domiclio
FROM Domicilia_represemtante_ac AS d, Representante_ante_casilla AS r
WHERE d.id_estado <> r.id_estado AND d.id_representante = r.id_representante;
