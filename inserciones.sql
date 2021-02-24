USE BDTEA;

INSERT INTO 100_TIPODEPROFESIONALES
	(100_idProfesional, 100_dniProfesional, 100_nomProfesional,  100_foto, 100_sueldoBrutoAnual)
VALUES 
	( null, "00000001A", "María", 		"__", "20000,00"),
	( null, "00000002A", "Alejandro", 	"__", "20000,00"),
	( null, "00000003A", "Fernando", 	"__", "20000,00"),
	( null, "00000004A", "Rocio", 		"__", "20000,00"),
	( null, "00000005A", "Gerardo",		"__", "20000,00"),
	( null, "00000006A", "Gonzalo",		"__", "20000,00");
	

INSERT INTO 200_PERSONASCONTEA
	( 200_idPersonaTea, 200_nombre, 200_apellido, 200_foto)
VALUES 	
	
	( null, "David", 	"Domínguez", 	"__"),
	( null, "Laura", 	"López", 		"__"),
	( null, "Sergio", 	"Sánchez", 		"__"),
	( null, "Pedro", 	"Pérez", 		"__"),
	( null, "Raúl", 	"Ruiz",			"__"),
	( null, "Héctor", 	"Hernández",	"__");


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
	