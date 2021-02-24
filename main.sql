-- Borra la base de datos si existe y si no existe no hace nada.
DROP DATABASE IF EXISTS BDTEA;

-- Crea la base de datos.
CREATE DATABASE BDTEA DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

-- Lo que hay después( CREATE TABLE.... ) se realizan sobre la base de datos de USE.
USE BDTEA;



-- tablas grado I



CREATE TABLE `100_TIPODEPROFESIONALES` (
	100_idProfesional TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	100_dniProfesional CHAR (9) NOT NULL,
	100_nomProfesional CHAR (25) NOT NULL,
	100_foto CHAR( 100 ) NOT NULL,
	100_sueldoBrutoAnual FLOAT( 8, 2 ) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `200_PERSONASCONTEA`(
	200_idPersonaTea SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	200_nombre CHAR (25) NOT NULL,
	200_apellido CHAR (50) NOT NULL,
	200_foto CHAR( 100 ) NOT NULL

)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `300_GRADOS`(
300_idGrado TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
300_grado TINYINT UNSIGNED NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `400_PROBLEMAS`(
400_idProblema TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
400_nomProblema CHAR (30) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `500_ACTIVIDADES`(
500_idActividad SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
500_nomActividad CHAR (100) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- tablas grado II


CREATE TABLE `110_ACTIVIDADESPROFESIONALES`(
100_idProfesional TINYINT UNSIGNED NOT NULL,
500_idActividad SMALLINT UNSIGNED NOT NULL,

PRIMARY KEY (100_idProfesional, 500_idActividad),
CONSTRAINT `kf110_100_idProfesional` FOREIGN KEY (100_idProfesional) REFERENCES 100_TIPODEPROFESIONALES (100_idProfesional),
CONSTRAINT `kf110_500_idActividad` FOREIGN KEY (500_idActividad) REFERENCES 500_ACTIVIDADES (500_idActividad)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE `210_ACTIVIDADESTEA`(
500_idActividad SMALLINT UNSIGNED NOT NULL,
200_idPersonaTea SMALLINT UNSIGNED NOT NULL,
210_tiempoEstimadoHoras TIME NOT NULL,

PRIMARY KEY (200_idPersonaTea, 500_idActividad),
CONSTRAINT `kf210_200_idPersonaTea` FOREIGN KEY (200_idPersonaTea) REFERENCES 200_PERSONASCONTEA (200_idPersonaTea),
CONSTRAINT `kf210_500_idActividad` FOREIGN KEY (500_idActividad) REFERENCES 500_ACTIVIDADES (500_idActividad)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `410_ACTIVIDADESTEA`(
400_idProblema TINYINT UNSIGNED NOT NULL,
200_idPersonaTea SMALLINT UNSIGNED NOT NULL,
410_fechaInicioidProblemas DATE NOT NULL,

PRIMARY KEY (400_idProblema, 200_idPersonaTea),
CONSTRAINT `kf410_200_idPersonaTea` FOREIGN KEY (200_idPersonaTea) REFERENCES 200_PERSONASCONTEA (200_idPersonaTea),
CONSTRAINT `kf410_400_idProblema` FOREIGN KEY (400_idProblema) REFERENCES 400_PROBLEMAS (400_idProblema)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




-- tablas grado III


CREATE TABLE `211_ACTIVIDADESTEAPROFESIONALES`(
100_idProfesional TINYINT UNSIGNED NOT NULL,
500_idActividad SMALLINT UNSIGNED NOT NULL,
200_idPersonaTea SMALLINT  UNSIGNED NOT NULL,
211_notas TEXT (5000) NOT NULL,
211_duracionMinutos TIME NOT NULL,

PRIMARY KEY (100_idProfesional, 200_idPersonaTea, 500_idActividad),
CONSTRAINT `kf211_100_idProfesional_500_idActividad` FOREIGN KEY (100_idProfesional, 500_idActividad) REFERENCES 110_ACTIVIDADESPROFESIONALES (100_idProfesional, 500_idActividad),
CONSTRAINT `kf211_500_idActividad_200_idPersonaTea` FOREIGN KEY (500_idActividad, 200_idPersonaTea) REFERENCES 210_ACTIVIDADESTEA (500_idActividad, 200_idPersonaTea)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE `411_TEAPROBLEMASGRADO`(
411_fecha DATE NOT NULL,
400_idProblema TINYINT UNSIGNED NOT NULL,
200_idPersonaTea SMALLINT UNSIGNED NOT NULL,
300_idGrado TINYINT UNSIGNED NOT NULL,

PRIMARY KEY (400_idProblema, 200_idPersonaTea),
CONSTRAINT `kf411_400_idProblema_200_idPersonaTea` FOREIGN KEY (400_idProblema, 200_idPersonaTea) REFERENCES 410_ACTIVIDADESTEA (400_idProblema, 200_idPersonaTea),
CONSTRAINT `kf411_300_idGrado` FOREIGN KEY (300_idGrado) REFERENCES 300_GRADOS (300_idGrado)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;