# DataProject – SQL Logic Queries (Sakila Database)

## Descripción del proyecto

Este proyecto consiste en la resolución de una serie de **consultas SQL** utilizando la base de datos **Sakila**, una base de datos de ejemplo utilizada comúnmente para practicar consultas relacionales.

El objetivo del proyecto es aplicar diferentes conceptos de SQL, incluyendo:

* Consultas básicas (`SELECT`, `WHERE`, `ORDER BY`)
* Funciones agregadas (`COUNT`, `AVG`, `SUM`, `MIN`, `MAX`)
* Agrupaciones (`GROUP BY`, `HAVING`)
* Subconsultas
* Diferentes tipos de `JOIN`
* Creación de **vistas**
* Creación de **tablas temporales**
* Uso de **CROSS JOIN**

El proyecto contiene un total de **64 consultas SQL**, organizadas en diferentes bloques según su nivel de complejidad.

---

## Estructura del proyecto

```
.
├── BBDD_Proyecto_shakila.sql
├── consultas_sql.sql
└── README.md
```

**Archivos:**

* `BBDD_Proyecto_shakila.sql`
  Script para crear y cargar la base de datos Sakila.

* `consultas_sql.sql`
  Archivo con todas las consultas SQL realizadas para resolver el proyecto.

* `README.md`
  Documento explicativo del proyecto.

---

## Tecnologías utilizadas

* **PostgreSQL**
* **SQL**
* Base de datos **Sakila**

---

## Contenido de las consultas

Las consultas cubren diferentes aspectos del lenguaje SQL:

### Consultas básicas

* Selección de registros
* Filtrado con `WHERE`
* Ordenación con `ORDER BY`

### Funciones agregadas

* Conteo de registros
* Cálculo de medias
* Sumas y estadísticas

### Agrupaciones

Uso de:

```
GROUP BY
HAVING
```

para analizar información agrupada.

### Relaciones entre tablas

Uso de:

```
INNER JOIN
LEFT JOIN
CROSS JOIN
```

para combinar información entre múltiples tablas.

### Subconsultas

Consultas dentro de otras consultas para obtener resultados más complejos.

### Creación de vistas

Ejemplo de creación de una vista para reutilizar resultados:

```sql
CREATE VIEW actor_num_peliculas AS
SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS numero_peliculas
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.first_name, a.last_name;
```

### Tablas temporales

Se crean tablas temporales para almacenar resultados intermedios durante la ejecución.

---

## Objetivo del proyecto

El objetivo principal es **practicar la lógica de consultas SQL en bases de datos relacionales**, aplicando distintos tipos de operaciones y optimizando consultas para obtener información relevante de la base de datos.

Este proyecto permite reforzar habilidades fundamentales en:

* análisis de datos con SQL
* manipulación de bases de datos relacionales
* estructuración de consultas complejas

---

## Autor

Proyecto realizado por **Andrea García** como parte de un ejercicio de práctica de SQL.
