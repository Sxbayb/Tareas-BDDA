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