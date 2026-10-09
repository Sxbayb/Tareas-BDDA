# Tarea 2: Apache Cassandra — Voice Managers

**Integrantes:**
- Sebastián Santander, Rol: 202373608-2
- Jaime Guzmán, Rol: 202373524-8


## Distribución del trabajo

- **Sebastián:** levantamiento del clúster, diseño de las tablas,
  generación de datos, Parte 1 (consultas) y Parte 2 (TRACING,
  ALLOW FILTERING, índices SAI, desnormalización y escalabilidad).
- **Jaime:** Parte 3 (comparación con MongoDB, alta disponibilidad,
  recuperación de nodos y script de actualización masiva) y Parte 4
  (cierre).


## Archivos principales

- `Santander-Guzman.pdf`: informe con consultas, explicaciones y evidencias.
- `schema.cql`: creación del keyspace `actors` y de las tres tablas.
- `generar_datos.py`: genera datos ficticios mediante la biblioteca Faker.
- `datos.cql`: los INSERT de los 24 actores utilizados en la tarea.
- `consultas_p1_p2.cql`: consultas de la Parte 1 y la Parte 2.
- `docker-compose.yml`: configuración de los tres nodos de Cassandra.
- `img/`: capturas utilizadas en el informe.


## Generación y carga de datos

Se requiere Python 3 y la biblioteca Faker:

```bash
python -m pip install faker
python generar_datos.py
```

`generar_datos.py` crea 24 actores con nombre, nacionalidad, fecha de
nacimiento, edad, patrimonio, idiomas y personajes, y escribe
directamente `datos.cql` con los INSERT de las tres tablas.

Con el clúster levantado (`docker compose up -d`), desde esta carpeta:

```bash
docker cp schema.cql cassandra1:/tmp/schema.cql
docker exec -it cassandra1 cqlsh -f /tmp/schema.cql
docker cp datos.cql cassandra1:/tmp/datos.cql
docker exec -it cassandra1 cqlsh -f /tmp/datos.cql
```


## Consideraciones

El generador utiliza la semilla `2026`, pero también depende de la
fecha actual y de la versión de Faker. El archivo `datos.cql` entregado
es la referencia para los datos utilizados en el informe.

En `docker-compose.yml` se subió `mem_limit` de `1g` a `1536m` en los
tres nodos, porque con 1 GB los contenedores se detenían por falta de
memoria. Los nodos se levantaron de a uno, esperando que cada uno
quedara en estado `UN` antes de iniciar el siguiente.
