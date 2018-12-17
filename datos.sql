SET SEARCH_PATH TO Geografico, Casillas, Partidos_politicos, Representantes;

INSERT INTO Estado VALUES(1, 'Mexico', 'MEX'); --insertamos los valores dados a la tabla 'Estado'
INSERT INTO Estado VALUES(2, 'Zacatecas', 'ZAC');
INSERT INTO Estado VALUES(3, 'Yucatan', 'YUC');

INSERT INTO Municipio values(1, 1, 'Cosio');
INSERT INTO Municipio values(2, 2, 'Tepezala');
INSERT INTO Municipio values(3, 3, 'Comondu');

INSERT INTO Distrito_local values(1, 1, 'Palo Alto');
INSERT INTO Distrito_local values(2, 2, 'Calvillo');
INSERT INTO Distrito_local values(3, 3, 'Tenabo');

INSERT INTO Distrito_federal VALUES(1, 1, 'Mexicali');
INSERT INTO Distrito_federal VALUES(2, 2, 'Ensenada');
INSERT INTO Distrito_federal VALUES(3, 3, 'La Paz');

INSERT INTO Seccion VALUES(1, 1, 1, 1, 1);
INSERT INTO Seccion VALUES(2, 2, 2, 2, 2);
INSERT INTO Seccion VALUES(3, 3, 3, 3, 3);

INSERT INTO Casilla VALUES(1, 1, 1, 1, 1, 1, 'B', 'S');
INSERT INTO Casilla VALUES(1, 1, 1, 1, 1, 2, 'C', 'S');
INSERT INTO Casilla VALUES(1, 1, 1, 1, 1, 3, 'S', 'S');
INSERT INTO Casilla VALUES(2, 2, 2, 2, 2, 4, 'E', 'S');
INSERT INTO Casilla VALUES(2, 2, 2, 2, 2, 5, 'B', 'S');
INSERT INTO Casilla VALUES(2, 2, 2, 2, 2, 6, 'C', 'S');
INSERT INTO Casilla VALUES(3, 3, 3, 3, 3, 7, 'S', 'S');
INSERT INTO Casilla VALUES(3, 3, 3, 3, 3, 8, 'E', 'S');
INSERT INTO Casilla VALUES(3, 3, 3, 3, 3, 9, 'B', 'S');

INSERT INTO Partido VALUES (1, 1, 'Partido Accion Nacional', 'PAN');
INSERT INTO Partido VALUES (1, 2, 'Partido Revolucionario Institucional', 'PRI');
INSERT INTO Partido VALUES (1, 3, 'Partido de la Revolucion Democratica', 'PRD');
INSERT INTO Partido VALUES (1, 4, 'Partido del Trabajo', 'PT');
INSERT INTO Partido VALUES (1, 5, 'Movimiento Ciudadano', 'MC');
INSERT INTO Partido VALUES (2, 1, 'Partido Accion Nacional', 'PAN');
INSERT INTO Partido VALUES (2, 2, 'Partido Revolucionario Institucional', 'PRI');
INSERT INTO Partido VALUES (2, 3, 'Partido de la Revolucion Democratica', 'PRD');
INSERT INTO Partido VALUES (2, 4, 'Partido del Trabajo', 'PT');
INSERT INTO Partido VALUES (2, 5, 'Movimiento Ciudadano', 'MC');
INSERT INTO Partido VALUES (3, 1, 'Partido Accion Nacional', 'PAN');
INSERT INTO Partido VALUES (3, 2, 'Partido Revolucionario Institucional', 'PRI');
INSERT INTO Partido VALUES (3, 3, 'Partido de la Revolucion Democratica', 'PRD');
INSERT INTO Partido VALUES (3, 4, 'Partido del Trabajo', 'PT');
INSERT INTO Partido VALUES (3, 5, 'Movimiento Ciudadano', 'MC');

SELECT InsertaRepresentantesPreliminares(33); --mandamos a llamar un proceso almecenado(una funcion).

SELECT ApruebaRepresentanteAnteCasilla(1, 1, 'Direccion1', 'P', 1, 1, 1, 1, 1);
SELECT ApruebaRepresentanteAnteCasilla(2, 1, 'Direccion2', 'S', 2, 2, 2, 2, 2);
SELECT ApruebaRepresentanteAnteCasilla(3, 2, 'Direccion3', 'P', 3, 3, 3, 3, 3);
SELECT ApruebaRepresentanteAnteCasilla(4, 2, 'Direccion4', 'S', 1, 1, 1, 1, 1);
SELECT ApruebaRepresentanteAnteCasilla(5, 3, 'Direccion5', 'P', 2, 2, 2, 2, 2);
SELECT ApruebaRepresentanteAnteCasilla(6, 3, 'Direccion6', 'S', 3, 3, 3, 3, 3);
SELECT ApruebaRepresentanteAnteCasilla(7, 4, 'Direccion7', 'P', 1, 1, 1, 1, 1);
SELECT ApruebaRepresentanteAnteCasilla(8, 4, 'Direccion8', 'S', 2, 2, 2, 2, 2);
SELECT ApruebaRepresentanteAnteCasilla(9, 5, 'Direccion9', 'P', 3, 3, 3, 3, 3);
SELECT ApruebaRepresentanteAnteCasilla(10, 5, 'Direccion10', 'S', 1, 1, 1, 1, 1);
SELECT ApruebaRepresentanteAnteCasilla(11, 6, 'Direccion11', 'P', 2, 2, 2, 2, 2);
SELECT ApruebaRepresentanteAnteCasilla(12, 6, 'Direccion12', 'S', 3, 3, 3, 3, 3);
SELECT ApruebaRepresentanteAnteCasilla(13, 7, 'Direccion13', 'P', 1, 1, 1, 1, 1);
SELECT ApruebaRepresentanteAnteCasilla(14, 7, 'Direccion14', 'S', 2, 2, 2, 2, 2);
SELECT ApruebaRepresentanteAnteCasilla(15, 8, 'Direccion15', 'P', 3, 3, 3, 3, 3);
SELECT ApruebaRepresentanteAnteCasilla(16, 8, 'Direccion16', 'S', 1, 1, 1, 1, 1);
SELECT ApruebaRepresentanteAnteCasilla(17, 9, 'Direccion17', 'P', 2, 2, 2, 2, 2);
SELECT ApruebaRepresentanteAnteCasilla(18, 9, 'Direccion18', 'S', 3, 3, 3, 3, 3);

SELECT ApruebaRepresentanteGeneral(19, 'Direccion19', 1, 1, 1, 1, 1);
SELECT ApruebaRepresentanteGeneral(20, 'Direccion20', 2, 2, 2, 2, 2);
SELECT ApruebaRepresentanteGeneral(21, 'Direccion21', 3, 3, 3, 3, 3);
SELECT ApruebaRepresentanteGeneral(22, 'Direccion22', 1, 1, 1, 1, 1);
SELECT ApruebaRepresentanteGeneral(23, 'Direccion23', 2, 2, 2, 2, 2);
SELECT ApruebaRepresentanteGeneral(24, 'Direccion24', 3, 3, 3, 3, 3);
SELECT ApruebaRepresentanteGeneral(25, 'Direccion25', 1, 1, 1, 1, 1);
SELECT ApruebaRepresentanteGeneral(26, 'Direccion26', 2, 2, 2, 2, 2);
SELECT ApruebaRepresentanteGeneral(27, 'Direccion27', 3, 3, 3, 3, 3);
SELECT ApruebaRepresentanteGeneral(28, 'Direccion28', 1, 1, 1, 1, 1);
SELECT ApruebaRepresentanteGeneral(29, 'Direccion29', 2, 2, 2, 2, 2);
SELECT ApruebaRepresentanteGeneral(30, 'Direccion30', 3, 3, 3, 3, 3);
SELECT ApruebaRepresentanteGeneral(31, 'Direccion31', 1, 1, 1, 1, 1);
SELECT ApruebaRepresentanteGeneral(32, 'Direccion32', 2, 2, 2, 2, 2);
SELECT ApruebaRepresentanteGeneral(33, 'Direccion33', 3, 3, 3, 3, 3);

SELECT CreaAsistencias();

SELECT CreaSustitucion(1);
SELECT CreaSustitucion(2);
SELECT CreaSustitucion(3);
SELECT CreaSustitucion(4);
SELECT CreaSustitucion(5);
SELECT CreaSustitucion(6);
SELECT CreaSustitucion(7);
SELECT CreaSustitucion(8);
SELECT CreaSustitucion(9);
SELECT CreaSustitucion(10);
