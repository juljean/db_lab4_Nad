-- Функція для виводу кількості террористичнів актів, відповідно до заданої країни

CREATE OR REPLACE FUNCTION num_attacks_of_country(country_text varchar(50))
RETURNS NUMERIC
LANGUAGE 'plpgsql'
AS $$
DECLARE attacks_num NUMERIC;

BEGIN
	attacks_num := (SELECT COUNT(attack_id) FROM attackbase
					join place using(place_id)
					join country using(country_id 
									  )WHERE country_name = country_text);
	RETURN attacks_num;
END;
$$;

SELECT get_count_of_powerplants('United States');


-- Процедура, яка створює нову таблицю з даними про террористичні атаки у конкретну дату

CREATE OR REPLACE PROCEDURE daily_attack(day_text date)
LANGUAGE 'plpgsql'
AS $$
BEGIN
	DROP TABLE IF EXISTS attacks_on_day;
	CREATE TABLE attacks_on_day
	AS
	(SELECT attack_id, place_name, country_name, attack_date FROM attackbase 
	 join place using(place_id)
	 join country using(country_id)
	 WHERE  attack_date = day_text);
END;
$$;

CALL daily_attack('1976-07-12');
select * from attacks_on_day;


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

