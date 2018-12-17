SET SEARCH_PATH TO Representantes;

--1.
CREATE OR REPLACE FUNCTION crea_log_representantes_aprobados()--Procedimiento que devuelve un 'Trigger'
RETURNS Trigger AS $$
BEGIN
  IF TG_OP = 'INSERT' --si la operacion que activo el trigger fue 'INSERT'
  THEN INSERT INTO log_representantes_aprobados VALUES (NEW.id_representante, CURRENT_USER, Now(), 'I');
       RETURN NEW;
  ELSEIF TG_OP = 'UPDATE' --si la operacion que activo el trigger fue 'UPDATE'
  THEN INSERT INTO log_representantes_aprobados VALUES (NEW.id_representante, CURRENT_USER, Now(), 'U');
       RETURN NEW;
  ELSEIF TG_OP = 'DELETE' --si la operacion que activo el trigger fue 'DELETE'
  THEN INSERT INTO log_representantes_aprobados VALUES (OLD.id_representante, CURRENT_USER, Now(), 'D');
       RETURN OLD;
  END IF;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER creaLog BEFORE
INSERT OR UPDATE OR DELETE ON Representante_aprobado --este trigger se acciona cada ves que se hace 'Insert', 'Update' o 'Delete'
  FOR EACH ROW EXECUTE PROCEDURE crea_log_representantes_aprobados(); --para cada tupla que se inserte, actualize o se borre.

--2.
CREATE OR REPLACE FUNCTION restringe_edicion_log()
RETURNS Trigger AS $$
BEGIN
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER restringeLog BEFORE
DELETE OR UPDATE ON log_representantes_aprobados
  FOR EACH ROW EXECUTE PROCEDURE restringe_edicion_log();

--3-
CREATE OR REPLACE FUNCTION verificaAprobacionCasilla ()
RETURNS Trigger AS $$
BEGIN
  IF (SELECT aprobada FROM Casilla WHERE NEW.id_casilla = Casilla.id_casilla) = 'S'
  THEN RETURN NEW;
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER verificaAprobacionDeCasilla BEFORE
INSERT ON Representante_ante_casilla
  FOR EACH ROW EXECUTE PROCEDURE verificaAprobacionCasilla();

--4.
CREATE OR REPLACE FUNCTION disponibilidadCasilla()
RETURNS Trigger AS $$
BEGIN
  IF ('P') IN (SELECT tipo_cargo FROM Representante_ante_casilla rac WHERE NEW.id_casilla = rac.id_casilla)
     AND
     ('S') IN (SELECT tipo_cargo FROM Representante_ante_casilla rac WHERE NEW.id_casilla = rac.id_casilla)
  THEN RETURN NULL;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER veDisponiblidadCasilla BEFORE
INSERT ON Representante_ante_casilla
  FOR EACH ROW EXECUTE PROCEDURE disponibilidadCasilla();

--5.
CREATE OR REPLACE FUNCTION disponibilidadDistrito()
RETURNS Trigger AS $$
BEGIN
  IF 10 <= (SELECT COUNT(id_representante)
            FROM Representante_general rg NATURAL JOIN Distrito_federal
            WHERE NEW.id_distrito_federal = rg.id_distrito_federal)
  THEN RETURN NULL;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER veDisponiblidadDistrito BEFORE
INSERT ON Representante_general
  FOR EACH ROW EXECUTE PROCEDURE disponibilidadDistrito();
