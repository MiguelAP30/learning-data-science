# Curso 09 - Implement a Data Analytics Solution with Azure Databricks

Curso: [DP-3011 Implement a Data Analytics Solution with Azure Databricks](https://learn.microsoft.com/training/courses/dp-3011) (Microsoft Learn) · Certificación relacionada: DP-3011

Ingeniería de datos en Azure Databricks: ingesta y transformación con Spark, tablas Delta, arquitectura medallion, calidad de datos y orquestación con Lakeflow Jobs.

## Entregables

| # | Entregable | Archivo |
|---|---|---|
| 1 | Notebook en Databricks con ingesta y transformación de datos usando Spark | [`entregables/01-notebook-ingesta-transformacion.md`](entregables/01-notebook-ingesta-transformacion.md) |
| 2 | Pipeline de procesamiento con Delta tables y validaciones de calidad de datos | [`entregables/02-pipeline-delta-calidad.md`](entregables/02-pipeline-delta-calidad.md) |
| 3 | Evidencia de orquestación de jobs y versionamiento de notebooks | [`entregables/03-orquestacion-y-versionado.md`](entregables/03-orquestacion-y-versionado.md) |

Resumen completo: [`entregables/resumen-entregables.md`](entregables/resumen-entregables.md)

## Contenido

```
09-databricks/
├── databricks.yml          → job de 3 tareas como código (Declarative Automation Bundle)
├── notebooks/
│   ├── 00-lab01-explorar-azure-databricks.ipynb   → ejercicio del laboratorio 01, traducido (se hace en Databricks)
│   ├── 01-ingesta-transformacion-spark.ipynb      → entregable 1
│   ├── 02-pipeline-delta-calidad.ipynb            → entregable 2
│   ├── 03-verificacion-calidad.ipynb              → tarea final del job
│   └── entorno_local.py                           → sesión Spark + Delta fuera de Databricks
├── pipelines/siniestros_pipeline.py               → versión Lakeflow Declarative Pipelines del entregable 2
├── datasets/               → CSV de los laboratorios DP-750 (MIT)
├── entorno-local/          → contenedor con Spark 4.0 + Delta Lake para ejecutar los cuadernos sin Databricks
├── imagenes/               → gráficas y evidencias
└── apuntes/notas-tecnicas.md
```

## Cómo ejecutar

**En Azure Databricks** (entorno objetivo): conecta este repositorio como *Git folder*, abre un cuaderno con cómputo **Serverless** y ejecútalo. La primera celda crea el esquema y el volumen y descarga los datos.

**En local** (con Docker):

```bash
cd cursos/09-databricks
docker build -t curso09-spark entorno-local
docker run --rm -v "$PWD:/work/curso09" -v "$PWD/entorno-local:/scripts" curso09-spark \
  python3 /scripts/run_nb.py /work/curso09/notebooks/01-ingesta-transformacion-spark.ipynb \
  /work/curso09/notebooks/02-pipeline-delta-calidad.ipynb /work/curso09/notebooks/03-verificacion-calidad.ipynb
```

Los tres cuadernos deben ejecutarse en el mismo contenedor y en ese orden: el 03 lee las tablas que crean el 01 y el 02.

## Datos

Del repositorio de laboratorios [DP-750](https://github.com/MicrosoftLearning/DP-750T00-Implement-Data-Engineering-Solutions-using-Azure-Databricks) de Microsoft Learning (licencia MIT):

- [`datasets/telecom_cdrs.csv`](datasets/telecom_cdrs.csv): 30 registros de llamadas, datos y SMS.
- [`datasets/insurance_claims_raw.csv`](datasets/insurance_claims_raw.csv): 25 siniestros con errores de calidad intencionados.
- [`datasets/routes.csv`](datasets/routes.csv): 10 rutas de CityMoves Transit (laboratorio 01).
