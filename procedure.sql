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