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