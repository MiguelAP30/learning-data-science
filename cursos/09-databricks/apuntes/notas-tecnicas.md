# Notas técnicas — Curso 09

## Un cuaderno, dos entornos

La primera celda de código de cada cuaderno decide el entorno con `'DATABRICKS_RUNTIME_VERSION' in os.environ`:

| | Databricks | Local |
|---|---|---|
| Sesión Spark | La que ya existe (`spark`) | `entorno_local.sesion_spark_local()` |
| Parámetros | Widgets `catalogo` y `esquema`; en un job llegan como parámetros | Fijos: esquema `curso09` |
| Tablas | `` `catálogo`.esquema.tabla `` en Unity Catalog | `esquema.tabla` en un metastore Hive local |
| Archivos | Volumen `/Volumes/<catálogo>/<esquema>/datos_crudos`; si falta el CSV, se descarga del repositorio | `../datasets` |

El resto del código no cambia. Por eso la función `tabla(nombre)` construye siempre el nombre completo.

Las comillas invertidas en `` `adb-dp750` `` hacen falta porque el catálogo del laboratorio lleva un guion.

## Entorno local

- **Por qué Docker.** En Windows, Spark necesita `winutils.exe` y `hadoop.dll` para escribir en disco, binarios que no distribuye Apache. La imagen oficial `apache/spark:4.0.1` (Linux) evita el problema.
- **Versiones.** Spark 4.0.1 con Delta Lake 4.0.0, emparejados como en Databricks Runtime 17. Delta Lake 4.4 necesita Spark 4.2; con el paquete de pip `delta-spark` sin fijar `pyspark`, pip instala una versión de Spark que no casa con el JAR.
- **Metastore.** `enableHiveSupport()` con Derby en `/tmp/curso09`, para que las tablas que crea el cuaderno 01 o el 02 sigan existiendo para el 03. Solo persiste dentro del mismo contenedor.
- **Logs.** `run_nb.py` elimina de los cuadernos guardados las salidas de *stderr*: son los logs de la JVM (Ivy, Hive, log4j), propios del entorno local, que en Databricks no aparecen.

## Decisiones del cuaderno 01

- Fechas leídas como texto y convertidas en plata con `try_to_timestamp`: con ANSI activado (el modo por defecto en Spark 4), `to_timestamp` lanzaría un error ante un valor inválido.
- `_metadata.file_name` en lugar de `input_file_name()`, que está obsoleta y no funciona en Unity Catalog.
- La regla de validez exige `duration_seconds >= 0` y `fin >= inicio`. `CDR010` incumple las dos.

## Decisiones del cuaderno 02

- **Bronce sin inferir tipos.** Con `inferSchema`, `claim_amount` sería texto por culpa de `N/A`, y los errores de las fechas quedarían ocultos.
- **Reglas null-safe.** `coalesce(condición, false)`: una condición que da NULL cuenta como incumplida. Las reglas que comparan dos columnas solo se evalúan si ambas existen, para no penalizar dos veces el mismo problema.
- **`array_compact`** elimina los nulos del array de motivos, así que cada fila lleva solo las reglas que incumplió.
- **Restricciones idempotentes.** Antes de `ALTER TABLE ... ADD CONSTRAINT` se comprueba en `SHOW TBLPROPERTIES` que no exista (`delta.constraints.<nombre>`), para poder reejecutar el cuaderno.
- **Cuarentena y métricas con `append`**, identificadas por `_id_ejecucion`: forman un histórico. Bronce y oro usan `overwrite`; plata usa `MERGE`.
- **Mensaje de la restricción.** En local, la excepción llega como `Py4JJavaError` y su primera línea no dice nada útil. Se extrae el código `[DELTA_VIOLATE_CONSTRAINT_WITH_VALUES]` con una expresión regular.

## Cuaderno 03 y el job

- Lee el `_id_ejecucion` de bronce para verificar **la última ejecución** y no el histórico acumulado de cuarentena y métricas.
- Lanza `AssertionError` si falla cualquier comprobación. En un job, eso marca la tarea como fallida y dispara la notificación.

## Pipeline declarativo

`pipelines/siniestros_pipeline.py` usa `from pyspark import pipelines as dp`, como el laboratorio 09 del curso. No se puede probar en local: Spark Declarative Pipelines llega a Apache Spark en la versión 4.1, y los decoradores de expectativas son propios de Databricks.
