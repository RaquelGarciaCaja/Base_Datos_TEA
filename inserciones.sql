USE BDTEA;


-- tabla grado I
INSERT INTO 100_TIPODEPROFESIONALES
	(100_idProfesional, 100_dniProfesional, 100_nomProfesional,  100_foto, 100_sueldoBrutoAnual)
VALUES 
	( null, "00000001A", "María", 		"img/001.png", "20000,00"),
	( null, "00000002A", "Alejandro", 	"img/002.png", "20000,00"),
	( null, "00000003A", "Fernando", 	"img/003.png", "20000,00"),
	( null, "00000004A", "Rocio", 		"img/004.png", "20000,00"),
	( null, "00000005A", "Gerardo",		"img/005.png", "20000,00"),
	( null, "00000006A", "Gonzalo",		"img/006.png", "20000,00");
	

INSERT INTO 200_PERSONASCONTEA
	( 200_idPersonaTea, 200_nombre, 200_apellido, 200_foto)
VALUES 	
	
	( null, "David", 	"Domínguez", 	"img/007.png"),
	( null, "Laura", 	"López", 		"img/008.png"),
	( null, "Sergio", 	"Sánchez", 		"img/009.png"),
	( null, "Pedro", 	"Pérez", 		"img/010.png"),
	( null, "Raúl", 	"Ruiz",			"img/011.png"),
	( null, "Héctor", 	"Hernández",	"img/012.png");


INSERT INTO 300_GRADOS
	( 300_idGrado, 300_grado )
VALUES 	
	
	( null, 	"Grado I" 	),  
	( null,		"Grado II"	),
	( null,	 	"Grado III"	);
	
	
	
INSERT INTO 400_PROBLEMAS
	( 400_idProblema, 400_nomProblema )
VALUES 	
	
	( null, 	"Inflexibilidad" ),  
	( null,		"Lenguaje"	),
	( null, 	"Actividades diarias" ),  
	( null,		"Sensibilidad auditiva"	),
	( null,		"Sensibilidad táctil"	)
	( null,	 	"Comunicación"	);
	
INSERT INTO 500_ACTIVIDADES
	(500_idActividad, 500_nomActividad)
VALUES 
	
	( null, "Puzzles" ),
	( null, "Figura-fondo" ),
	( null, "Uso de pictogramas" ),
	( null, "Visuales"),
	( null, "Visuo-espaciales"),
	( null, "Jegos con diferentes texturas"),
	( null, "Ordenar rutinas" );
	
	

	
	
	-- tabla grado II
	
INSERT INTO 110_ACTIVIDADESPROFESIONALES
	( 100_idProfesional, 500_idActividad )
VALUES 
		( 1,				1),
		( 1, 				2),
		( 1, 				3),
		( 1,				4),			
		( 1, 				5),			
		( 2,				1),
		( 2, 				2),
		( 2, 				3),
		( 3, 				2),
		( 3, 				5),
		( 4, 				2),
		( 4, 				4),
		( 5, 				5),
		( 5, 				2),
		( 6, 				4),
		( 7, 				5);	


--duda el tiempo estimado. Cómo determino si es mensual, semanal...??
INSERT INTO 210_ACTIVIDADESTEA
	( 500_idActividad, 200_idPersonaTea, 210_tiempoEstimadoHoras )
VALUES 
		( 1,				1, 01:00:00),
		( 1, 				2, 01:00:00),
		( 1, 				3, 01:00:00),
		( 1,				4, 01:00:00),			
		( 1, 				5, 01:00:00),			
		( 2,				1, 01:00:00),
		( 2, 				2, 01:00:00),
		( 2, 				3, 01:00:00),
		( 3, 				2, 01:00:00),
		( 3, 				5, 01:00:00),
		( 4, 				2, 01:00:00),
		( 4, 				4, 01:00:00),
		( 5, 				5, 01:00:00),
		( 5, 				2, 01:00:00),
		( 5, 				4, 01:00:00);




INSERT INTO 410_ACTIVIDADESTEA
	( 400_idProblema, 200_idPersonaTea, 410_fechaInicioidProblemas )
VALUES 
		( 1,				1, 2009-05-03),
		( 1, 				2, 2011-07-07),
		( 1, 				3, 2011-02-22),
		( 1,				4, 2014-10-13),			
		( 1, 				5, 2012-09-18),			
		( 2,				1, 2011-08-09),
		( 2, 				2, 2013-04-11),
		( 2, 				3, 2015-01-29),
		( 3, 				2, 2017-07-30),
		( 3, 				5, 2019-06-27),
		( 4, 				2, 2018-12-28),
		( 4, 				4, 2019-11-23),
		( 5, 				5, 2019-11-23),
		( 5, 				2, 2020-11-23),
		( 5, 				4, 2012-11-23);





INSERT INTO 211_ACTIVIDADESTEAPROFESIONALES
	( 100_idProfesional, 500_idActividad, 200_idPersonaTea, 211_notas, 211_duracionMinutos)
VALUES 
		( 1,	1,	1,	"blabla", 01:00:00),
		( 1,	1,	2,	"blabla", 01:00:00),
		( 1,	2,	3,	"blabla", 01:00:00),
		( 1,	2,	4,	"blabla", 01:00:00),			
		( 1,	3,	5,	"blabla", 01:00:00),			
		( 2,	4,	1, 	"blabla", 01:00:00),
		( 2,	4,	2, 	"blabla", 01:00:00),
		( 2,	5,	3, 	"blabla", 01:00:00),
		( 3,	5,	2, 	"blabla", 01:00:00),
		( 3,	4,	5, 	"blabla", 01:00:00),
		( 4,	1,	2, 	"blabla", 01:00:00),
		( 4,	2,	4, 	"blabla", 01:00:00),
		( 5,	7,	5, 	"blabla", 01:00:00),
		( 5,	6,	2, 	"blabla", 01:00:00),
		( 6,	5,	4, 	"blabla", 01:00:00),
		( 7,	4,	5, 	"blabla", 01:00:00);	





INSERT INTO 411_TEAPROBLEMASGRADO
	( 411_fecha, 400_idProblema, 200_idPersonaTea, 300_idGrado )
VALUES 
		(2011-05-03, 1,			1, 1),
		(2012-05-03, 1, 		2, 2),
		(2014-05-03, 1, 		3, 2),
		(2015-05-03, 1,			4, 3),			
		(2015-05-03, 1, 		5, 3),			
		(2016-05-03, 2,			1, 2),
		(2020-05-03, 2, 		2, 1),
		(2018-05-03, 2, 		3, 1),
		(2017-05-03, 3, 		2, 1),
		(2014-05-03, 3, 		5, 2),
		(2014-05-03, 4, 		2, 2),
		(2020-05-03, 4, 		4, 1),
		(2014-05-03, 5, 		5, 3),
		(2010-05-03, 5, 		2, 2),
		(2010-05-03, 6, 		4, 1),
		(2013-05-03, 7, 		5, 2);	



	 