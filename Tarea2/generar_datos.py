# -*- coding: utf-8 -*-
"""
Generador de datos ficticios para el keyspace actors (Tarea 2, Cassandra).

Los valores los produce Faker en el momento. Lo unico escrito a mano son losvocabularios que el enunciado fija (Rol, Tipo, Generos) y algunos "cupos" para que las consultas de la Parte 1 y 2 devuelvan resultados utiles.

A diferencia de la tarea de MongoDB, aca no sale un JSON. El script escribe directamente datos.cql con los INSERT de las tres tablas, porque en Cassandra cada actor se guarda varias veces (una por cada tabla que lo necesita).

Requisitos: pip install faker
Salida: datos.cql

Para cargarlo:
    docker cp datos.cql cassandra1:/tmp/datos.cql
    docker exec -it cassandra1 cqlsh -f /tmp/datos.cql
"""

from datetime import date
from faker import Faker

# Semilla fija para que los datos salgan iguales cada vez que se corre. El informe lleva capturas y si se regenera la base
# a mitad de camino los resultados dejan de calzar. Tambien depende de
# la version de Faker, por eso el datos.cql entregado es la referencia.
Faker.seed(2026)

HOY = date.today()


# 1. Nacionalidades, cada una con su locale de Faker y su idioma nativo.
#
#    Pool acotado para que las nacionalidades se repitan. Si no, la particion
#    de cada pais en actors_by_nationality tendria un solo actor y la consulta
#    ordenada por edad no mostraria nada interesante. Van sin tildes para no
#    tener que escribirlas dentro de cqlsh.

PAISES = {
    "Chile":          ("es_CL", "Español"),
    "Argentina":      ("es_AR", "Español"),
    "Mexico":         ("es_MX", "Español"),
    "España":         ("es_ES", "Español"),
    "Brasil":         ("pt_BR", "Portugues"),
    "Estados Unidos": ("en_US", "Ingles"),
}

# Una instancia de Faker por locale.
FAKERS = {pais: Faker(loc) for pais, (loc, _) in PAISES.items()}
fake = FAKERS["Chile"]          # instancia de proposito general

IDIOMAS_EXTRA = ["Ingles", "Portugues", "Frances", "Japones", "Italiano"]

# Vocabularios cerrados: los define el enunciado, no tiene sentido generarlos.
ROLES   = ["Principal", "Secundario", "Extra"]
TIPOS   = ["Profesional", "Independiente"]
GENEROS = ["Accion", "Aventura", "Comedia", "Drama", "Fantasia",
           "Ciencia Ficcion", "Terror", "Romance", "Deportes", "Misterio"]


# 2. Cupos. Esto es lo que hace que las consultas devuelvan algo util.
#    Chile -> 12 actores, asi el LIMIT 10 de la consulta 1.2 realmente corta
#             y el LIMIT 5 de la 1.4 tiene de donde sacar
#    Edades -> mitad menores de 40 y mitad de 40 o mas, por la actualizacion
#              de la Parte 3 (principal / secundario en "Sansa Ball Race")

EDADES_CHILE = [23, 27, 31, 34, 38, 39,  41, 45, 52, 58, 63, 70]
EDADES_RESTO = [22, 25, 28, 30, 33, 36,  40, 44, 49, 55, 61, 67]

# El primer actor chileno es el "actor de ejemplo" de la consulta 1.3: se le
# fuerzan 3 personajes Principal para que filtrar por rol devuelva varios y se
# vea el orden por apariciones.
ACTOR_EJEMPLO = 0


# 3. Generadores auxiliares


# Faker no trae titulos de series ni de peliculas, asi que se arman con plantillas rellenadas por Faker.
PLANTILLAS = [
    lambda f: f"Cronicas de {f.city()}",
    lambda f: f"El Ultimo {f.last_name()}",
    lambda f: f"{f.city()} {f.random_int(2077, 2199)}",
    lambda f: f"Escuadron {f.color_name()}",
    lambda f: f"La Leyenda de {f.first_name()}",
    lambda f: f"Proyecto {f.last_name()}",
    lambda f: f"Noches en {f.city()}",
]


def titulo_produccion():
    """Titulo de serie, pelicula o videojuego, armado con partes de Faker."""
    return fake.random_element(PLANTILLAS)(FAKERS["España"])


def nombre_personaje(pais):
    """Nombre de personaje, en el idioma del pais del actor la mitad de las veces."""
    f = FAKERS[pais] if fake.boolean(50) else FAKERS["España"]
    return f.first_name()


def generar_personaje(pais, rol=None):
    """Una fila de characters_by_actor (sin el actor_id todavia)."""
    return {
        "nombre": nombre_personaje(pais),
        "produccion": titulo_produccion(),
        "tipo": fake.random_element(TIPOS),
        "rol": rol if rol else fake.random_element(ROLES),
        "apariciones": fake.random_int(1, 120),
        "generos": fake.random_elements(GENEROS, length=fake.random_int(1, 3), unique=True),
    }


def edad_real(nacimiento):
    """Edad cumplida hoy, para verificar que Faker y el cupo coinciden."""
    return HOY.year - nacimiento.year - (
        (HOY.month, HOY.day) < (nacimiento.month, nacimiento.day))


# Helpers para escribir literales CQL. Los textos van entre comillas simples y una comilla dentro del texto se escapa duplicandola.
def txt(valor):
    return "'" + str(valor).replace("'", "''") + "'"


def conjunto(valores):
    return "{" + ", ".join(txt(v) for v in valores) + "}"


# 4. Construccion de los actores


cupos = [("Chile", e) for e in EDADES_CHILE]
cupos += [(fake.random_element([p for p in PAISES if p != "Chile"]), e) for e in EDADES_RESTO]

actores = []
for i, (pais, edad) in enumerate(cupos):
    f_local = FAKERS[pais]

    # --- Idiomas, coherentes con la nacionalidad ---
    # En Cassandra van en un set<text>, asi que no se pueden repetir.
    idiomas = [PAISES[pais][1]]
    for extra in fake.random_elements(IDIOMAS_EXTRA, length=fake.random_int(0, 2), unique=True):
        if extra not in idiomas:
            idiomas.append(extra)

    # --- Fecha de nacimiento, generada por Faker para esa edad exacta ---
    nacimiento = f_local.date_of_birth(minimum_age=edad, maximum_age=edad)
    assert edad_real(nacimiento) == edad, "Edad y fecha de nacimiento no calzan"

    # --- Personajes ---
    personajes = []
    if i == ACTOR_EJEMPLO:
        personajes += [generar_personaje(pais, rol="Principal") for _ in range(3)]
    for _ in range(fake.random_int(1, 4)):
        personajes.append(generar_personaje(pais))

    # En characters_by_actor la clave es (actor_id, rol, apariciones, nombre).
    # Si dos personajes del mismo actor coinciden en eso, el segundo INSERT pisaria al primero (en Cassandra un INSERT con la misma clave es un update). Es muy improbable, pero se revisa igual.
    claves = [(p["rol"], p["apariciones"], p["nombre"]) for p in personajes]
    assert len(set(claves)) == len(claves), "Personajes con la misma clave"

    actores.append({
        # UUID, Cassandra no hay autoincremento, ningun nodo lleva la cuenta global. uuid4 de Faker respeta la semilla.
        "id": f_local.uuid4(),
        "nombre": f_local.name(),
        "nacionalidad": pais,
        "nacimiento": nacimiento.isoformat(),
        "edad": edad,
        # unique para que no haya empates de patrimonio
        "patrimonio": fake.unique.random_int(150, 12000) * 1000,
        "idiomas": idiomas,
        "personajes": personajes,
    })

ejemplo = actores[ACTOR_EJEMPLO]

# Que el orden de insercion no sea el orden por edad ni por pais.
fake.random.shuffle(actores)


# 5. Escritura de datos.cql
#    Cada actor va a actors_by_id y a actors_by_nationality (duplicado), y
#    cada personaje es una fila de characters_by_actor.


lineas = ["USE actors;", ""]
for a in actores:
    lineas.append(f"-- {a['nombre']} ({a['nacionalidad']}, {a['edad']} años)")
    lineas.append(
        "INSERT INTO actors_by_id (actor_id, nombre, nacionalidad, fecha_nacimiento, "
        "edad, patrimonio, idiomas) VALUES "
        f"({a['id']}, {txt(a['nombre'])}, {txt(a['nacionalidad'])}, '{a['nacimiento']}', "
        f"{a['edad']}, {a['patrimonio']}, {conjunto(a['idiomas'])});")
    lineas.append(
        "INSERT INTO actors_by_nationality (nacionalidad, edad, actor_id, nombre, "
        "fecha_nacimiento, patrimonio, idiomas) VALUES "
        f"({txt(a['nacionalidad'])}, {a['edad']}, {a['id']}, {txt(a['nombre'])}, "
        f"'{a['nacimiento']}', {a['patrimonio']}, {conjunto(a['idiomas'])});")
    for p in a["personajes"]:
        lineas.append(
            "INSERT INTO characters_by_actor (actor_id, rol, apariciones, nombre_personaje, "
            "nombre_actor, produccion, tipo_produccion, generos) VALUES "
            f"({a['id']}, {txt(p['rol'])}, {p['apariciones']}, {txt(p['nombre'])}, "
            f"{txt(a['nombre'])}, {txt(p['produccion'])}, {txt(p['tipo'])}, "
            f"{conjunto(p['generos'])});")
    lineas.append("")

with open("datos.cql", "w", encoding="utf-8", newline="\n") as archivo:
    archivo.write("\n".join(lineas))

total_personajes = sum(len(a["personajes"]) for a in actores)
print(f"Generados {len(actores)} actores y {total_personajes} personajes en datos.cql")
print(f"Actor de ejemplo (consulta 1.3): {ejemplo['nombre']}  ->  {ejemplo['id']}")
