USE BDTEA;



INSERT INTO `100_TIPO_DE_PROFESIONALES`
	( 100_idProfesional, 100_dniProfesional, 100_nomProfesional, 100_fechaNacimiento, 100_nomFichero, 100_sueldoBrutoAnual, 100_sexo )
VALUES 
	( null, 				"00000001A",			"María",			"1990-05-01", 		"img/001.png", 		"22000.00",			"0"),
	( null, 				"00000002A",			"Alejandro", 		"1982-02-25",		"img/002.png", 		"25000.00", 		"1"),
	( null, 				"00000003A",			"Josefa",			"1985-10-14", 		"img/003.png", 		"26000.00",			"0"),
	( null, 				"00000004A",			"Rocío",			"1978-08-26", 		"img/004.png", 		"24000.00",			"0");
	
	
	
INSERT INTO `200_PERSONAS_CON_TEA`
	( 200_idPersonaTea, 200_nombre, 200_apellido, 200_fechaNacimiento, 200_nomFichero, 200_sexo )
VALUES 	
	( null, 			"David", 	"Domínguez",		 "2015-05-11", 	"img/007.png", 		"1" 	),
	( null, 			"Teresa", 	"Rodríguez",		 "2016-11-25", 	"img/008.png", 		"0" 	),
	( null, 			"Adrián", 	"Fernández",		 "2015-12-30", 	"img/009.png", 		"1" 	),
	( null, 			"Alberto", 	"Martínez",			 "2018-01-27", 	"img/010.png", 		"1" 	);
	

	
INSERT INTO `300_GRADOS`
	( 300_idGrado, 300_grado )
VALUES 	
	( null, 	"Grado I" 	),  
	( null,		"Grado II"	),
	( null,	 	"Grado III"	);
	
	
	
INSERT INTO `400_PROBLEMAS`
	( 400_idProblema, 400_nomProblema, 400_descripcion )
VALUES 	
	( null, 	"Inflexibilidad", 			"blabla" ),  
	( null,		"Lenguaje", 				"blabla" ),
	( null, 	"Comunicación", 			"blabla" ),  
	( null,		"Esteriotipias", 			"blabla" ),
	( null,		"Sensibilida táctil", 		"blabla" ),
	( null,	 	"Sensibilida auditiva",		"blabla" );

	
INSERT INTO `500_ACTIVIDADES`
	( 500_idActividad, 500_nomActividad, 500_descripcion)
VALUES 
	
	( null,	 "puzzles", 						"blabla"  ),
	( null,	 "Comprensión lectora",				"blabla"  ),
	( null,	 "Uso de pictos", 					"blabla"  ),
	( null,	 "Juegos con texturas y ruidos", 	"blabla"  );	
	

	

INSERT INTO `110_ACTIVIDADES_PROFESIONALES`
	( 100_idProfesional, 500_idActividad )
VALUES 
		( 1,				1),
		( 1, 				2),
		( 1, 				3),
		
		
		( 2, 				1),
		
		
		
		( 3, 				1),
		( 3, 				2),
		( 3, 				3),
		( 3, 				4),
		
		
		( 4, 				1),
		( 4, 				2),
		( 4, 				3),
		( 4, 				4);
	
		




INSERT INTO `210_ACTIVIDADES_TEA`
	( 500_idActividad, 200_idPersonaTea )
VALUES 
		( 1,				1),
		( 2,				1),
		( 3,				1),
				
		( 1,				2),
		
		
		( 1,				3),
		( 2,				3),
		( 3,				3),
		( 4,				3),
	
		( 1,				4),
		( 2,				4),
		( 3,				4),
		( 4,				4);


INSERT INTO `410_TEA_PROBLEMAS`
	( 400_idProblema, 200_idPersonaTea, 410_fechaInicioProblema )
VALUES 
		( 1,				1, 			"2018-05-01"),
		( 2, 				1,			"2017-06-01"),			
		( 3,				1, 			"2017-05-01"),
		
		( 1,				2, 			"2018-11-01"),
		
		( 1, 				3,			"2016-10-01"),			
		( 2,				3, 			"2016-04-01"),
		( 3, 				3,			"2016-10-01"),			
		( 4,				3, 			"2016-04-01"),
		( 5, 				3,			"2016-10-01"),
		
		( 1,				4, 			"2018-03-01"),
		( 2, 				4,			"2018-11-01"),			
		( 3,				4, 			"2018-04-01"),
		( 4, 				4,			"2018-04-01"),			
		( 5,				4, 			"2018-12-01"),
		( 6, 				4,			"2018-08-01");
		


INSERT INTO `211_ACTIVIDADES_TEA_PROFESIONALES`
	( 100_idProfesional, 500_idActividad, 200_idPersonaTea, 211_fechaHoraRealizacion, 211_descripcion, 211_gradoSatisfaccion  )
VALUES 
		

		( 1,				1,				1,				"2020-01-07 09:00:00",		 "blabla",			"5"),
		( 1, 				2,				1,				"2020-01-14 09:00:00",		 "blabla",			"5"),
		( 1, 				3,				1,				"2020-01-21 09:00:00",		 "blabla",			"5"),
					
		
		( 2, 				1,				2,				"2020-05-07 10:00:00",		 "blabla",			"5"),
		
		
		( 3, 				1,				3,				"2020-06-07 16:00:00",		 "blabla",			"3"),
		( 3, 				2,				3,				"2020-06-14 16:00:00",		 "blabla",			"3"),
		( 3, 				3,				3,				"2020-06-21 16:00:00",		 "blabla",			"3"),
		( 3, 				4,				3,				"2020-06-28 16:00:00",		 "blabla",			"3"),
		
		
		( 4, 				1,				4,				"2020-11-07 17:00:00",		 "blabla",			"4"),
		( 4, 				2,				4,				"2020-11-14 17:00:00",		 "blabla",			"4"),
		( 4, 				3,				4,				"2020-11-21 17:00:00",		 "blabla",			"4"),
		( 4, 				4,				4,				"2020-11-28 17:00:00",		 "blabla",			"4");
		




	
INSERT INTO `411_TEA_PROBLEMAS_GRADO`
	( 400_idProblema, 200_idPersonaTea, 411_fechaReevaluacion, 300_idGrado )
VALUES 

		( 1,				1, 			"2019-01-01",				2),
		( 2, 				1,			"2019-01-01",				2),			
		( 3,				1, 			"2019-01-01",				2),
		
		( 1,				2, 			"2021-11-01", 				1),
		
		( 1, 				3,			"2017-11-01", 				3),			
		( 2,				3, 			"2017-11-01", 				3),
		( 3, 				3,			"2017-11-01", 				3),			
		( 4,				3, 			"2017-11-01", 				3),
		( 5, 				3,			"2017-11-01", 				3),
		
		( 1,				4, 			"2019-03-01", 				3),
		( 2, 				4,			"2019-03-01", 				3),			
		( 3,				4, 			"2019-03-01", 				3),
		( 4, 				4,			"2019-03-01", 				3),			
		( 5,				4, 			"2019-03-01", 				3),
		( 6, 				4,			"2019-03-01", 				3);
		

		



	 