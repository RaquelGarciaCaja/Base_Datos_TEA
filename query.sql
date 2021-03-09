USE BDCoches;
 
-- Query 1
-- Quiero saber que problemas empiezan por la letra S
--OK
SELECT 400_nomProblema, 400_descripcion
FROM 400_PROBLEMAS
WHERE 400_nomProblema LIKE ( "S%" );


-- Query 2
-- Quiero mostar todas los personas con tea (su nombre, apellido y 
--la fecha de nacimiento). Ordena por apelido (de la A-Z)
-- OK
SELECT 200_nombre, 200_apellido, 200_fechaNacimiento
	FROM 200_PERSONAS_CON_TEA
	ORDER BY 200_apellido ASC;
	
	

-- Query 3
-- Muestra la suma y la media de los sueldos de los profesionales
--  que hayan nacido en el 1980, 1985, 1990 y 1995. Agrupalos por año
-- OK

SELECT YEAR (100_fechaNacimiento) AS "anios", SUM( 100_sueldoBrutoAnual ) AS 'sumaSueldos', AVG( 100_sueldoBrutoAnual ) AS 'mediaSueldos'
	FROM 100_TIPO_DE_PROFESIONALES
	WHERE YEAR (100_fechaNacimiento) IN ("1980", "1985", "1990", "1995")
	GROUP BY YEAR (100_fechaNacimiento);
	
	

-- Query 4.
-- Muestra los nombres de las personas con tea y el grado que tienen 
-- Agrupa por grado 
Ordenalos de manera descendente
--OK
SELECT DISTINCT 300_grado, 200_nombre
	FROM 200_PERSONAS_CON_TEA
	INNER JOIN 410_TEA_PROBLEMAS
	ON 200_PERSONAS_CON_TEA.200_idPersonaTea = 410_TEA_PROBLEMAS.200_idPersonaTea
	INNER JOIN 411_TEA_PROBLEMAS_GRADO
	ON 200_PERSONAS_CON_TEA.200_idPersonaTea = 411_TEA_PROBLEMAS_GRADO.200_idPersonaTea
	INNER JOIN 300_GRADOS
	ON 411_TEA_PROBLEMAS_GRADO.300_idGrado = 300_GRADOS.300_idGrado
	ORDER BY 200_nombre DESC;
	

-- Query 5
-- Cuenta cuantas actividades que realiza cada profesional
-- enseña solo los que sean menos de 2
-- OK
SELECT 100_nomProfesional, COUNT( 110_ACTIVIDADES_PROFESIONALES.500_idActividad ) AS "numActividadesProfesional"
	FROM 100_TIPO_DE_PROFESIONALES
	INNER JOIN 110_ACTIVIDADES_PROFESIONALES
	ON 100_TIPO_DE_PROFESIONALES.100_idProfesional = 110_ACTIVIDADES_PROFESIONALES.100_idProfesional
	INNER JOIN 500_ACTIVIDADES
	ON 110_ACTIVIDADES_PROFESIONALES.500_idActividad = 500_ACTIVIDADES.500_idActividad
	GROUP BY 100_nomProfesional
	HAVING numActividadesProfesional <= 3;
	
	
	


-- Query 6
-- Cuenta y agrupa las fechas de inicio de los problemas 
-- y añade a quien pertenece. Ordena el nombre alfabeticamente
-- OK
SELECT 200_nombre, 410_fechaInicioProblema, COUNT( 410_fechaInicioProblema ) AS "numfechasIncioProblemas"
	FROM 200_PERSONAS_CON_TEA
	INNER JOIN 410_TEA_PROBLEMAS
	ON 200_PERSONAS_CON_TEA.200_idPersonaTea = 410_TEA_PROBLEMAS.200_idPersonaTea
	GROUP BY 410_fechaInicioProblema
	ORDER BY 200_nombre ASC;


	
	
	
	
-- Query 7
-- Muestrame qué actividades realizan las personas con tea (hombres)
--OK
SELECT DISTINCT 500_nomActividad
	FROM 200_PERSONAS_CON_TEA
	INNER JOIN 210_ACTIVIDADES_TEA
	ON 200_PERSONAS_CON_TEA.200_idPersonaTea = 210_ACTIVIDADES_TEA.200_idPersonaTea
	INNER JOIN 500_ACTIVIDADES
	ON 210_ACTIVIDADES_TEA.500_idActividad = 500_ACTIVIDADES.500_idActividad
	WHERE 200_sexo = "1";






-- Query 8
-- Muestra los profesionales y que actividades realizan con 
--cada persona con tea. Ordena por el nombre de manera ASC
-- Hay que conocer el nombre del profesional y de la persona con tea.
-- OK
SELECT 100_nomProfesional, 200_nombre, 500_nomActividad
	FROM 100_TIPO_DE_PROFESIONALES
	INNER JOIN 110_ACTIVIDADES_PROFESIONALES
	ON 100_TIPO_DE_PROFESIONALES.100_idProfesional = 110_ACTIVIDADES_PROFESIONALES.100_idProfesional
	INNER JOIN 500_ACTIVIDADES
	ON 110_ACTIVIDADES_PROFESIONALES.500_idActividad = 500_ACTIVIDADES.500_idActividad
	INNER JOIN 210_ACTIVIDADES_TEA
	ON 500_ACTIVIDADES.500_idActividad = 210_ACTIVIDADES_TEA.500_idActividad
	INNER JOIN 200_PERSONAS_CON_TEA
	ON 210_ACTIVIDADES_TEA.200_idPersonaTea = 200_PERSONAS_CON_TEA.200_idPersonaTea
	ORDER BY 100_nomProfesional ASC
	




-- Query 9
-- Enseña todas las actividades ( que sean puzzles), la fecha y hora de realizacion
--  y el nomre del profesional que lo realiza
-- OK

SELECT 211_fechaHoraRealizacion, 100_nomProfesional, 500_nomActividad  
	FROM 100_TIPO_DE_PROFESIONALES
	INNER JOIN 110_ACTIVIDADES_PROFESIONALES
	ON 100_TIPO_DE_PROFESIONALES.100_idProfesional = 110_ACTIVIDADES_PROFESIONALES.100_idProfesional
	INNER JOIN 211_ACTIVIDADES_TEA_PROFESIONALES
	ON 110_ACTIVIDADES_PROFESIONALES.100_idProfesional = 211_ACTIVIDADES_TEA_PROFESIONALES.100_idProfesional
	INNER JOIN 500_ACTIVIDADES
	ON 110_ACTIVIDADES_PROFESIONALES.500_idActividad = 500_ACTIVIDADES.500_idActividad
	WHERE 500_nomActividad = "Puzzles"
	GROUP BY 211_fechaHoraRealizacion
	ORDER BY 100_nomProfesional ASC
	

	
	




-- Query 10
-- Muestra el grado de satisfaccion de los profesionales (mujeres) que su fecha 
--de nacimiento sea menor 1 enero de 1990
-- OK

SELECT DISTINCT 100_nomProfesional, 211_gradoSatisfaccion
	FROM 100_TIPO_DE_PROFESIONALES
	INNER JOIN 110_ACTIVIDADES_PROFESIONALES
	ON 100_TIPO_DE_PROFESIONALES.100_idProfesional = 110_ACTIVIDADES_PROFESIONALES.100_idProfesional
	INNER JOIN 211_ACTIVIDADES_TEA_PROFESIONALES
	ON 110_ACTIVIDADES_PROFESIONALES.100_idProfesional = 211_ACTIVIDADES_TEA_PROFESIONALES.100_idProfesional
	WHERE 100_sexo = "0"
	AND 100_fechaNacimiento < "1990-01-01"
	





	
-- Query 11
-- Muestrame qué personas con tea no presentan probemas de comunicacion y lenguaje
--NO
SELECT *
	FROM 200_PERSONAS_CON_TEA
	INNER JOIN 410_TEA_PROBLEMAS
	ON 200_PERSONAS_CON_TEA.200_idPersonaTea = 410_TEA_PROBLEMAS.200_idPersonaTea
	INNER JOIN 400_PROBLEMAS
	ON 410_TEA_PROBLEMAS.400_idProblema = 400_PROBLEMAS.400_idProblema;
	

SELECT 200_nombre, 400_nomProblema
	FROM 200_PERSONAS_CON_TEA
	INNER JOIN 410_TEA_PROBLEMAS
	ON 200_PERSONAS_CON_TEA.200_idPersonaTea = 410_TEA_PROBLEMAS.200_idPersonaTea
	RIGHT JOIN 400_PROBLEMAS
	ON 410_TEA_PROBLEMAS.400_idProblema = 400_PROBLEMAS.400_idProblema
	WHERE 400_PROBLEMAS.400_idProblema IS NULL
	AND 400_PROBLEMAS.400_idProblema = "Comunicacion"

