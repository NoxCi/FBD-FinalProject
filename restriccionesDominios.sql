--Dominios del esquema Casillas
SET SEARCH_PATH TO Casillas;

CREATE DOMAIN TipoCasilla AS Char(1) CHECK(VALUE IN ('B','C','S','E'));
CREATE DOMAIN DoAprobada AS Char(1) CHECK(VALUE IN ('S','N'));--creamos un dominio, que recive un 'Char(1)' y verifica que sea 'S' o 'N'

ALTER TABLE Casilla ALTER tipo_casilla TYPE TipoCasilla; -- alteramos la columna 'tipo_casilla' de la tabla 'Casilla', al cambiar su tipo por el nuvo dominio 'TipoCasilla'
ALTER TABLE Casilla ALTER aprobada TYPE DoAprobada;

--Dominios del esquema Representantes
SET SEARCH_PATH TO Representantes;

CREATE DOMAIN DoSexo AS Char(1) CHECK(VALUE IN ('H', 'M'));
CREATE DOMAIN TipoCargo AS Char(1) CHECK(VALUE IN ('P', 'S'));
CREATE DOMAIN DoOperacion AS Char(1) CHECK(VALUE IN ('U','I','D'));
CREATE DOMAIN TipoPresencia AS Char(1) CHECK(VALUE IN ('I','F','C'));
CREATE DOMAIN RegistroPresencia AS Char(1) CHECK(VALUE IN ('F', 'N'));
CREATE DOMAIN ClaveElector AS Char(13) CHECK(VALUE SIMILAR TO '[a-z]{6}%[0-9]{6}%(H|M){1}');

ALTER TABLE Representante_preliminar ALTER sexo TYPE DoSexo;
ALTER TABLE Representante_ante_casilla ALTER tipo_cargo TYPE TipoCargo;
ALTER TABLE log_representantes_aprobados ALTER operacion TYPE DoOperacion;
ALTER TABLE Asistencia ALTER tipo_presencia TYPE TipoPresencia;
ALTER TABLE Asistencia ALTER registro_presencia TYPE RegistroPresencia;
