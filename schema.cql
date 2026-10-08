-- schema.cql: keyspace y tablas, diseñadas a partir de las consultas.

-- Ejecutar:
--   docker cp schema.cql cassandra1:/tmp/schema.cql
--   docker exec -it cassandra1 cqlsh -f /tmp/schema.cql
--
-- Si SELECT data_center FROM system.local; devuelve otro nombre,
-- reemplazar 'datacenter1' por ese valor.


CREATE KEYSPACE IF NOT EXISTS actors
WITH replication = {
    'class': 'NetworkTopologyStrategy',
    'datacenter1': 3
};

USE actors;


-- Tabla 1: actors_by_id  (tabla principal)
-- Consulta: obtener un actor mediante su identificador.
-- PRIMARY KEY: (actor_id)
--   Clave de partición: actor_id
--   Clustering: ninguna (una fila por partición)

CREATE TABLE IF NOT EXISTS actors_by_id (
    actor_id          uuid,
    nombre            text,
    nacionalidad      text,
    fecha_nacimiento  date,
    edad              int,
    patrimonio        bigint,
    idiomas           set<text>,
    PRIMARY KEY (actor_id)
);


-- Tabla 2: actors_by_nationality
-- Consulta: actores de una nacionalidad ordenados por edad.
-- PRIMARY KEY: ((nacionalidad), edad, actor_id)
--   Clave de partición: nacionalidad
--   Clustering: edad (define el orden), actor_id (hace única la fila
--   cuando dos actores tienen la misma edad)
-- Datos duplicados respecto a actors_by_id: nombre, fecha_nacimiento,
-- patrimonio e idiomas.

CREATE TABLE IF NOT EXISTS actors_by_nationality (
    nacionalidad      text,
    edad              int,
    actor_id          uuid,
    nombre            text,
    fecha_nacimiento  date,
    patrimonio        bigint,
    idiomas           set<text>,
    PRIMARY KEY ((nacionalidad), edad, actor_id)
) WITH CLUSTERING ORDER BY (edad ASC, actor_id ASC);


-- Tabla 3: characters_by_actor
-- Consulta: personajes de un actor filtrando por rol y ordenados por
-- cantidad de apariciones.
-- PRIMARY KEY: ((actor_id), rol, apariciones, nombre_personaje)
--   Clave de partición: actor_id (todos los personajes del actor juntos)
--   Clustering: rol (permite filtrar por igualdad), apariciones (orden
--   descendente dentro de cada rol), nombre_personaje (unicidad)
-- nombre_actor es STATIC: se guarda una sola vez por partición.

CREATE TABLE IF NOT EXISTS characters_by_actor (
    actor_id          uuid,
    rol               text,
    apariciones       int,
    nombre_personaje  text,
    nombre_actor      text STATIC,
    produccion        text,
    tipo_produccion   text,
    generos           set<text>,
    PRIMARY KEY ((actor_id), rol, apariciones, nombre_personaje)
) WITH CLUSTERING ORDER BY (rol ASC, apariciones DESC, nombre_personaje ASC);
