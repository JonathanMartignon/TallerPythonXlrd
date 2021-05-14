-- Eliminamos en caso de que exista
DROP DATABASE IF EXISTS taller_db;

-- Creamos la base de datos
CREATE DATABASE taller_db;

-- Nos movemos a la Base de datos 'taller_db'
\c taller_db;

CREATE TABLE alumno(
numero_de_cuenta INT NOT NULL PRIMARY KEY,
primer_apellido CHAR(20) NULL DEFAULT '-',
segundo_apellido CHAR(20) NULL DEFAULT '-',
nombre CHAR(40) NOT NULL
);

CREATE TABLE materia(
id_materia SERIAL NOT NULL PRIMARY KEY,
nombre CHAR(20) NOT NULL  
);

CREATE TABLE profesor(
id_profesor SERIAL NOT NULL PRIMARY KEY,
primer_apellido CHAR(20) NOT NULL DEFAULT '-',
segundo_apellido CHAR(20) NULL,
nombre CHAR(40) NOT NULL DEFAULT 'Unknown',
edad INT NULL
);

CREATE TABLE calificacion(
id_calificacion SERIAL NOT NULL PRIMARY KEY,
id_alumno INT NOT NULL,
id_materia INT NOT NULL,
id_profesor INT NOT NULL,
calificacion INT NOT NULL,
estado CHAR(10) NOT NULL,
fecha_de_registro DATE NOT NULL,

CONSTRAINT FK_id_alumno_from_alumno
FOREIGN KEY (id_alumno)
REFERENCES alumno(numero_de_cuenta),

CONSTRAINT FK_id_materia_from_materia
FOREIGN KEY (id_materia)
REFERENCES materia(id_materia),

CONSTRAINT FK_id_profesor_from_profesor
FOREIGN KEY (id_profesor)
REFERENCES profesor(id_profesor)

);

-- Para efectos 'prácticos' eliminamos el usuario en caso de existir
-- Y configuramos 'de 0'
DROP USER IF EXISTS user_t;

-- Creamos el usuario
CREATE USER user_t PASSWORD 'usuario';

-- Garantizamos privilegios
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO user_t;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO user_t;