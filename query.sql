USE BDCoches;
 

-- Query 1.
-- Quiero mostar todas los personas con tea su nombre y apellido y ordena por apelido (de la A-Z)
-- 
SELECT 200_nombre, 200_apellido
	FROM 200_PERSONASCONTEA
	ORDER BY 200_apellido DESC;

-- Query 19
-- Muestra la media del sueldo de los profesionales
-- 

SELECT SUM( 100_sueldoBrutoAnual ) AS 'sumaSueldos', AVG( 100_sueldoBrutoAnual ) AS 'mediaSueldos'
	FROM 100_TIPODEPROFESIONALES
	HAVING sumaSueldos ASC
	
-- Query 4.
-- Muestra los nombres de las personas con tea tienen un grado I
SELECT 200_nombre, 200_apellido
	FROM 200_PERSONASCONTEA
	INNER JOIN 410_ACTIVIDADESTEA
	ON 200_PERSONASCONTEA.200_idPersonaTea = 410_ACTIVIDADESTEA.200_idPersonaTea
	INNER JOIN 411_TEAPROBLEMASGRADO
	ON 200_PERSONASCONTEA.200_idPersonaTea = 411_TEAPROBLEMASGRADO.200_idPersonaTea
	INNER JOIN 300_GRADOS
	ON 411_TEAPROBLEMASGRADO.300_idGrado = 300_GRADOS.300_idGrado
	WHERE idGrado = I;




    -- Query 19
-- Cuenta cuantas actividades realiza cada profesional.
-- muetrame las que sean mas de 2 actividades e indicame el nombre del profesional
-- 
SELECT 200_nombre, COUNT( * ) AS numActividadesProfesional
	FROM 100_TIPODEPROFESIONALES
	INNER JOIN 110_ACTIVIDADESPROFESIONALES
	ON 100_TIPODEPROFESIONALES.100_idProfesional = 110_ACTIVIDADESPROFESIONALES.100_idProfesional
	INNER JOIN 500_ACTIVIDADES
	ON 110_ACTIVIDADESPROFESIONALES.500_idActividad = 500_ACTIVIDADES.500_idActividad
	HAVING numActividadesProfesional > 2;