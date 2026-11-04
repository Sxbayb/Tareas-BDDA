// =============================================================================
// Tarea 3: Neo4j y análisis de grafos
// Bases de Datos Avanzadas, UTFSM, segundo semestre 2026
// Sebastián Santander (202373608-2) y Jaime Guzmán (202373524-8)
//
// Versiones: Neo4j 2026.10.1 y GDS 2026.10.1
// Base de datos: neo4j (cargada desde tarea.dump)
// Las consultas van en orden de ejecución y no modifican los datos originales.
// =============================================================================

// -----------------------------------------------------------------------------
// SET UP: VERIFICACIÓN DE GDS Y DE LA CARGA
// -----------------------------------------------------------------------------

// Versión de Graph Data Science
RETURN gds.version() AS versionGDS;

// Conteo de estudiantes (se esperan 15)
MATCH (e:Estudiante)
RETURN count(e) AS estudiantes;

// Conteo de casas (se esperan 10)
MATCH (c:Casa)
RETURN count(c) AS casas;

// Conteo de visitas (se esperan 75)
MATCH (:Estudiante)-[r:PIDIO_DULCES]->(:Casa)
RETURN count(r) AS visitas;

// -----------------------------------------------------------------------------
// PARTE 1: EXPLORACIÓN Y CONSULTAS CYPHER
// -----------------------------------------------------------------------------

//=== 1.1 ===
MATCH(e:Estudiante)-[r:PIDIO_DULCES]->(c:Casa) RETURN e,r,c;

//=== 1.2 ===
// Ranking de las 10 casas
MATCH (c:Casa)
OPTIONAL MATCH (:Estudiante)-[r:PIDIO_DULCES]->(c)
RETURN c.id AS id, 
       c.direccion AS direccion, 
       count(r) AS visitas
ORDER BY visitas DESC, c.id ASC;

// Identificar casa con el máximo
MATCH (c:Casa)
OPTIONAL MATCH (:Estudiante)-[r:PIDIO_DULCES]->(c)
WITH c, count(r) AS visitas
WITH collect({id: c.id, direccion: c.direccion, visitas: visitas}) AS casas, 
     max(visitas) AS maxVisitas
UNWIND casas AS casa
WITH casa, maxVisitas
WHERE casa.visitas = maxVisitas
RETURN casa.id AS id, 
       casa.direccion AS direccion, 
       casa.visitas AS visitas;

//=== 1.3 ===
// Ranking de los 15 estudiantes
MATCH (e:Estudiante)-[r:PIDIO_DULCES]->(:Casa)
RETURN e.id AS estudiante,
       count(r) AS visitas,
       sum(r.cantidad) AS totalDulces
ORDER BY totalDulces DESC, estudiante ASC;

// Identificar estudiante con más dulces
MATCH (e:Estudiante)-[r:PIDIO_DULCES]->(:Casa)
WITH e.id AS estudiante, count(r) AS visitas, sum(r.cantidad) AS totalDulces
WITH collect({estudiante: estudiante, visitas: visitas, totalDulces: totalDulces}) AS ranking,
     max(totalDulces) AS maxDulces
UNWIND ranking AS est
WITH est, maxDulces
WHERE est.totalDulces = maxDulces
RETURN est.estudiante AS ganador,
       est.visitas AS visitas,
       est.totalDulces AS dulcesObtenidos;

//=== 1.4 ===
// Listado de visitas sin dulces
MATCH (e:Estudiante)-[r:PIDIO_DULCES]->(c:Casa)
WHERE r.cantidad = 0
RETURN e.id AS estudiante,
       c.direccion AS direccionCasa,
       r.tipo AS tipo
ORDER BY estudiante ASC, direccionCasa ASC;

// Conteo y cálculo de porcentaje
MATCH (:Estudiante)-[r:PIDIO_DULCES]->(:Casa)
WITH count(r) AS totalVisitas,
     count(CASE WHEN r.cantidad = 0 THEN 1 END) AS visitasSinDulces
RETURN visitasSinDulces,
       totalVisitas,
       round((visitasSinDulces * 100.0) / totalVisitas, 2) AS porcentajeSinDulces;

// -----------------------------------------------------------------------------
// PARTE 2: ANÁLISIS CON GDS
// -----------------------------------------------------------------------------

//=== 2.1 ===
// Proyección del grafo en memoria con ambas etiquetas y la dirección original
CALL gds.graph.project(
  'halloween',
  ['Estudiante', 'Casa'],
  {PIDIO_DULCES: {orientation: 'NATURAL'}}
)
YIELD graphName, nodeCount, relationshipCount
RETURN graphName, nodeCount, relationshipCount;

//=== 2.2 ===
// Degree Centrality con REVERSE (grado de entrada). Se filtra a las casas
// después de ejecutar el algoritmo, así la proyección conserva ambos tipos de nodos.
CALL gds.degree.stream('halloween', {
  orientation: 'REVERSE'
})
YIELD nodeId, score
WITH gds.util.asNode(nodeId) AS nodo, score
WHERE nodo:Casa
RETURN labels(nodo) AS etiquetas,
       nodo.id AS id,
       nodo.direccion AS direccion,
       score
ORDER BY score DESC, id ASC;

// Casas con el puntaje máximo (incluye todos los empates)
CALL gds.degree.stream('halloween', {
  orientation: 'REVERSE'
})
YIELD nodeId, score
WITH gds.util.asNode(nodeId) AS nodo, score
WHERE nodo:Casa
WITH collect({id: nodo.id, direccion: nodo.direccion, score: score}) AS casas,
     max(score) AS maxScore
UNWIND casas AS casa
WITH casa, maxScore
WHERE casa.score = maxScore
RETURN casa.id AS id,
       casa.direccion AS direccion,
       casa.score AS score
ORDER BY id ASC;

// Comparación del puntaje con las visitas de la Parte 1 y con los dulces entregados por casa
CALL gds.degree.stream('halloween', {
  orientation: 'REVERSE'
})
YIELD nodeId, score
WITH gds.util.asNode(nodeId) AS nodo, score
WHERE nodo:Casa
OPTIONAL MATCH (:Estudiante)-[r:PIDIO_DULCES]->(nodo)
WITH nodo, score, count(r) AS visitasCypher, sum(r.cantidad) AS dulcesEntregados
RETURN nodo.id AS id,
       nodo.direccion AS direccion,
       score AS gradoEntrada,
       visitasCypher,
       dulcesEntregados
ORDER BY gradoEntrada DESC, dulcesEntregados DESC, id ASC;

//=== 2.3 ===
// Node Similarity (Jaccard): las 5 parejas distintas con mayor similitud.
// Con estudiante1 < estudiante2 cada pareja aparece una sola vez.
CALL gds.nodeSimilarity.stream('halloween', {
  similarityMetric: 'JACCARD',
  topK: 14,
  similarityCutoff: 0.0001
})
YIELD node1, node2, similarity
WITH gds.util.asNode(node1).id AS estudiante1,
     gds.util.asNode(node2).id AS estudiante2,
     similarity
WHERE estudiante1 < estudiante2
RETURN estudiante1, estudiante2, similarity
ORDER BY similarity DESC, estudiante1 ASC, estudiante2 ASC
LIMIT 5;

// Pareja elegida: Isidora y Nicolás (primera pareja del ranking anterior)
// Casas que visitó cada uno
MATCH (e:Estudiante)-[:PIDIO_DULCES]->(c:Casa)
WHERE e.id IN ['Isidora', 'Nicolás']
RETURN e.id AS estudiante,
       collect(c.direccion) AS casasVisitadas
ORDER BY estudiante ASC;

// Casas que visitaron ambos
MATCH (a:Estudiante {id: 'Isidora'})-[:PIDIO_DULCES]->(c:Casa)<-[:PIDIO_DULCES]-(b:Estudiante {id: 'Nicolás'})
RETURN c.id AS id,
       c.direccion AS casaCompartida
ORDER BY id ASC;

// Jaccard calculado con Cypher para contrastar con GDS
MATCH (a:Estudiante {id: 'Isidora'})-[:PIDIO_DULCES]->(ca:Casa)
WITH collect(ca) AS casasA
MATCH (b:Estudiante {id: 'Nicolás'})-[:PIDIO_DULCES]->(cb:Casa)
WITH casasA, collect(cb) AS casasB
WITH casasA, casasB, [c IN casasA WHERE c IN casasB] AS comunes
RETURN size(casasA) AS visitasA,
       size(casasB) AS visitasB,
       size(comunes) AS interseccion,
       size(casasA) + size(casasB) - size(comunes) AS totalUnion,
       toFloat(size(comunes)) / (size(casasA) + size(casasB) - size(comunes)) AS jaccard;

// -----------------------------------------------------------------------------
// PARTE 3: BÚSQUEDA DE CAMINOS
// -----------------------------------------------------------------------------

//=== 3.1 ===
// Patrón completo con los dos estudiantes, las casas compartidas y sus relaciones (vista de grafo)
MATCH p = (a:Estudiante {id: 'Isidora'})-[:PIDIO_DULCES]->(c:Casa)<-[:PIDIO_DULCES]-(b:Estudiante {id: 'Nicolás'})
RETURN p;

// Mismo patrón en tabla, con lo que recibió cada uno en las casas compartidas
MATCH (a:Estudiante {id: 'Isidora'})-[ra:PIDIO_DULCES]->(c:Casa)<-[rb:PIDIO_DULCES]-(b:Estudiante {id: 'Nicolás'})
RETURN c.direccion AS casaCompartida,
       ra.cantidad AS cantidadA,
       ra.tipo AS tipoA,
       rb.cantidad AS cantidadB,
       rb.tipo AS tipoB
ORDER BY casaCompartida ASC;

//=== 3.2 ===
// Camino más corto entre la misma pareja, recorriendo las relaciones sin dirección
MATCH (a:Estudiante {id: 'Isidora'}),
      (b:Estudiante {id: 'Nicolás'})
OPTIONAL MATCH p = shortestPath(
  (a)-[:PIDIO_DULCES*1..24]-(b)
)
RETURN p,
       length(p) AS longitud,
       [n IN nodes(p) | coalesce(n.direccion, n.id)] AS recorrido;

// -----------------------------------------------------------------------------
// PARTE 4: CIERRE
// -----------------------------------------------------------------------------

//=== 4.2 ===
// Se elimina solo la proyección en memoria, no la base ni sus datos
CALL gds.graph.drop('halloween', false)
YIELD graphName
RETURN graphName;

// Comprobación de que la proyección ya no existe (se espera false)
CALL gds.graph.exists('halloween')
YIELD exists
RETURN exists;
