# Tarea 3: Neo4j y análisis de grafos

**Integrantes:**
- Sebastián Santander, Rol: 202373608-2
- Jaime Guzmán, Rol: 202373524-8


## Distribución del trabajo

- **Jaime:** instalación de Neo4j Desktop y GDS, carga y verificación de
  `tarea.dump` y Parte 1 (exploración y consultas Cypher).
- **Sebastián:** Parte 2 (proyección, Degree Centrality y Node Similarity),
  Parte 3 (búsqueda de caminos) y Parte 4 (cierre).


## Archivos principales

- `Santander-Guzman.pdf`: informe con consultas, resultados, explicaciones y capturas.
- `Santander-Guzman.tex`: fuente LaTeX del informe.
- `consultas.cypher`: todas las consultas en orden de ejecución, desde la verificación hasta la eliminación de la proyección.
- `img/`: capturas utilizadas en el informe.


## Entorno

- Neo4j 2026.10.1 (Neo4j Desktop, instancia local `tarea3`)
- Graph Data Science 2026.10.1
- Base de datos: `neo4j`, cargada desde `tarea.dump`

Para reproducir el trabajo se crea una instancia desde `tarea.dump`, se instala
GDS desde la sección Plugins y se ejecutan las consultas de `consultas.cypher`
en orden sobre la base `neo4j`. Las consultas no generan ni modifican datos.
