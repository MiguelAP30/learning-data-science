# Entregables — Curso 09: Implement a Data Analytics Solution with Azure Databricks

Curso: [DP-3011 Implement a Data Analytics Solution with Azure Databricks](https://learn.microsoft.com/training/courses/dp-3011) (Microsoft Learn)

- **Nivel:** Intermedio
- **Prioridad:** Obligatorio
- **Duración estimada:** 20-24 h de contenido | 35-50 h de práctica
- **Certificación relacionada:** DP-3011

---

## 1. Notebook en Databricks con ingesta y transformación de datos usando Spark

**→ [`entregables/01-notebook-ingesta-transformacion.md`](01-notebook-ingesta-transformacion.md)** · cuaderno [`01-ingesta-transformacion-spark.ipynb`](../notebooks/01-ingesta-transformacion-spark.ipynb)

Registros de llamadas de telecomunicaciones de archivo crudo a tablas Delta bronce → plata → oro: esquema explícito, metadatos de ingesta, perfilado, limpieza con `try_to_timestamp`, agregaciones, función de ventana y SQL.

---

## 2. Pipeline de procesamiento con Delta tables y validaciones de calidad de datos

**→ [`entregables/02-pipeline-delta-calidad.md`](02-pipeline-delta-calidad.md)** · cuaderno [`02-pipeline-delta-calidad.ipynb`](../notebooks/02-pipeline-delta-calidad.ipynb) · versión Lakeflow [`siniestros_pipeline.py`](../pipelines/siniestros_pipeline.py)

Siniestros de seguros con 12 reglas de calidad (descartar / advertir / fallar): 25 filas → 16 a plata + 9 a cuarentena con sus motivos. Restricciones `CHECK` en la tabla Delta, carga idempotente con `MERGE`, métricas por ejecución, historial y viaje en el tiempo.

---

## 3. Evidencia de orquestación de jobs y versionamiento de notebooks

**→ [`entregables/03-orquestacion-y-versionado.md`](03-orquestacion-y-versionado.md)** · job [`databricks.yml`](../databricks.yml) · verificación [`03-verificacion-calidad.ipynb`](../notebooks/03-verificacion-calidad.ipynb)

Job de 3 tareas con dependencias, parámetros, reintentos, programación y alertas, definido como código (*Declarative Automation Bundle*). Los cuadernos se versionan con Git y los datos con Delta. Incluye la guía paso a paso para ejecutarlo en Azure Databricks y capturar las evidencias.

> ⏳ Las capturas desde Azure Databricks están pendientes de ejecución en una suscripción de Azure. El resto ya está en el repositorio.

---

## Notas

- **Ejecución.** Los cuadernos 01 a 03 se ejecutaron de punta a punta con Apache Spark 4.0 y Delta Lake 4.0 en un contenedor local ([`entorno-local/`](../entorno-local/)). Están escritos para Databricks: la primera celda detecta el entorno, y en Databricks usa Unity Catalog, un volumen y los parámetros del job.
- **Datos.** `telecom_cdrs.csv`, `insurance_claims_raw.csv` y `routes.csv` vienen del repositorio de laboratorios [DP-750](https://github.com/MicrosoftLearning/DP-750T00-Implement-Data-Engineering-Solutions-using-Azure-Databricks) de Microsoft Learning (licencia MIT).
