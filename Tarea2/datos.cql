USE actors;

-- María Patricia González Silva (Chile, 41 años)
INSERT INTO actors_by_id (actor_id, nombre, nacionalidad, fecha_nacimiento, edad, patrimonio, idiomas) VALUES (e7a82c20-e5e6-4f0c-9dd2-84e869616452, 'María Patricia González Silva', 'Chile', '1985-06-14', 41, 11386000, {'Español', 'Portugues'});
INSERT INTO actors_by_nationality (nacionalidad, edad, actor_id, nombre, fecha_nacimiento, patrimonio, idiomas) VALUES ('Chile', 41, e7a82c20-e5e6-4f0c-9dd2-84e869616452, 'María Patricia González Silva', '1985-06-14', 11386000, {'Español', 'Portugues'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (e7a82c20-e5e6-4f0c-9dd2-84e869616452, 'Principal', 34, 'Mauricio', 'María Patricia González Silva', 'Girona 2196', 'Independiente', {'Aventura', 'Accion'});

-- Daniel Joaquín Villar Mena (Chile, 58 años)
INSERT INTO actors_by_id (actor_id, nombre, nacionalidad, fecha_nacimiento, edad, patrimonio, idiomas) VALUES (951765da-b212-4b56-9945-2ba0d98d4098, 'Daniel Joaquín Villar Mena', 'Chile', '1968-05-12', 58, 10992000, {'Español', 'Frances', 'Portugues'});
INSERT INTO actors_by_nationality (nacionalidad, edad, actor_id, nombre, fecha_nacimiento, patrimonio, idiomas) VALUES ('Chile', 58, 951765da-b212-4b56-9945-2ba0d98d4098, 'Daniel Joaquín Villar Mena', '1968-05-12', 10992000, {'Español', 'Frances', 'Portugues'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (951765da-b212-4b56-9945-2ba0d98d4098, 'Extra', 104, 'Eugenia', 'Daniel Joaquín Villar Mena', 'Lleida 2158', 'Independiente', {'Misterio', 'Fantasia'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (951765da-b212-4b56-9945-2ba0d98d4098, 'Principal', 46, 'Claudia', 'Daniel Joaquín Villar Mena', 'Escuadron Bisque', 'Independiente', {'Terror', 'Accion', 'Comedia'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (951765da-b212-4b56-9945-2ba0d98d4098, 'Principal', 92, 'Miguel', 'Daniel Joaquín Villar Mena', 'La Leyenda de Lupe', 'Independiente', {'Aventura', 'Accion', 'Drama'});

-- Catalina Camila Cáceres Dinamarca (Chile, 38 años)
INSERT INTO actors_by_id (actor_id, nombre, nacionalidad, fecha_nacimiento, edad, patrimonio, idiomas) VALUES (6a01977b-8873-4737-ace4-048f45d6ac42, 'Catalina Camila Cáceres Dinamarca', 'Chile', '1988-04-11', 38, 6961000, {'Español', 'Portugues'});
INSERT INTO actors_by_nationality (nacionalidad, edad, actor_id, nombre, fecha_nacimiento, patrimonio, idiomas) VALUES ('Chile', 38, 6a01977b-8873-4737-ace4-048f45d6ac42, 'Catalina Camila Cáceres Dinamarca', '1988-04-11', 6961000, {'Español', 'Portugues'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (6a01977b-8873-4737-ace4-048f45d6ac42, 'Principal', 85, 'Luisa', 'Catalina Camila Cáceres Dinamarca', 'El Ultimo Villanueva', 'Profesional', {'Terror'});

-- Lorenzo Ignacio Gomez (Argentina, 22 años)
INSERT INTO actors_by_id (actor_id, nombre, nacionalidad, fecha_nacimiento, edad, patrimonio, idiomas) VALUES (a826c069-910a-4842-be37-2c51711166cd, 'Lorenzo Ignacio Gomez', 'Argentina', '2004-02-19', 22, 4515000, {'Español', 'Ingles'});
INSERT INTO actors_by_nationality (nacionalidad, edad, actor_id, nombre, fecha_nacimiento, patrimonio, idiomas) VALUES ('Argentina', 22, a826c069-910a-4842-be37-2c51711166cd, 'Lorenzo Ignacio Gomez', '2004-02-19', 4515000, {'Español', 'Ingles'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (a826c069-910a-4842-be37-2c51711166cd, 'Secundario', 88, 'Dionisio', 'Lorenzo Ignacio Gomez', 'La Leyenda de Aurelia', 'Profesional', {'Misterio', 'Ciencia Ficcion'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (a826c069-910a-4842-be37-2c51711166cd, 'Secundario', 97, 'Bautista', 'Lorenzo Ignacio Gomez', 'Cronicas de Vizcaya', 'Independiente', {'Drama', 'Comedia', 'Ciencia Ficcion'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (a826c069-910a-4842-be37-2c51711166cd, 'Extra', 85, 'Antonia', 'Lorenzo Ignacio Gomez', 'La Leyenda de Natanael', 'Independiente', {'Terror', 'Ciencia Ficcion'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (a826c069-910a-4842-be37-2c51711166cd, 'Secundario', 53, 'Santiago', 'Lorenzo Ignacio Gomez', 'Escuadron Cian clarto', 'Independiente', {'Terror', 'Drama', 'Comedia'});

-- Terri Clark (Estados Unidos, 28 años)
INSERT INTO actors_by_id (actor_id, nombre, nacionalidad, fecha_nacimiento, edad, patrimonio, idiomas) VALUES (5479cbec-27e4-47b1-9878-c0bffb8ac7f1, 'Terri Clark', 'Estados Unidos', '1997-10-21', 28, 11178000, {'Ingles'});
INSERT INTO actors_by_nationality (nacionalidad, edad, actor_id, nombre, fecha_nacimiento, patrimonio, idiomas) VALUES ('Estados Unidos', 28, 5479cbec-27e4-47b1-9878-c0bffb8ac7f1, 'Terri Clark', '1997-10-21', 11178000, {'Ingles'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (5479cbec-27e4-47b1-9878-c0bffb8ac7f1, 'Principal', 100, 'Dionisio', 'Terri Clark', 'Proyecto Leiva', 'Independiente', {'Romance'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (5479cbec-27e4-47b1-9878-c0bffb8ac7f1, 'Principal', 72, 'Leonel', 'Terri Clark', 'La Leyenda de Eva María', 'Independiente', {'Drama', 'Deportes', 'Accion'});

-- Brayan Sá (Brasil, 55 años)
INSERT INTO actors_by_id (actor_id, nombre, nacionalidad, fecha_nacimiento, edad, patrimonio, idiomas) VALUES (04ab140e-4144-498c-9c48-387188e6823d, 'Brayan Sá', 'Brasil', '1971-04-02', 55, 10012000, {'Portugues', 'Frances'});
INSERT INTO actors_by_nationality (nacionalidad, edad, actor_id, nombre, fecha_nacimiento, patrimonio, idiomas) VALUES ('Brasil', 55, 04ab140e-4144-498c-9c48-387188e6823d, 'Brayan Sá', '1971-04-02', 10012000, {'Portugues', 'Frances'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (04ab140e-4144-498c-9c48-387188e6823d, 'Secundario', 88, 'Evita', 'Brayan Sá', 'La Leyenda de Atilio', 'Independiente', {'Romance'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (04ab140e-4144-498c-9c48-387188e6823d, 'Secundario', 38, 'Osvaldo', 'Brayan Sá', 'La Leyenda de Paola', 'Profesional', {'Aventura'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (04ab140e-4144-498c-9c48-387188e6823d, 'Secundario', 103, 'Ariel', 'Brayan Sá', 'Cronicas de Ourense', 'Profesional', {'Misterio', 'Romance', 'Deportes'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (04ab140e-4144-498c-9c48-387188e6823d, 'Principal', 14, 'Alfredo', 'Brayan Sá', 'El Ultimo Montalbán', 'Profesional', {'Aventura', 'Comedia'});

-- Melanie Gutierrez (Estados Unidos, 40 años)
INSERT INTO actors_by_id (actor_id, nombre, nacionalidad, fecha_nacimiento, edad, patrimonio, idiomas) VALUES (0dbb8889-b167-444f-afc3-2fd32b155455, 'Melanie Gutierrez', 'Estados Unidos', '1986-06-02', 40, 10353000, {'Ingles', 'Italiano'});
INSERT INTO actors_by_nationality (nacionalidad, edad, actor_id, nombre, fecha_nacimiento, patrimonio, idiomas) VALUES ('Estados Unidos', 40, 0dbb8889-b167-444f-afc3-2fd32b155455, 'Melanie Gutierrez', '1986-06-02', 10353000, {'Ingles', 'Italiano'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (0dbb8889-b167-444f-afc3-2fd32b155455, 'Principal', 103, 'Catherine', 'Melanie Gutierrez', 'Proyecto Coronado', 'Profesional', {'Misterio', 'Accion', 'Deportes'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (0dbb8889-b167-444f-afc3-2fd32b155455, 'Extra', 89, 'Kristine', 'Melanie Gutierrez', 'Noches en Barcelona', 'Independiente', {'Comedia', 'Romance'});

-- Josefa Brenda Alarcón Álvarez (Chile, 23 años)
INSERT INTO actors_by_id (actor_id, nombre, nacionalidad, fecha_nacimiento, edad, patrimonio, idiomas) VALUES (8c53765f-4ec0-4954-bf8b-2a6aab74fe57, 'Josefa Brenda Alarcón Álvarez', 'Chile', '2003-01-08', 23, 4557000, {'Español', 'Japones', 'Italiano'});
INSERT INTO actors_by_nationality (nacionalidad, edad, actor_id, nombre, fecha_nacimiento, patrimonio, idiomas) VALUES ('Chile', 23, 8c53765f-4ec0-4954-bf8b-2a6aab74fe57, 'Josefa Brenda Alarcón Álvarez', '2003-01-08', 4557000, {'Español', 'Japones', 'Italiano'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (8c53765f-4ec0-4954-bf8b-2a6aab74fe57, 'Principal', 2, 'Alonso', 'Josefa Brenda Alarcón Álvarez', 'Cronicas de Badajoz', 'Independiente', {'Romance', 'Ciencia Ficcion', 'Drama'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (8c53765f-4ec0-4954-bf8b-2a6aab74fe57, 'Principal', 93, 'José', 'Josefa Brenda Alarcón Álvarez', 'Zaragoza 2125', 'Profesional', {'Aventura', 'Deportes'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (8c53765f-4ec0-4954-bf8b-2a6aab74fe57, 'Principal', 4, 'Luís', 'Josefa Brenda Alarcón Álvarez', 'Burgos 2189', 'Independiente', {'Ciencia Ficcion', 'Misterio', 'Romance'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (8c53765f-4ec0-4954-bf8b-2a6aab74fe57, 'Principal', 55, 'Alejandra', 'Josefa Brenda Alarcón Álvarez', 'La Leyenda de Casandra', 'Independiente', {'Misterio', 'Romance', 'Terror'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (8c53765f-4ec0-4954-bf8b-2a6aab74fe57, 'Extra', 67, 'Juan', 'Josefa Brenda Alarcón Álvarez', 'Noches en Ourense', 'Independiente', {'Misterio'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (8c53765f-4ec0-4954-bf8b-2a6aab74fe57, 'Extra', 80, 'Jesús', 'Josefa Brenda Alarcón Álvarez', 'Noches en Teruel', 'Profesional', {'Romance', 'Comedia'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (8c53765f-4ec0-4954-bf8b-2a6aab74fe57, 'Extra', 61, 'Soledad', 'Josefa Brenda Alarcón Álvarez', 'El Ultimo Carro', 'Independiente', {'Deportes', 'Fantasia', 'Terror'});

-- Julio Pierre Tapia Gallardo (Chile, 45 años)
INSERT INTO actors_by_id (actor_id, nombre, nacionalidad, fecha_nacimiento, edad, patrimonio, idiomas) VALUES (1e47caa6-1f68-4c50-9e74-d6502980f7bd, 'Julio Pierre Tapia Gallardo', 'Chile', '1981-02-06', 45, 2219000, {'Español', 'Italiano', 'Frances'});
INSERT INTO actors_by_nationality (nacionalidad, edad, actor_id, nombre, fecha_nacimiento, patrimonio, idiomas) VALUES ('Chile', 45, 1e47caa6-1f68-4c50-9e74-d6502980f7bd, 'Julio Pierre Tapia Gallardo', '1981-02-06', 2219000, {'Español', 'Italiano', 'Frances'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (1e47caa6-1f68-4c50-9e74-d6502980f7bd, 'Secundario', 78, 'Eufemia', 'Julio Pierre Tapia Gallardo', 'Proyecto Arellano', 'Independiente', {'Misterio'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (1e47caa6-1f68-4c50-9e74-d6502980f7bd, 'Extra', 88, 'Teodosio', 'Julio Pierre Tapia Gallardo', 'Proyecto Carreras', 'Independiente', {'Terror', 'Fantasia'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (1e47caa6-1f68-4c50-9e74-d6502980f7bd, 'Secundario', 89, 'María', 'Julio Pierre Tapia Gallardo', 'Proyecto Rueda', 'Profesional', {'Fantasia', 'Aventura'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (1e47caa6-1f68-4c50-9e74-d6502980f7bd, 'Principal', 72, 'Michael', 'Julio Pierre Tapia Gallardo', 'Murcia 2199', 'Independiente', {'Aventura'});

-- Julie Richardson (Estados Unidos, 30 años)
INSERT INTO actors_by_id (actor_id, nombre, nacionalidad, fecha_nacimiento, edad, patrimonio, idiomas) VALUES (40fc7f1b-5dbe-45b9-8f17-6b347b0dc700, 'Julie Richardson', 'Estados Unidos', '1996-07-06', 30, 8543000, {'Ingles'});
INSERT INTO actors_by_nationality (nacionalidad, edad, actor_id, nombre, fecha_nacimiento, patrimonio, idiomas) VALUES ('Estados Unidos', 30, 40fc7f1b-5dbe-45b9-8f17-6b347b0dc700, 'Julie Richardson', '1996-07-06', 8543000, {'Ingles'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (40fc7f1b-5dbe-45b9-8f17-6b347b0dc700, 'Principal', 4, 'Ashley', 'Julie Richardson', 'Proyecto Vélez', 'Profesional', {'Terror', 'Accion'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (40fc7f1b-5dbe-45b9-8f17-6b347b0dc700, 'Extra', 85, 'Andrea', 'Julie Richardson', 'La Leyenda de Jerónimo', 'Independiente', {'Ciencia Ficcion', 'Misterio'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (40fc7f1b-5dbe-45b9-8f17-6b347b0dc700, 'Principal', 83, 'Catherine', 'Julie Richardson', 'Guadalajara 2184', 'Independiente', {'Comedia', 'Accion'});

-- Carla Noemí Melgar Narváez (Mexico, 36 años)
INSERT INTO actors_by_id (actor_id, nombre, nacionalidad, fecha_nacimiento, edad, patrimonio, idiomas) VALUES (c699d5ef-454b-48f8-9c7e-f9e3caaba2c9, 'Carla Noemí Melgar Narváez', 'Mexico', '1990-06-08', 36, 10813000, {'Español', 'Italiano', 'Japones'});
INSERT INTO actors_by_nationality (nacionalidad, edad, actor_id, nombre, fecha_nacimiento, patrimonio, idiomas) VALUES ('Mexico', 36, c699d5ef-454b-48f8-9c7e-f9e3caaba2c9, 'Carla Noemí Melgar Narváez', '1990-06-08', 10813000, {'Español', 'Italiano', 'Japones'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (c699d5ef-454b-48f8-9c7e-f9e3caaba2c9, 'Secundario', 66, 'Iker', 'Carla Noemí Melgar Narváez', 'Cronicas de Ciudad', 'Profesional', {'Comedia', 'Deportes', 'Drama'});

-- Florencio Ribera Tamarit (España, 25 años)
INSERT INTO actors_by_id (actor_id, nombre, nacionalidad, fecha_nacimiento, edad, patrimonio, idiomas) VALUES (408e79ea-b3a2-459e-8f15-79f2445db505, 'Florencio Ribera Tamarit', 'España', '2000-12-02', 25, 8062000, {'Español', 'Frances'});
INSERT INTO actors_by_nationality (nacionalidad, edad, actor_id, nombre, fecha_nacimiento, patrimonio, idiomas) VALUES ('España', 25, 408e79ea-b3a2-459e-8f15-79f2445db505, 'Florencio Ribera Tamarit', '2000-12-02', 8062000, {'Español', 'Frances'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (408e79ea-b3a2-459e-8f15-79f2445db505, 'Secundario', 74, 'Natanael', 'Florencio Ribera Tamarit', 'El Ultimo Casal', 'Independiente', {'Terror', 'Misterio'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (408e79ea-b3a2-459e-8f15-79f2445db505, 'Secundario', 13, 'Carmela', 'Florencio Ribera Tamarit', 'Proyecto Mur', 'Independiente', {'Romance', 'Deportes', 'Drama'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (408e79ea-b3a2-459e-8f15-79f2445db505, 'Secundario', 93, 'Pastor', 'Florencio Ribera Tamarit', 'Proyecto Murillo', 'Profesional', {'Accion'});

-- Sergio Anderson Osorio Bastías (Chile, 63 años)
INSERT INTO actors_by_id (actor_id, nombre, nacionalidad, fecha_nacimiento, edad, patrimonio, idiomas) VALUES (8a89cf79-4b98-4f0b-8afc-59d6e61f1bf9, 'Sergio Anderson Osorio Bastías', 'Chile', '1963-04-22', 63, 10763000, {'Español'});
INSERT INTO actors_by_nationality (nacionalidad, edad, actor_id, nombre, fecha_nacimiento, patrimonio, idiomas) VALUES ('Chile', 63, 8a89cf79-4b98-4f0b-8afc-59d6e61f1bf9, 'Sergio Anderson Osorio Bastías', '1963-04-22', 10763000, {'Español'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (8a89cf79-4b98-4f0b-8afc-59d6e61f1bf9, 'Secundario', 6, 'Carlos', 'Sergio Anderson Osorio Bastías', 'Escuadron Marrón siena', 'Independiente', {'Misterio', 'Drama', 'Comedia'});

-- Christopher Braun (Estados Unidos, 44 años)
INSERT INTO actors_by_id (actor_id, nombre, nacionalidad, fecha_nacimiento, edad, patrimonio, idiomas) VALUES (7e9b56d2-f7ca-4132-a960-199b3982dbf3, 'Christopher Braun', 'Estados Unidos', '1981-10-18', 44, 7063000, {'Ingles', 'Italiano'});
INSERT INTO actors_by_nationality (nacionalidad, edad, actor_id, nombre, fecha_nacimiento, patrimonio, idiomas) VALUES ('Estados Unidos', 44, 7e9b56d2-f7ca-4132-a960-199b3982dbf3, 'Christopher Braun', '1981-10-18', 7063000, {'Ingles', 'Italiano'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (7e9b56d2-f7ca-4132-a960-199b3982dbf3, 'Extra', 96, 'Xavier', 'Christopher Braun', 'La Leyenda de Cirino', 'Independiente', {'Comedia', 'Ciencia Ficcion'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (7e9b56d2-f7ca-4132-a960-199b3982dbf3, 'Principal', 46, 'Jennifer', 'Christopher Braun', 'Cronicas de Álava', 'Profesional', {'Fantasia', 'Ciencia Ficcion', 'Accion'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (7e9b56d2-f7ca-4132-a960-199b3982dbf3, 'Principal', 107, 'Wesley', 'Christopher Braun', 'Noches en Las Palmas', 'Independiente', {'Drama'});

-- María Julieta Hernández Calderón (Chile, 34 años)
INSERT INTO actors_by_id (actor_id, nombre, nacionalidad, fecha_nacimiento, edad, patrimonio, idiomas) VALUES (adb21095-3bbb-492b-9924-eb8b75750c2b, 'María Julieta Hernández Calderón', 'Chile', '1992-08-06', 34, 939000, {'Español', 'Portugues', 'Italiano'});
INSERT INTO actors_by_nationality (nacionalidad, edad, actor_id, nombre, fecha_nacimiento, patrimonio, idiomas) VALUES ('Chile', 34, adb21095-3bbb-492b-9924-eb8b75750c2b, 'María Julieta Hernández Calderón', '1992-08-06', 939000, {'Español', 'Portugues', 'Italiano'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (adb21095-3bbb-492b-9924-eb8b75750c2b, 'Secundario', 2, 'Sergio', 'María Julieta Hernández Calderón', 'Escuadron Beige papaya', 'Profesional', {'Terror'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (adb21095-3bbb-492b-9924-eb8b75750c2b, 'Principal', 66, 'María', 'María Julieta Hernández Calderón', 'Vizcaya 2197', 'Profesional', {'Ciencia Ficcion', 'Fantasia'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (adb21095-3bbb-492b-9924-eb8b75750c2b, 'Principal', 76, 'Máximo', 'María Julieta Hernández Calderón', 'Cronicas de Lleida', 'Profesional', {'Drama', 'Terror', 'Ciencia Ficcion'});

-- Andy Castro Aliaga (Chile, 27 años)
INSERT INTO actors_by_id (actor_id, nombre, nacionalidad, fecha_nacimiento, edad, patrimonio, idiomas) VALUES (192f09a9-cfd8-4364-aab4-2bd67528ea79, 'Andy Castro Aliaga', 'Chile', '1998-10-19', 27, 3149000, {'Español'});
INSERT INTO actors_by_nationality (nacionalidad, edad, actor_id, nombre, fecha_nacimiento, patrimonio, idiomas) VALUES ('Chile', 27, 192f09a9-cfd8-4364-aab4-2bd67528ea79, 'Andy Castro Aliaga', '1998-10-19', 3149000, {'Español'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (192f09a9-cfd8-4364-aab4-2bd67528ea79, 'Secundario', 118, 'Sofía', 'Andy Castro Aliaga', 'La Leyenda de Álvaro', 'Independiente', {'Fantasia'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (192f09a9-cfd8-4364-aab4-2bd67528ea79, 'Secundario', 72, 'Amalia', 'Andy Castro Aliaga', 'Escuadron Verde prado', 'Independiente', {'Accion', 'Fantasia', 'Ciencia Ficcion'});

-- Kathryn Robinson (Estados Unidos, 61 años)
INSERT INTO actors_by_id (actor_id, nombre, nacionalidad, fecha_nacimiento, edad, patrimonio, idiomas) VALUES (7b9b3410-61b1-46f2-972e-6a6d79ef801b, 'Kathryn Robinson', 'Estados Unidos', '1965-07-12', 61, 707000, {'Ingles', 'Frances'});
INSERT INTO actors_by_nationality (nacionalidad, edad, actor_id, nombre, fecha_nacimiento, patrimonio, idiomas) VALUES ('Estados Unidos', 61, 7b9b3410-61b1-46f2-972e-6a6d79ef801b, 'Kathryn Robinson', '1965-07-12', 707000, {'Ingles', 'Frances'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (7b9b3410-61b1-46f2-972e-6a6d79ef801b, 'Extra', 32, 'Susan', 'Kathryn Robinson', 'El Ultimo Montserrat', 'Independiente', {'Drama', 'Deportes'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (7b9b3410-61b1-46f2-972e-6a6d79ef801b, 'Secundario', 25, 'Robert', 'Kathryn Robinson', 'Escuadron Granate', 'Profesional', {'Misterio'});

-- Katherine Taylor (Estados Unidos, 49 años)
INSERT INTO actors_by_id (actor_id, nombre, nacionalidad, fecha_nacimiento, edad, patrimonio, idiomas) VALUES (45e8f721-e301-4e25-b5cf-ef7f85616709, 'Katherine Taylor', 'Estados Unidos', '1977-09-04', 49, 2509000, {'Ingles', 'Japones', 'Italiano'});
INSERT INTO actors_by_nationality (nacionalidad, edad, actor_id, nombre, fecha_nacimiento, patrimonio, idiomas) VALUES ('Estados Unidos', 49, 45e8f721-e301-4e25-b5cf-ef7f85616709, 'Katherine Taylor', '1977-09-04', 2509000, {'Ingles', 'Japones', 'Italiano'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (45e8f721-e301-4e25-b5cf-ef7f85616709, 'Principal', 113, 'Hugo', 'Katherine Taylor', 'Navarra 2154', 'Independiente', {'Drama'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (45e8f721-e301-4e25-b5cf-ef7f85616709, 'Extra', 56, 'Katelyn', 'Katherine Taylor', 'Baleares 2099', 'Profesional', {'Terror'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (45e8f721-e301-4e25-b5cf-ef7f85616709, 'Extra', 47, 'Amy', 'Katherine Taylor', 'El Ultimo Leiva', 'Independiente', {'Accion', 'Romance'});

-- Rosa Angélica Uribe Álvarez (Chile, 31 años)
INSERT INTO actors_by_id (actor_id, nombre, nacionalidad, fecha_nacimiento, edad, patrimonio, idiomas) VALUES (22867c53-f000-4394-b870-e4e1b093e3b4, 'Rosa Angélica Uribe Álvarez', 'Chile', '1994-10-31', 31, 6994000, {'Español', 'Japones'});
INSERT INTO actors_by_nationality (nacionalidad, edad, actor_id, nombre, fecha_nacimiento, patrimonio, idiomas) VALUES ('Chile', 31, 22867c53-f000-4394-b870-e4e1b093e3b4, 'Rosa Angélica Uribe Álvarez', '1994-10-31', 6994000, {'Español', 'Japones'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (22867c53-f000-4394-b870-e4e1b093e3b4, 'Principal', 58, 'Raimundo', 'Rosa Angélica Uribe Álvarez', 'Cronicas de Valencia', 'Independiente', {'Aventura'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (22867c53-f000-4394-b870-e4e1b093e3b4, 'Extra', 102, 'Jaime', 'Rosa Angélica Uribe Álvarez', 'La Leyenda de Piedad', 'Profesional', {'Drama'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (22867c53-f000-4394-b870-e4e1b093e3b4, 'Principal', 1, 'Sonia', 'Rosa Angélica Uribe Álvarez', 'Noches en Sevilla', 'Independiente', {'Misterio', 'Romance'});

-- Alejandro Benavides-Gálvez Molina (Chile, 70 años)
INSERT INTO actors_by_id (actor_id, nombre, nacionalidad, fecha_nacimiento, edad, patrimonio, idiomas) VALUES (3f87175d-9c2a-4dc0-9978-98f0277b5be5, 'Alejandro Benavides-Gálvez Molina', 'Chile', '1956-02-22', 70, 10258000, {'Español', 'Japones'});
INSERT INTO actors_by_nationality (nacionalidad, edad, actor_id, nombre, fecha_nacimiento, patrimonio, idiomas) VALUES ('Chile', 70, 3f87175d-9c2a-4dc0-9978-98f0277b5be5, 'Alejandro Benavides-Gálvez Molina', '1956-02-22', 10258000, {'Español', 'Japones'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (3f87175d-9c2a-4dc0-9978-98f0277b5be5, 'Principal', 4, 'Ascensión', 'Alejandro Benavides-Gálvez Molina', 'Cronicas de Guadalajara', 'Profesional', {'Deportes'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (3f87175d-9c2a-4dc0-9978-98f0277b5be5, 'Principal', 48, 'Sofía', 'Alejandro Benavides-Gálvez Molina', 'Proyecto Abril', 'Independiente', {'Drama', 'Deportes'});

-- William Sanchez (Estados Unidos, 67 años)
INSERT INTO actors_by_id (actor_id, nombre, nacionalidad, fecha_nacimiento, edad, patrimonio, idiomas) VALUES (fd6cb580-ce21-426c-9b0c-6bb0cd3e91d5, 'William Sanchez', 'Estados Unidos', '1959-01-29', 67, 987000, {'Ingles', 'Japones', 'Portugues'});
INSERT INTO actors_by_nationality (nacionalidad, edad, actor_id, nombre, fecha_nacimiento, patrimonio, idiomas) VALUES ('Estados Unidos', 67, fd6cb580-ce21-426c-9b0c-6bb0cd3e91d5, 'William Sanchez', '1959-01-29', 987000, {'Ingles', 'Japones', 'Portugues'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (fd6cb580-ce21-426c-9b0c-6bb0cd3e91d5, 'Secundario', 78, 'Mauricio', 'William Sanchez', 'Valencia 2151', 'Profesional', {'Comedia', 'Deportes', 'Aventura'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (fd6cb580-ce21-426c-9b0c-6bb0cd3e91d5, 'Extra', 22, 'Rafa', 'William Sanchez', 'Noches en Palencia', 'Profesional', {'Terror', 'Aventura'});

-- Constantino Guzman Lopez (Argentina, 33 años)
INSERT INTO actors_by_id (actor_id, nombre, nacionalidad, fecha_nacimiento, edad, patrimonio, idiomas) VALUES (2e608e3d-5c2e-4826-96f0-a1e4a91a562e, 'Constantino Guzman Lopez', 'Argentina', '1992-12-30', 33, 4368000, {'Español', 'Japones', 'Frances'});
INSERT INTO actors_by_nationality (nacionalidad, edad, actor_id, nombre, fecha_nacimiento, patrimonio, idiomas) VALUES ('Argentina', 33, 2e608e3d-5c2e-4826-96f0-a1e4a91a562e, 'Constantino Guzman Lopez', '1992-12-30', 4368000, {'Español', 'Japones', 'Frances'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (2e608e3d-5c2e-4826-96f0-a1e4a91a562e, 'Extra', 67, 'Rosalía', 'Constantino Guzman Lopez', 'Cronicas de Lugo', 'Profesional', {'Ciencia Ficcion', 'Romance', 'Misterio'});

-- Mia Ana Alarcón Rodríguez (Chile, 39 años)
INSERT INTO actors_by_id (actor_id, nombre, nacionalidad, fecha_nacimiento, edad, patrimonio, idiomas) VALUES (44a23f65-9015-47c2-8b71-779491e0b539, 'Mia Ana Alarcón Rodríguez', 'Chile', '1986-12-14', 39, 1140000, {'Español', 'Japones'});
INSERT INTO actors_by_nationality (nacionalidad, edad, actor_id, nombre, fecha_nacimiento, patrimonio, idiomas) VALUES ('Chile', 39, 44a23f65-9015-47c2-8b71-779491e0b539, 'Mia Ana Alarcón Rodríguez', '1986-12-14', 1140000, {'Español', 'Japones'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (44a23f65-9015-47c2-8b71-779491e0b539, 'Principal', 109, 'Alma', 'Mia Ana Alarcón Rodríguez', 'Escuadron Azul polvo', 'Independiente', {'Drama'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (44a23f65-9015-47c2-8b71-779491e0b539, 'Extra', 101, 'Maura', 'Mia Ana Alarcón Rodríguez', 'Escuadron Marrón rosado', 'Independiente', {'Comedia', 'Accion', 'Ciencia Ficcion'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (44a23f65-9015-47c2-8b71-779491e0b539, 'Extra', 92, 'Daniel', 'Mia Ana Alarcón Rodríguez', 'Proyecto Gascón', 'Profesional', {'Deportes', 'Drama'});

-- Uberlinda Lizana (Chile, 52 años)
INSERT INTO actors_by_id (actor_id, nombre, nacionalidad, fecha_nacimiento, edad, patrimonio, idiomas) VALUES (38ca6b4a-f85e-4bea-8eec-8bf97875a42b, 'Uberlinda Lizana', 'Chile', '1974-03-05', 52, 6688000, {'Español', 'Japones'});
INSERT INTO actors_by_nationality (nacionalidad, edad, actor_id, nombre, fecha_nacimiento, patrimonio, idiomas) VALUES ('Chile', 52, 38ca6b4a-f85e-4bea-8eec-8bf97875a42b, 'Uberlinda Lizana', '1974-03-05', 6688000, {'Español', 'Japones'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (38ca6b4a-f85e-4bea-8eec-8bf97875a42b, 'Principal', 70, 'Renata', 'Uberlinda Lizana', 'Proyecto Gimenez', 'Profesional', {'Deportes'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (38ca6b4a-f85e-4bea-8eec-8bf97875a42b, 'Principal', 3, 'Catalina', 'Uberlinda Lizana', 'Escuadron Gris claro', 'Profesional', {'Fantasia'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (38ca6b4a-f85e-4bea-8eec-8bf97875a42b, 'Principal', 81, 'Alejandra', 'Uberlinda Lizana', 'Escuadron Gris mate', 'Independiente', {'Aventura', 'Comedia', 'Accion'});
INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, nombre_actor, produccion, tipo_produccion, generos) VALUES (38ca6b4a-f85e-4bea-8eec-8bf97875a42b, 'Principal', 85, 'Rosenda', 'Uberlinda Lizana', 'Noches en Guipúzcoa', 'Independiente', {'Drama'});
