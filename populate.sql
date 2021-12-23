INSERT INTO GeneralType (TYPE_ID, TYPE_NAME) VALUES 
	(1, 'Assassination'),
	(3, 'Bombing/Explosion'),
	(4, 'Hijacking'),
	(2, 'Armed Assault'),
	(5, 'Hostage Taking (Barricade Incident)'),
	(8, 'Unarmed Assault'),
	(7, 'Facility/Infrastructure Attack'),
	(6, 'Hostage Taking (Kidnapping)');
	
	
INSERT INTO Country (COUNTRY_ID, COUNTRY_NAME) VALUES 
	(58, 'Dominican Republic'),
	(217, 'United States'), 
	(218, 'Uruguay'), 
	(98, 'United Kindom'),
	(222, 'Venezuela'),
	(101, 'Japan'),
	(96, 'Ireland'),
	(72, 'Gabon');
	
INSERT INTO Place (PLACE_ID, PLACE_NAME, COUNTRY_ID) VALUES 
	('Sa58', 'Santo Domingo', 58),
	('Ca217', 'Cairo', 217),
	('Oa217', 'Oakland', 217),
	('Ba217', 'Baraboo', 217),
	('Ne217', 'New York City', 217),
	('Be96', 'Belturbet', 96),
	('Fu101', 'Fukouka', 101),
	('Mi98', 'Milan', 98);
	
INSERT INTO AttackBase (ATTACK_ID, PLACE_ID, ATTACK_DATE) VALUES 
	(3982, 'Mi98', '7/11/1976'),
	(3983, 'Fu101', '7/11/1976'),
	(3984, 'Ba217', '7/12/1976'),
	(3985, 'Ne217', '7/12/1976'),
	(3986, 'Ne217', '7/12/1976'),
	(3987, 'Ne217', '7/12/1976'),
	(3988, 'Ne217', '7/12/1976'),
	(3989, 'Ne217', '7/12/1976');

INSERT INTO AttackType (ATTACK_ID, TYPE_ID) VALUES 
	(2311, 3),
	(2312, 1),
	(2314, 3),
	(2315, 1),
	(2316, 2),
	(2319, 6),
	(2320, 2),
	(2321, 1);