-- При внесенні нових даних у таблицю place форматизує place_id як рядок 
-- із перших двох літери міста та кода країни.

CREATE TRIGGER place_insert 
AFTER INSERT ON place
FOR EACH ROW EXECUTE FUNCTION formatizer()

CREATE OR REPLACE FUNCTION formatizer() RETURNS trigger AS
$$
     BEGIN
          UPDATE place
          SET place_id = substring(place_id, 1, 2) || country_id
			  WHERE place.place_id = NEW.place_id; 
		  RETURN NULL;
     END;
$$ LANGUAGE 'plpgsql';

select * from place

INSERT INTO place(place_id, place_name, country_id)
VALUES('Chicago 217', 'Chicago', 217);

