SET SEARCH_PATH TO Geografico, Casilla, Partidos_politicos, Representantes;

--1er reporte
SELECT id_estado,
       nombre_estado,
       total_asis_esperadas,
       total_asis_recibidas,
       (total_asis_recibidas*100)/total_asis_esperadas AS porcen_asis_recibidas
FROM asistenciasRepresentantesACPorEstado
     NATURAL JOIN asistenciasRepresentantesACEsperadasPorEstado
     NATURAL JOIN Estado;

--2do reporte
SELECT id_estado,
       nombre_estado,
       total_repre_preli,
       total_repre_apro,
       (total_repre_apro*100)/total_repre_preli AS porcen_repre_aprobado
FROM totalRepresentantesPrePorEstado
     NATURAL JOIN totalRepresentantesAproPorEstado
     NATURAL JOIN Estado;

--3er reporte
SELECT (CASE WHEN id_representante IN (SELECT id_representante FROM Representante_ante_casilla)
        THEN 'C' ELSE 'G' END) AS tipo_representante,
       id_estado,
       nombre_estado,
       nombre_distrito_federal,
       siglas AS siglas_pp,
       id_representante,
       total_insert,
       total_update,
       total_delete
FROM totalOperaciones
     NATURAL JOIN Representante_preliminar
     NATURAL JOIN Partido
     NATURAL JOIN Distrito_federal
     NATURAL JOIN Estado;

--4to reporte
SELECT id_estado,
       nombre_estado,
       nombre_distrito_federal,
       siglas AS siglas_pp,
       id_representante,
       id_casilla AS casilla,
       tipo_cargo AS puesto_representante,
       nombre_estado_domicilio,
       nombre_distrito_F_domiclio
FROM representantesEnEstadosDistintos
     NATURAL JOIN Representante_ante_casilla
     NATURAL JOIN Representante_preliminar
     NATURAL JOIN Distrito_federal
     NATURAL JOIN Partido
     NATURAL JOIN Estado;

--5to reporte
SELECT id_estado,
       nombre_estado,
       total_repre_aprobado,
       total_repre_aprobado_F,
       (total_repre_aprobado_F * 100)/ total_repre_aprobado AS porcen_repre_aprobado_F,
       total_repre_aprobado_M,
       (total_repre_aprobado_M * 100)/ total_repre_aprobado AS porcen_repre_aprobado_M
FROM Estado
     NATURAL JOIN totalRepresentantesAprobadosPorEstado
     NATURAL JOIN cantidadMujeresPorEstado
     NATURAL JOIN cantidadHombresPorEstado;

--6to reporte
SELECT sum(c1) AS °0a22°, sum(c2) AS °23a39a°, sum(c3) AS °40a59°, sum(c4) AS °59a99°
FROM (SELECT id_representante,
             (CASE WHEN edad >  0 AND edad <= 22 THEN 1 ELSE 0 END) AS c1,
             (CASE WHEN edad > 22 AND edad <= 39 THEN 1 ELSE 0 END) AS c2,
             (CASE WHEN edad > 39 AND edad <= 59 THEN 1 ELSE 0 END) AS c3,
             (CASE WHEN edad > 59 AND edad <= 99 THEN 1 ELSE 0 END) AS c4
      FROM edadRepresentantesAprobados
      GROUP BY id_representante, edad) AS subConsulta;
