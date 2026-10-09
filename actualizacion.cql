-- actualizacion.cql: Punto 4 - Actualización y datos desnormalizados.
--
-- Todos los actores participan en "Sansa Ball Race" y su patrimonio sube 32 %.
--
-- Ejecutar (guardando la evidencia en un archivo):
--   docker cp actualizacion.cql cassandra1:/tmp/actualizacion.cql
--   docker exec -it cassandra1 cqlsh -f /tmp/actualizacion.cql | tee evidencia.txt
--
-- NOTA: CQL no permite aritmética en el UPDATE (no existe
-- SET patrimonio = patrimonio * 1.32), por eso el nuevo patrimonio está
-- precalculado (patrimonio_actual * 1.32) para cada actor. Todos los
-- patrimonios son múltiplos de 1000, así que el resultado es exacto.
-- Como se escribe un valor absoluto, ejecutar el script dos veces NO aplica
-- el 32 % dos veces (UPDATE e INSERT son idempotentes).
--
-- Datos duplicados de patrimonio: actors_by_id y actors_by_nationality
-- (characters_by_actor no lo contiene). actors_by_nationality exige la clave
-- completa (nacionalidad, edad, actor_id) para localizar la fila.
-- Regla de participación: edad < 40  -> 'Principal',  3 apariciones
--                         edad >= 40 -> 'Secundario', 1 aparición

USE actors;

-- ======================================================================
-- EVIDENCIA: ANTES
-- ======================================================================
SELECT actor_id, nombre, edad, patrimonio FROM actors_by_id;
SELECT nacionalidad, edad, nombre, patrimonio FROM actors_by_nationality;
-- Personaje de Sansa Ball Race de cada actor, buscado por clave primaria
-- (actor_id + rol + apariciones + nombre_personaje), sin ALLOW FILTERING.
SELECT actor_id, nombre_actor, rol, apariciones, nombre_personaje, produccion
  FROM characters_by_actor
  WHERE actor_id IN (
    e7a82c20-e5e6-4f0c-9dd2-84e869616452, 951765da-b212-4b56-9945-2ba0d98d4098, 6a01977b-8873-4737-ace4-048f45d6ac42,
    a826c069-910a-4842-be37-2c51711166cd, 5479cbec-27e4-47b1-9878-c0bffb8ac7f1, 04ab140e-4144-498c-9c48-387188e6823d,
    0dbb8889-b167-444f-afc3-2fd32b155455, 8c53765f-4ec0-4954-bf8b-2a6aab74fe57, 1e47caa6-1f68-4c50-9e74-d6502980f7bd,
    40fc7f1b-5dbe-45b9-8f17-6b347b0dc700, c699d5ef-454b-48f8-9c7e-f9e3caaba2c9, 408e79ea-b3a2-459e-8f15-79f2445db505,
    8a89cf79-4b98-4f0b-8afc-59d6e61f1bf9, 7e9b56d2-f7ca-4132-a960-199b3982dbf3, adb21095-3bbb-492b-9924-eb8b75750c2b,
    192f09a9-cfd8-4364-aab4-2bd67528ea79, 7b9b3410-61b1-46f2-972e-6a6d79ef801b, 45e8f721-e301-4e25-b5cf-ef7f85616709,
    22867c53-f000-4394-b870-e4e1b093e3b4, 3f87175d-9c2a-4dc0-9978-98f0277b5be5, fd6cb580-ce21-426c-9b0c-6bb0cd3e91d5,
    2e608e3d-5c2e-4826-96f0-a1e4a91a562e, 44a23f65-9015-47c2-8b71-779491e0b539, 38ca6b4a-f85e-4bea-8eec-8bf97875a42b)
    AND rol IN ('Principal', 'Secundario')
    AND apariciones IN (1, 3)
    AND nombre_personaje = 'Sansa';
SELECT COUNT(*) FROM characters_by_actor;

-- ======================================================================
-- ACTUALIZACIÓN (un BATCH por actor: las 3 escrituras quedan atómicas)
-- ======================================================================

-- María Patricia González Silva (Chile, 41 años): 11,386,000 -> 15,029,520
BEGIN BATCH
  UPDATE actors_by_id SET patrimonio = 15029520 WHERE actor_id = e7a82c20-e5e6-4f0c-9dd2-84e869616452;
  UPDATE actors_by_nationality SET patrimonio = 15029520 WHERE nacionalidad = 'Chile' AND edad = 41 AND actor_id = e7a82c20-e5e6-4f0c-9dd2-84e869616452;
  INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (e7a82c20-e5e6-4f0c-9dd2-84e869616452, 'Secundario', 1, 'Sansa', 'María Patricia González Silva', 'Sansa Ball Race', 'Profesional', {'Animacion', 'Deportes', 'Aventura'});
APPLY BATCH;

-- Daniel Joaquín Villar Mena (Chile, 58 años): 10,992,000 -> 14,509,440
BEGIN BATCH
  UPDATE actors_by_id SET patrimonio = 14509440 WHERE actor_id = 951765da-b212-4b56-9945-2ba0d98d4098;
  UPDATE actors_by_nationality SET patrimonio = 14509440 WHERE nacionalidad = 'Chile' AND edad = 58 AND actor_id = 951765da-b212-4b56-9945-2ba0d98d4098;
  INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (951765da-b212-4b56-9945-2ba0d98d4098, 'Secundario', 1, 'Sansa', 'Daniel Joaquín Villar Mena', 'Sansa Ball Race', 'Profesional', {'Animacion', 'Deportes', 'Aventura'});
APPLY BATCH;

-- Catalina Camila Cáceres Dinamarca (Chile, 38 años): 6,961,000 -> 9,188,520
BEGIN BATCH
  UPDATE actors_by_id SET patrimonio = 9188520 WHERE actor_id = 6a01977b-8873-4737-ace4-048f45d6ac42;
  UPDATE actors_by_nationality SET patrimonio = 9188520 WHERE nacionalidad = 'Chile' AND edad = 38 AND actor_id = 6a01977b-8873-4737-ace4-048f45d6ac42;
  INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (6a01977b-8873-4737-ace4-048f45d6ac42, 'Principal', 3, 'Sansa', 'Catalina Camila Cáceres Dinamarca', 'Sansa Ball Race', 'Profesional', {'Animacion', 'Deportes', 'Aventura'});
APPLY BATCH;

-- Lorenzo Ignacio Gomez (Argentina, 22 años): 4,515,000 -> 5,959,800
BEGIN BATCH
  UPDATE actors_by_id SET patrimonio = 5959800 WHERE actor_id = a826c069-910a-4842-be37-2c51711166cd;
  UPDATE actors_by_nationality SET patrimonio = 5959800 WHERE nacionalidad = 'Argentina' AND edad = 22 AND actor_id = a826c069-910a-4842-be37-2c51711166cd;
  INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (a826c069-910a-4842-be37-2c51711166cd, 'Principal', 3, 'Sansa', 'Lorenzo Ignacio Gomez', 'Sansa Ball Race', 'Profesional', {'Animacion', 'Deportes', 'Aventura'});
APPLY BATCH;

-- Terri Clark (Estados Unidos, 28 años): 11,178,000 -> 14,754,960
BEGIN BATCH
  UPDATE actors_by_id SET patrimonio = 14754960 WHERE actor_id = 5479cbec-27e4-47b1-9878-c0bffb8ac7f1;
  UPDATE actors_by_nationality SET patrimonio = 14754960 WHERE nacionalidad = 'Estados Unidos' AND edad = 28 AND actor_id = 5479cbec-27e4-47b1-9878-c0bffb8ac7f1;
  INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (5479cbec-27e4-47b1-9878-c0bffb8ac7f1, 'Principal', 3, 'Sansa', 'Terri Clark', 'Sansa Ball Race', 'Profesional', {'Animacion', 'Deportes', 'Aventura'});
APPLY BATCH;

-- Brayan Sá (Brasil, 55 años): 10,012,000 -> 13,215,840
BEGIN BATCH
  UPDATE actors_by_id SET patrimonio = 13215840 WHERE actor_id = 04ab140e-4144-498c-9c48-387188e6823d;
  UPDATE actors_by_nationality SET patrimonio = 13215840 WHERE nacionalidad = 'Brasil' AND edad = 55 AND actor_id = 04ab140e-4144-498c-9c48-387188e6823d;
  INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (04ab140e-4144-498c-9c48-387188e6823d, 'Secundario', 1, 'Sansa', 'Brayan Sá', 'Sansa Ball Race', 'Profesional', {'Animacion', 'Deportes', 'Aventura'});
APPLY BATCH;

-- Melanie Gutierrez (Estados Unidos, 40 años): 10,353,000 -> 13,665,960
BEGIN BATCH
  UPDATE actors_by_id SET patrimonio = 13665960 WHERE actor_id = 0dbb8889-b167-444f-afc3-2fd32b155455;
  UPDATE actors_by_nationality SET patrimonio = 13665960 WHERE nacionalidad = 'Estados Unidos' AND edad = 40 AND actor_id = 0dbb8889-b167-444f-afc3-2fd32b155455;
  INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (0dbb8889-b167-444f-afc3-2fd32b155455, 'Secundario', 1, 'Sansa', 'Melanie Gutierrez', 'Sansa Ball Race', 'Profesional', {'Animacion', 'Deportes', 'Aventura'});
APPLY BATCH;

-- Josefa Brenda Alarcón Álvarez (Chile, 23 años): 4,557,000 -> 6,015,240
BEGIN BATCH
  UPDATE actors_by_id SET patrimonio = 6015240 WHERE actor_id = 8c53765f-4ec0-4954-bf8b-2a6aab74fe57;
  UPDATE actors_by_nationality SET patrimonio = 6015240 WHERE nacionalidad = 'Chile' AND edad = 23 AND actor_id = 8c53765f-4ec0-4954-bf8b-2a6aab74fe57;
  INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (8c53765f-4ec0-4954-bf8b-2a6aab74fe57, 'Principal', 3, 'Sansa', 'Josefa Brenda Alarcón Álvarez', 'Sansa Ball Race', 'Profesional', {'Animacion', 'Deportes', 'Aventura'});
APPLY BATCH;

-- Julio Pierre Tapia Gallardo (Chile, 45 años): 2,219,000 -> 2,929,080
BEGIN BATCH
  UPDATE actors_by_id SET patrimonio = 2929080 WHERE actor_id = 1e47caa6-1f68-4c50-9e74-d6502980f7bd;
  UPDATE actors_by_nationality SET patrimonio = 2929080 WHERE nacionalidad = 'Chile' AND edad = 45 AND actor_id = 1e47caa6-1f68-4c50-9e74-d6502980f7bd;
  INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (1e47caa6-1f68-4c50-9e74-d6502980f7bd, 'Secundario', 1, 'Sansa', 'Julio Pierre Tapia Gallardo', 'Sansa Ball Race', 'Profesional', {'Animacion', 'Deportes', 'Aventura'});
APPLY BATCH;

-- Julie Richardson (Estados Unidos, 30 años): 8,543,000 -> 11,276,760
BEGIN BATCH
  UPDATE actors_by_id SET patrimonio = 11276760 WHERE actor_id = 40fc7f1b-5dbe-45b9-8f17-6b347b0dc700;
  UPDATE actors_by_nationality SET patrimonio = 11276760 WHERE nacionalidad = 'Estados Unidos' AND edad = 30 AND actor_id = 40fc7f1b-5dbe-45b9-8f17-6b347b0dc700;
  INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (40fc7f1b-5dbe-45b9-8f17-6b347b0dc700, 'Principal', 3, 'Sansa', 'Julie Richardson', 'Sansa Ball Race', 'Profesional', {'Animacion', 'Deportes', 'Aventura'});
APPLY BATCH;

-- Carla Noemí Melgar Narváez (Mexico, 36 años): 10,813,000 -> 14,273,160
BEGIN BATCH
  UPDATE actors_by_id SET patrimonio = 14273160 WHERE actor_id = c699d5ef-454b-48f8-9c7e-f9e3caaba2c9;
  UPDATE actors_by_nationality SET patrimonio = 14273160 WHERE nacionalidad = 'Mexico' AND edad = 36 AND actor_id = c699d5ef-454b-48f8-9c7e-f9e3caaba2c9;
  INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (c699d5ef-454b-48f8-9c7e-f9e3caaba2c9, 'Principal', 3, 'Sansa', 'Carla Noemí Melgar Narváez', 'Sansa Ball Race', 'Profesional', {'Animacion', 'Deportes', 'Aventura'});
APPLY BATCH;

-- Florencio Ribera Tamarit (España, 25 años): 8,062,000 -> 10,641,840
BEGIN BATCH
  UPDATE actors_by_id SET patrimonio = 10641840 WHERE actor_id = 408e79ea-b3a2-459e-8f15-79f2445db505;
  UPDATE actors_by_nationality SET patrimonio = 10641840 WHERE nacionalidad = 'España' AND edad = 25 AND actor_id = 408e79ea-b3a2-459e-8f15-79f2445db505;
  INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (408e79ea-b3a2-459e-8f15-79f2445db505, 'Principal', 3, 'Sansa', 'Florencio Ribera Tamarit', 'Sansa Ball Race', 'Profesional', {'Animacion', 'Deportes', 'Aventura'});
APPLY BATCH;

-- Sergio Anderson Osorio Bastías (Chile, 63 años): 10,763,000 -> 14,207,160
BEGIN BATCH
  UPDATE actors_by_id SET patrimonio = 14207160 WHERE actor_id = 8a89cf79-4b98-4f0b-8afc-59d6e61f1bf9;
  UPDATE actors_by_nationality SET patrimonio = 14207160 WHERE nacionalidad = 'Chile' AND edad = 63 AND actor_id = 8a89cf79-4b98-4f0b-8afc-59d6e61f1bf9;
  INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (8a89cf79-4b98-4f0b-8afc-59d6e61f1bf9, 'Secundario', 1, 'Sansa', 'Sergio Anderson Osorio Bastías', 'Sansa Ball Race', 'Profesional', {'Animacion', 'Deportes', 'Aventura'});
APPLY BATCH;

-- Christopher Braun (Estados Unidos, 44 años): 7,063,000 -> 9,323,160
BEGIN BATCH
  UPDATE actors_by_id SET patrimonio = 9323160 WHERE actor_id = 7e9b56d2-f7ca-4132-a960-199b3982dbf3;
  UPDATE actors_by_nationality SET patrimonio = 9323160 WHERE nacionalidad = 'Estados Unidos' AND edad = 44 AND actor_id = 7e9b56d2-f7ca-4132-a960-199b3982dbf3;
  INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (7e9b56d2-f7ca-4132-a960-199b3982dbf3, 'Secundario', 1, 'Sansa', 'Christopher Braun', 'Sansa Ball Race', 'Profesional', {'Animacion', 'Deportes', 'Aventura'});
APPLY BATCH;

-- María Julieta Hernández Calderón (Chile, 34 años): 939,000 -> 1,239,480
BEGIN BATCH
  UPDATE actors_by_id SET patrimonio = 1239480 WHERE actor_id = adb21095-3bbb-492b-9924-eb8b75750c2b;
  UPDATE actors_by_nationality SET patrimonio = 1239480 WHERE nacionalidad = 'Chile' AND edad = 34 AND actor_id = adb21095-3bbb-492b-9924-eb8b75750c2b;
  INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (adb21095-3bbb-492b-9924-eb8b75750c2b, 'Principal', 3, 'Sansa', 'María Julieta Hernández Calderón', 'Sansa Ball Race', 'Profesional', {'Animacion', 'Deportes', 'Aventura'});
APPLY BATCH;

-- Andy Castro Aliaga (Chile, 27 años): 3,149,000 -> 4,156,680
BEGIN BATCH
  UPDATE actors_by_id SET patrimonio = 4156680 WHERE actor_id = 192f09a9-cfd8-4364-aab4-2bd67528ea79;
  UPDATE actors_by_nationality SET patrimonio = 4156680 WHERE nacionalidad = 'Chile' AND edad = 27 AND actor_id = 192f09a9-cfd8-4364-aab4-2bd67528ea79;
  INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (192f09a9-cfd8-4364-aab4-2bd67528ea79, 'Principal', 3, 'Sansa', 'Andy Castro Aliaga', 'Sansa Ball Race', 'Profesional', {'Animacion', 'Deportes', 'Aventura'});
APPLY BATCH;

-- Kathryn Robinson (Estados Unidos, 61 años): 707,000 -> 933,240
BEGIN BATCH
  UPDATE actors_by_id SET patrimonio = 933240 WHERE actor_id = 7b9b3410-61b1-46f2-972e-6a6d79ef801b;
  UPDATE actors_by_nationality SET patrimonio = 933240 WHERE nacionalidad = 'Estados Unidos' AND edad = 61 AND actor_id = 7b9b3410-61b1-46f2-972e-6a6d79ef801b;
  INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (7b9b3410-61b1-46f2-972e-6a6d79ef801b, 'Secundario', 1, 'Sansa', 'Kathryn Robinson', 'Sansa Ball Race', 'Profesional', {'Animacion', 'Deportes', 'Aventura'});
APPLY BATCH;

-- Katherine Taylor (Estados Unidos, 49 años): 2,509,000 -> 3,311,880
BEGIN BATCH
  UPDATE actors_by_id SET patrimonio = 3311880 WHERE actor_id = 45e8f721-e301-4e25-b5cf-ef7f85616709;
  UPDATE actors_by_nationality SET patrimonio = 3311880 WHERE nacionalidad = 'Estados Unidos' AND edad = 49 AND actor_id = 45e8f721-e301-4e25-b5cf-ef7f85616709;
  INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (45e8f721-e301-4e25-b5cf-ef7f85616709, 'Secundario', 1, 'Sansa', 'Katherine Taylor', 'Sansa Ball Race', 'Profesional', {'Animacion', 'Deportes', 'Aventura'});
APPLY BATCH;

-- Rosa Angélica Uribe Álvarez (Chile, 31 años): 6,994,000 -> 9,232,080
BEGIN BATCH
  UPDATE actors_by_id SET patrimonio = 9232080 WHERE actor_id = 22867c53-f000-4394-b870-e4e1b093e3b4;
  UPDATE actors_by_nationality SET patrimonio = 9232080 WHERE nacionalidad = 'Chile' AND edad = 31 AND actor_id = 22867c53-f000-4394-b870-e4e1b093e3b4;
  INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (22867c53-f000-4394-b870-e4e1b093e3b4, 'Principal', 3, 'Sansa', 'Rosa Angélica Uribe Álvarez', 'Sansa Ball Race', 'Profesional', {'Animacion', 'Deportes', 'Aventura'});
APPLY BATCH;

-- Alejandro Benavides-Gálvez Molina (Chile, 70 años): 10,258,000 -> 13,540,560
BEGIN BATCH
  UPDATE actors_by_id SET patrimonio = 13540560 WHERE actor_id = 3f87175d-9c2a-4dc0-9978-98f0277b5be5;
  UPDATE actors_by_nationality SET patrimonio = 13540560 WHERE nacionalidad = 'Chile' AND edad = 70 AND actor_id = 3f87175d-9c2a-4dc0-9978-98f0277b5be5;
  INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (3f87175d-9c2a-4dc0-9978-98f0277b5be5, 'Secundario', 1, 'Sansa', 'Alejandro Benavides-Gálvez Molina', 'Sansa Ball Race', 'Profesional', {'Animacion', 'Deportes', 'Aventura'});
APPLY BATCH;

-- William Sanchez (Estados Unidos, 67 años): 987,000 -> 1,302,840
BEGIN BATCH
  UPDATE actors_by_id SET patrimonio = 1302840 WHERE actor_id = fd6cb580-ce21-426c-9b0c-6bb0cd3e91d5;
  UPDATE actors_by_nationality SET patrimonio = 1302840 WHERE nacionalidad = 'Estados Unidos' AND edad = 67 AND actor_id = fd6cb580-ce21-426c-9b0c-6bb0cd3e91d5;
  INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (fd6cb580-ce21-426c-9b0c-6bb0cd3e91d5, 'Secundario', 1, 'Sansa', 'William Sanchez', 'Sansa Ball Race', 'Profesional', {'Animacion', 'Deportes', 'Aventura'});
APPLY BATCH;

-- Constantino Guzman Lopez (Argentina, 33 años): 4,368,000 -> 5,765,760
BEGIN BATCH
  UPDATE actors_by_id SET patrimonio = 5765760 WHERE actor_id = 2e608e3d-5c2e-4826-96f0-a1e4a91a562e;
  UPDATE actors_by_nationality SET patrimonio = 5765760 WHERE nacionalidad = 'Argentina' AND edad = 33 AND actor_id = 2e608e3d-5c2e-4826-96f0-a1e4a91a562e;
  INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (2e608e3d-5c2e-4826-96f0-a1e4a91a562e, 'Principal', 3, 'Sansa', 'Constantino Guzman Lopez', 'Sansa Ball Race', 'Profesional', {'Animacion', 'Deportes', 'Aventura'});
APPLY BATCH;

-- Mia Ana Alarcón Rodríguez (Chile, 39 años): 1,140,000 -> 1,504,800
BEGIN BATCH
  UPDATE actors_by_id SET patrimonio = 1504800 WHERE actor_id = 44a23f65-9015-47c2-8b71-779491e0b539;
  UPDATE actors_by_nationality SET patrimonio = 1504800 WHERE nacionalidad = 'Chile' AND edad = 39 AND actor_id = 44a23f65-9015-47c2-8b71-779491e0b539;
  INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (44a23f65-9015-47c2-8b71-779491e0b539, 'Principal', 3, 'Sansa', 'Mia Ana Alarcón Rodríguez', 'Sansa Ball Race', 'Profesional', {'Animacion', 'Deportes', 'Aventura'});
APPLY BATCH;

-- Uberlinda Lizana (Chile, 52 años): 6,688,000 -> 8,828,160
BEGIN BATCH
  UPDATE actors_by_id SET patrimonio = 8828160 WHERE actor_id = 38ca6b4a-f85e-4bea-8eec-8bf97875a42b;
  UPDATE actors_by_nationality SET patrimonio = 8828160 WHERE nacionalidad = 'Chile' AND edad = 52 AND actor_id = 38ca6b4a-f85e-4bea-8eec-8bf97875a42b;
  INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (38ca6b4a-f85e-4bea-8eec-8bf97875a42b, 'Secundario', 1, 'Sansa', 'Uberlinda Lizana', 'Sansa Ball Race', 'Profesional', {'Animacion', 'Deportes', 'Aventura'});
APPLY BATCH;

-- ======================================================================
-- EVIDENCIA: DESPUÉS
-- ======================================================================
SELECT actor_id, nombre, edad, patrimonio FROM actors_by_id;
SELECT nacionalidad, edad, nombre, patrimonio FROM actors_by_nationality;
-- Personaje de Sansa Ball Race de cada actor, buscado por clave primaria
-- (actor_id + rol + apariciones + nombre_personaje), sin ALLOW FILTERING.
SELECT actor_id, nombre_actor, rol, apariciones, nombre_personaje, produccion
  FROM characters_by_actor
  WHERE actor_id IN (
    e7a82c20-e5e6-4f0c-9dd2-84e869616452, 951765da-b212-4b56-9945-2ba0d98d4098, 6a01977b-8873-4737-ace4-048f45d6ac42,
    a826c069-910a-4842-be37-2c51711166cd, 5479cbec-27e4-47b1-9878-c0bffb8ac7f1, 04ab140e-4144-498c-9c48-387188e6823d,
    0dbb8889-b167-444f-afc3-2fd32b155455, 8c53765f-4ec0-4954-bf8b-2a6aab74fe57, 1e47caa6-1f68-4c50-9e74-d6502980f7bd,
    40fc7f1b-5dbe-45b9-8f17-6b347b0dc700, c699d5ef-454b-48f8-9c7e-f9e3caaba2c9, 408e79ea-b3a2-459e-8f15-79f2445db505,
    8a89cf79-4b98-4f0b-8afc-59d6e61f1bf9, 7e9b56d2-f7ca-4132-a960-199b3982dbf3, adb21095-3bbb-492b-9924-eb8b75750c2b,
    192f09a9-cfd8-4364-aab4-2bd67528ea79, 7b9b3410-61b1-46f2-972e-6a6d79ef801b, 45e8f721-e301-4e25-b5cf-ef7f85616709,
    22867c53-f000-4394-b870-e4e1b093e3b4, 3f87175d-9c2a-4dc0-9978-98f0277b5be5, fd6cb580-ce21-426c-9b0c-6bb0cd3e91d5,
    2e608e3d-5c2e-4826-96f0-a1e4a91a562e, 44a23f65-9015-47c2-8b71-779491e0b539, 38ca6b4a-f85e-4bea-8eec-8bf97875a42b)
    AND rol IN ('Principal', 'Secundario')
    AND apariciones IN (1, 3)
    AND nombre_personaje = 'Sansa';
SELECT COUNT(*) FROM characters_by_actor;
