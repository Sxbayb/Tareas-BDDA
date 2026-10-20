-- =====================================================================
-- Tarea 2 BDA: consultas de la Parte 1 y Parte 2
-- Copiar y pegar dentro de cqlsh (docker exec -it cassandra1 cqlsh),
-- una sección a la vez, sacando captura de cada resultado.
--
-- Actor de ejemplo: Josefa Brenda Alarcón Álvarez
--   actor_id = 8c53765f-4ec0-4954-bf8b-2a6aab74fe57
--   (7 personajes, 4 de ellos con rol Principal)
-- =====================================================================

USE actors;

-- ---------------------------------------------------------------------
-- PARTE 1
-- ---------------------------------------------------------------------

-- 1.1 Búsqueda por clave de partición
SELECT nombre, nacionalidad, edad, idiomas
FROM actors_by_id
WHERE actor_id = 8c53765f-4ec0-4954-bf8b-2a6aab74fe57;

-- 1.2 Consulta por nacionalidad, ordenada por edad (clustering)
SELECT nombre, edad, nacionalidad
FROM actors_by_nationality
WHERE nacionalidad = 'Chile'
LIMIT 10;

-- 1.3 Personajes principales de un actor, ordenados por apariciones
SELECT nombre_actor, nombre_personaje, rol, apariciones, produccion
FROM characters_by_actor
WHERE actor_id = 8c53765f-4ec0-4954-bf8b-2a6aab74fe57
  AND rol = 'Principal'
LIMIT 10;

-- 1.4 LIMIT y ordenamiento: los 5 actores chilenos de mayor edad
--     (se invierte el orden del clustering con ORDER BY edad DESC)
SELECT nombre, edad
FROM actors_by_nationality
WHERE nacionalidad = 'Chile'
ORDER BY edad DESC
LIMIT 5;

-- 1.4 (para mostrar que NO se puede ordenar por cualquier columna)
-- Esta consulta debe fallar:
SELECT nombre, patrimonio
FROM actors_by_nationality
WHERE nacionalidad = 'Chile'
ORDER BY patrimonio DESC
LIMIT 5;

-- ---------------------------------------------------------------------
-- PARTE 2.1  TRACING (repetir 1.1, 1.2 y 1.3)
-- ---------------------------------------------------------------------
TRACING ON;

SELECT nombre, nacionalidad, edad, idiomas
FROM actors_by_id
WHERE actor_id = 8c53765f-4ec0-4954-bf8b-2a6aab74fe57;

SELECT nombre, edad, nacionalidad
FROM actors_by_nationality
WHERE nacionalidad = 'Chile'
LIMIT 10;

SELECT nombre_actor, nombre_personaje, rol, apariciones, produccion
FROM characters_by_actor
WHERE actor_id = 8c53765f-4ec0-4954-bf8b-2a6aab74fe57
  AND rol = 'Principal'
LIMIT 10;

-- ---------------------------------------------------------------------
-- PARTE 2.2  Consulta sin clave apropiada (tabla principal, sin índices)
-- ---------------------------------------------------------------------
TRACING OFF;

-- Debe fallar (Cassandra exige ALLOW FILTERING)
SELECT nombre, nacionalidad, edad
FROM actors_by_id
WHERE nacionalidad = 'Chile' AND edad > 40
LIMIT 10;

TRACING ON;

-- Único lugar de la tarea donde se permite ALLOW FILTERING
SELECT nombre, nacionalidad, edad
FROM actors_by_id
WHERE nacionalidad = 'Chile' AND edad > 40
LIMIT 10
ALLOW FILTERING;

TRACING OFF;

-- ---------------------------------------------------------------------
-- PARTE 2.3  Storage-Attached Indexing (SAI)
-- ---------------------------------------------------------------------
CREATE INDEX actors_nacionalidad_sai ON actors_by_id (nacionalidad) USING 'sai';
CREATE INDEX actors_edad_sai         ON actors_by_id (edad)         USING 'sai';

-- (esperar unos segundos a que se construyan los índices)

-- Por nacionalidad
SELECT nombre, nacionalidad, edad
FROM actors_by_id
WHERE nacionalidad = 'Chile'
LIMIT 10;

-- Por edad
SELECT nombre, nacionalidad, edad
FROM actors_by_id
WHERE edad > 60
LIMIT 10;

-- Combinando ambos atributos (ya no pide ALLOW FILTERING)
SELECT nombre, nacionalidad, edad
FROM actors_by_id
WHERE nacionalidad = 'Chile' AND edad > 40
LIMIT 10;

-- Índice sobre la colección de idiomas
CREATE INDEX actors_idiomas_sai ON actors_by_id (VALUES(idiomas)) USING 'sai';

SELECT nombre, nacionalidad, idiomas
FROM actors_by_id
WHERE idiomas CONTAINS 'Ingles'
LIMIT 10;

-- Para comparar con la búsqueda por clave de partición, repetir con
-- TRACING ON la consulta por nacionalidad con SAI y la consulta 1.1.
TRACING ON;

SELECT nombre, nacionalidad, edad
FROM actors_by_id
WHERE nacionalidad = 'Chile'
LIMIT 10;

-- ---------------------------------------------------------------------
-- PARTE 2.4  Desnormalización vs. índices (ambas con TRACING ON)
-- ---------------------------------------------------------------------

-- a) Tabla diseñada para la consulta (lee UNA partición)
SELECT nombre, edad
FROM actors_by_nationality
WHERE nacionalidad = 'Chile'
LIMIT 10;

-- b) Tabla principal + índice SAI (recorre los rangos de tokens del clúster)
SELECT nombre, edad
FROM actors_by_id
WHERE nacionalidad = 'Chile'
LIMIT 10;

TRACING OFF;

-- PARTE 2.5 es solo teórica (escalabilidad con 10 mil millones de filas).
