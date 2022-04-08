-- Creación de Base de Datos
CREATE DATABASE peliculas_db;
-- Conectar a la Base de Datos
\c peliculas_db;
-- Crear tabla pelicula
CREATE TABLE peliculas(id SMALLINT PRIMARY KEY, pelicula VARCHAR(100), anio_estreno SMALLINT, director VARCHAR(50));
-- Crear tabla reparto
CREATE TABLE reparto(peliculas_fk SMALLINT, actor VARCHAR (50), FOREIGN KEY (peliculas_fk) REFERENCES peliculas(id));
-- Importar datos .csv
\copy peliculas FROM '/Users/jossefarodriguez/Desktop/desafio_top100/Apoyo Desafío - Top 100/peliculas.csv' csv header;
\copy reparto FROM '/Users/jossefarodriguez/Desktop/desafio_top100/Apoyo Desafío - Top 100/reparto.csv' csv;
-- Consulta (id pelicula Titanic)
SELECT * FROM peliculas WHERE pelicula = 'Titanic';
-- Consulta (todo el reparto de Titanic)
SELECT * FROM reparto WHERE peliculas_fk = 2;
-- Consulta ( top 100 de Harrison)
SELECT COUNT(*) AS pelis_harri FROM peliculas WHERE id IN (SELECT peliculas_fk FROM reparto WHERE actor = 'Harrison Ford') LIMIT 100;
-- Consulta (pelicular ordenadas por titulo ASC entre los años 1990 y 1999)
SELECT * FROM peliculas WHERE anio_estreno BETWEEN 1990 AND 1999 ORDER BY pelicula ASC;
-- Consulta (longitud de los titulos)
SELECT pelicula, LENGTH(pelicula) AS longitud_titulo FROM peliculas;
-- Consulta ( longitud más grande entre todos los titulos)
SELECT MAX(LENGTH(pelicula)) FROM peliculas;