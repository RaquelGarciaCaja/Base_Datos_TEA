USE BDCoches;
 
	

-- Query 1
-- Quiero mostar todas los personas con tea (su nombre, apellido y 
--la fecha de nacimiento). Ordena por apelido (de la A-Z)
-- OK
SELECT 200_nombre, 200_apellido, 200_fechaNacimiento
	FROM 200_PERSONAS_CON_TEA
	ORDER BY 200_apellido ASC;
	
	

-- Query 2
-- Muestra la suma y la media de los profesionales
-- que hayan nacido en el 1980, 1985, 1990 y 1995. Agrupalos por año
-- OK

SELECT YEAR (100_fechaNacimiento) AS "anios", SUM( 100_sueldoBrutoAnual ) AS 'sumaSueldos', AVG( 100_sueldoBrutoAnual ) AS 'mediaSueldos'
	FROM 100_TIPO_DE_PROFESIONALES
	WHERE YEAR (100_fechaNacimiento) IN ("1980", "1985", "1990", "1995")
	GROUP BY YEAR (100_fechaNacimiento);
	


-- Query 3
-- Cuenta y agrupa las fechas de inicio de los problemas 
-- y añade a quien pertenece. Ordena el nombre alfabeticamente
-- OK
SELECT 200_nombre, 410_fechaInicioProblema, COUNT( 410_fechaInicioProblema ) AS "numfechasIncioProblemas"
	FROM 200_PERSONAS_CON_TEA
	INNER JOIN 410_TEA_PROBLEMAS
	ON 200_PERSONAS_CON_TEA.200_idPersonaTea = 410_TEA_PROBLEMAS.200_idPersonaTea
	GROUP BY 410_fechaInicioProblema
	ORDER BY 200_nombre ASC;

-- Query 4
-- Muestra las personas con TEA que no se ha ingresado nigun problema aun
-- OK
SELECT 200_nombre 
	FROM 200_PERSONAS_CON_TEA
	LEFT JOIN 410_TEA_PROBLEMAS
	ON 200_PERSONAS_CON_TEA.200_idPersonaTea = 410_TEA_PROBLEMAS.200_idPersonaTea
	WHERE 410_TEA_PROBLEMAS.200_idPersonaTea IS NULL;

-- Query 5
-- Muestra el grado de satisfaccion de los profesionales (mujeres) que su fecha 
-- de nacimiento sea menor 1 enero de 1990
-- Ordenalo de la A-Z
-- OK
	

SELECT DISTINCT 100_nomProfesional, 211_gradoSatisfaccion
	FROM 100_TIPO_DE_PROFESIONALES, 211_ACTIVIDADES_TEA_PROFESIONALES
	WHERE 100_TIPO_DE_PROFESIONALES.100_idProfesional = 211_ACTIVIDADES_TEA_PROFESIONALES.100_idProfesional
	AND 100_sexo = "0"
	AND 100_fechaNacimiento < "1990-01-01"
	ORDER BY 100_nomProfesional ASC;


	
-- Query 6
-- Mostrar las actividades que no son realizadas por las personas con TEA 
-- ni por los profesionales
SELECT 500_nomActividad
	FROM 500_ACTIVIDADES
	LEFT JOIN 210_ACTIVIDADES_TEA
	ON 500_ACTIVIDADES.500_idActividad = 210_ACTIVIDADES_TEA.500_idActividad
	LEFT JOIN 110_ACTIVIDADES_PROFESIONALES
	ON 500_ACTIVIDADES.500_idActividad = 110_ACTIVIDADES_PROFESIONALES.500_idActividad
	WHERE 210_ACTIVIDADES_TEA.500_idActividad IS NULL
	AND 110_ACTIVIDADES_PROFESIONALES.500_idActividad IS NULL;
	
	
	






-- Query 7
-- Quiero saber las personas con tea que su problema
-- empiece por la S. Muestra tambien su grado 
--OK

SELECT DISTINCT 400_nomProblema, 200_nombre, 300_grado
		FROM 400_PROBLEMAS
		INNER JOIN 410_TEA_PROBLEMAS
		ON 400_PROBLEMAS.400_idProblema = 410_TEA_PROBLEMAS.400_idProblema
		INNER JOIN 200_PERSONAS_CON_TEA
		ON 200_PERSONAS_CON_TEA.200_idPersonaTea = 410_TEA_PROBLEMAS.200_idPersonaTea
		INNER JOIN 411_TEA_PROBLEMAS_GRADO
		ON 411_TEA_PROBLEMAS_GRADO.200_idPersonaTea = 410_TEA_PROBLEMAS.200_idPersonaTea
		INNER JOIN 300_GRADOS
		ON 300_GRADOS.300_idGrado = 411_TEA_PROBLEMAS_GRADO.300_idGrado
		WHERE 400_nomProblema LIKE ( "S%" )
		ORDER BY 200_nombre DESC
	

-- Query 8
-- Muestrame qué actividades realizan las personas con tea (hombres)
-- que se hayan realizado actividades en el año pasado
--OK
SELECT DISTINCT 500_nomActividad
	FROM 200_PERSONAS_CON_TEA
	INNER JOIN 210_ACTIVIDADES_TEA
	ON 200_PERSONAS_CON_TEA.200_idPersonaTea = 210_ACTIVIDADES_TEA.200_idPersonaTea
	INNER JOIN 500_ACTIVIDADES
	ON 210_ACTIVIDADES_TEA.500_idActividad = 500_ACTIVIDADES.500_idActividad
	INNER JOIN 211_ACTIVIDADES_TEA_PROFESIONALES
	ON 210_ACTIVIDADES_TEA.500_idActividad = 211_ACTIVIDADES_TEA_PROFESIONALES.500_idActividad
	WHERE 200_sexo = "1"
	AND YEAR( 211_fechaHoraRealizacion ) = YEAR( NOW()) -1;





-- Query 9
-- Cuenta las actividades que realiza cada profesional
-- enseña solo los que sean menos o igual que 3
-- OK
SELECT 100_nomProfesional, COUNT( 110_ACTIVIDADES_PROFESIONALES.500_idActividad ) AS "numActividadesProfesional"
	FROM 100_TIPO_DE_PROFESIONALES
	INNER JOIN 110_ACTIVIDADES_PROFESIONALES
	ON 100_TIPO_DE_PROFESIONALES.100_idProfesional = 110_ACTIVIDADES_PROFESIONALES.100_idProfesional
	INNER JOIN 500_ACTIVIDADES
	ON 110_ACTIVIDADES_PROFESIONALES.500_idActividad = 500_ACTIVIDADES.500_idActividad
	GROUP BY 100_nomProfesional
	HAVING numActividadesProfesional <= 3;
	


-- Query 10
-- Quiero saber qué profesional y qué personas con TEA 
-- nacen en el mismo mes. Muestra el mes
-- OK 

SELECT DISTINCT 100_nomProfesional, 200_nombre, MONTHNAME (100_fechaNacimiento)
	FROM 100_TIPO_DE_PROFESIONALES
	INNER JOIN 211_ACTIVIDADES_TEA_PROFESIONALES
	ON 211_ACTIVIDADES_TEA_PROFESIONALES.100_idProfesional = 100_TIPO_DE_PROFESIONALES.100_idProfesional
	INNER JOIN 200_PERSONAS_CON_TEA
	ON 211_ACTIVIDADES_TEA_PROFESIONALES.200_idPersonaTea = 200_PERSONAS_CON_TEA.200_idPersonaTea
	WHERE MONTH( 100_fechaNacimiento) = MONTH( 200_fechaNacimiento);
	
	
	
	


-- Query 11
-- Muestra las personas con TEA que realizaron actividades en el curso escolar pasado
-- OK
SELECT 200_nombre, 211_fechaHoraRealizacion
	FROM 200_PERSONAS_CON_TEA
	LEFT JOIN 210_ACTIVIDADES_TEA
	ON 200_PERSONAS_CON_TEA.200_idPersonaTea = 210_ACTIVIDADES_TEA.200_idPersonaTea
	INNER JOIN 211_ACTIVIDADES_TEA_PROFESIONALES
	ON 210_ACTIVIDADES_TEA.200_idPersonaTea = 211_ACTIVIDADES_TEA_PROFESIONALES.200_idPersonaTea
	WHERE 211_fechaHoraRealizacion BETWEEN "2019-09-01" AND "2020-06-30" ;
	

-- Query 12
-- Quiero saber cuantos meses han pasado entre la 
-- fechaNacimiento y la fechaInicioProblema
-- OK
SELECT 200_nombre, 400_nomProblema, 200_fechaNacimiento, 410_fechaInicioProblema, 
	DATEDIFF(410_fechaInicioProblema, 200_fechaNacimiento ), 
	TIMESTAMPDIFF( MONTH, 200_fechaNacimiento, 410_fechaInicioProblema ) AS "mesesInicioProblema"
	FROM 200_PERSONAS_CON_TEA, 410_TEA_PROBLEMAS, 400_PROBLEMAS
	WHERE 200_PERSONAS_CON_TEA.200_idPersonaTea = 410_TEA_PROBLEMAS.200_idPersonaTea
	AND 410_TEA_PROBLEMAS.400_idProblema = 400_PROBLEMAS.400_idProblema;
	
	
-- Query 13
-- Enseña el profesional que realiza la actividad de puzzles. Indica la fecha y hora de realizacion
-- No quiero que me aparezcan las fechas de navidad (22dic 2019 y 08enero 2020)
-- OK

SELECT DISTINCT 211_fechaHoraRealizacion, 100_nomProfesional  
	FROM 100_TIPO_DE_PROFESIONALES
	INNER JOIN 110_ACTIVIDADES_PROFESIONALES
	ON 100_TIPO_DE_PROFESIONALES.100_idProfesional = 110_ACTIVIDADES_PROFESIONALES.100_idProfesional
	INNER JOIN 211_ACTIVIDADES_TEA_PROFESIONALES
	ON 110_ACTIVIDADES_PROFESIONALES.100_idProfesional = 211_ACTIVIDADES_TEA_PROFESIONALES.100_idProfesional
	INNER JOIN 500_ACTIVIDADES
	ON 110_ACTIVIDADES_PROFESIONALES.500_idActividad = 500_ACTIVIDADES.500_idActividad
	WHERE 500_nomActividad = "Puzzles"
	AND 211_fechaHoraRealizacion NOT IN (SELECT 211_fechaHoraRealizacion
													FROM 211_ACTIVIDADES_TEA_PROFESIONALES
													WHERE 211_fechaHoraRealizacion BETWEEN "2019-12-22" AND "2020-01-08");
	
	


-- Query 14
-- Muestra las personas con TEA que tengas mas de 2 problemas pero no hagan actividades
-- OK
SELECT 200_nombre, COUNT( 410_TEA_PROBLEMAS.400_idProblema) AS "numProblemas"
	FROM 200_PERSONAS_CON_TEA
	INNER JOIN 410_TEA_PROBLEMAS
	ON 200_PERSONAS_CON_TEA.200_idPersonaTea = 410_TEA_PROBLEMAS.200_idPersonaTea
	INNER JOIN 400_PROBLEMAS
	ON 400_PROBLEMAS.400_idProblema = 410_TEA_PROBLEMAS.400_idProblema
	WHERE 200_nombre IN (SELECT 200_nombre
					FROM 200_PERSONAS_CON_TEA
					LEFT JOIN 210_ACTIVIDADES_TEA
					ON 200_PERSONAS_CON_TEA.200_idPersonaTea = 210_ACTIVIDADES_TEA.200_idPersonaTea
					WHERE 210_ACTIVIDADES_TEA.200_idPersonaTea IS NULL)
	GROUP BY 200_nombre
	HAVING numProblemas > 2;

-- Query 15
-- Muestrame qué personas con tea no presentan probemas de comunicacion
-- y muestrame los problemas que tienen
--OK

SELECT 200_nombre, 400_nomProblema
	FROM 200_PERSONAS_CON_TEA
	INNER JOIN 410_TEA_PROBLEMAS
	ON 200_PERSONAS_CON_TEA.200_idPersonaTea = 410_TEA_PROBLEMAS.200_idPersonaTea
	INNER JOIN 400_PROBLEMAS
	ON 410_TEA_PROBLEMAS.400_idProblema = 400_PROBLEMAS.400_idProblema
	WHERE 200_nombre NOT IN (SELECT 200_nombre
							FROM 200_PERSONAS_CON_TEA
							INNER JOIN 410_TEA_PROBLEMAS
							ON 200_PERSONAS_CON_TEA.200_idPersonaTea = 410_TEA_PROBLEMAS.200_idPersonaTea
							INNER JOIN 400_PROBLEMAS
							ON 410_TEA_PROBLEMAS.400_idProblema = 400_PROBLEMAS.400_idProblema
							WHERE 400_nomProblema = "Comunicacion");



-- Query 16
-- Muestra los profesionales y que actividades realizan con 
-- cada persona con tea. Ordena por el nombre del profesional de manera ASC
-- Sólo muestra los profesionales que no tengan un grado de satisfaccion de 4
-- OK

SELECT 100_nomProfesional, 200_nombre, 500_nomActividad
	FROM 100_TIPO_DE_PROFESIONALES, 211_ACTIVIDADES_TEA_PROFESIONALES, 500_ACTIVIDADES, 200_PERSONAS_CON_TEA
	WHERE 211_ACTIVIDADES_TEA_PROFESIONALES.100_idProfesional = 100_TIPO_DE_PROFESIONALES.100_idProfesional
	AND 211_ACTIVIDADES_TEA_PROFESIONALES.500_idActividad = 500_ACTIVIDADES.500_idActividad
	AND 211_ACTIVIDADES_TEA_PROFESIONALES.200_idPersonaTea = 200_PERSONAS_CON_TEA.200_idPersonaTea
	AND 100_TIPO_DE_PROFESIONALES.100_idProfesional IN (SELECT 100_TIPO_DE_PROFESIONALES.100_idProfesional
								FROM 100_TIPO_DE_PROFESIONALES, 110_ACTIVIDADES_PROFESIONALES, 211_ACTIVIDADES_TEA_PROFESIONALES
								WHERE 100_TIPO_DE_PROFESIONALES.100_idProfesional = 110_ACTIVIDADES_PROFESIONALES.100_idProfesional
								AND 110_ACTIVIDADES_PROFESIONALES.100_idProfesional = 211_ACTIVIDADES_TEA_PROFESIONALES.100_idProfesional
								AND 211_gradoSatisfaccion != "4")
	
	ORDER BY 100_nomProfesional ASC;
	
	

-- Query 17
-- Muestrame qué actividades no realiza cada profesional 
-- Ordena por orden alfabetico por el nombre del profesional (A-Z)
--OK
SELECT 100_nomProfesional, 500_nomActividad 
	 FROM 100_TIPO_DE_PROFESIONALES, 500_ACTIVIDADES
	 WHERE 500_idActividad NOT IN ( SELECT 500_idActividad
									FROM 211_ACTIVIDADES_TEA_PROFESIONALES
									WHERE 100_idProfesional = 100_TIPO_DE_PROFESIONALES.100_idProfesional )
	ORDER BY 100_nomProfesional ASC;



-- Query 18
-- Quiero saber los profesionales que más ganan por actividad.
-- OK
SELECT T1.500_nomActividad, 100_nomProfesional, 100_sueldoBrutoAnual
	FROM 500_ACTIVIDADES T1, 110_ACTIVIDADES_PROFESIONALES, 100_TIPO_DE_PROFESIONALES T3
	WHERE T1.500_idActividad = 110_ACTIVIDADES_PROFESIONALES.500_idActividad
	AND 110_ACTIVIDADES_PROFESIONALES.100_idProfesional = T3.100_idProfesional
	AND 100_sueldoBrutoAnual = ( SELECT MAX( 100_sueldoBrutoAnual )
									FROM 500_ACTIVIDADES T2, 110_ACTIVIDADES_PROFESIONALES, 100_TIPO_DE_PROFESIONALES
									WHERE T2.500_idActividad = 110_ACTIVIDADES_PROFESIONALES.500_idActividad
									AND 110_ACTIVIDADES_PROFESIONALES.100_idProfesional = T3.100_idProfesional
									AND T1.500_idActividad = T2.500_idActividad
									GROUP BY T1.500_idActividad )
	GROUP BY T1.500_nomActividad, T3.100_nomProfesional;
