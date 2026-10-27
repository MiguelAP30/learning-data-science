# Entregables — Curso 10: Ingest Data with Microsoft Fabric

Curso: [Ingest data with Microsoft Fabric](https://learn.microsoft.com/training/paths/ingest-data-with-microsoft-fabric/) (Microsoft Learn)

- **Nivel:** Intermedio
- **Prioridad:** Obligatorio
- **Duración estimada:** 6-10 h de contenido | 12-20 h de práctica
- **Certificación relacionada:** DP-600 / DP-700 (complementario)

---

## 1. Pipeline de ingesta y orquestación usando capacidades de Data Factory en Microsoft Fabric

**→ [`entregables/01-pipeline-ingesta-orquestacion.md`](01-pipeline-ingesta-orquestacion.md)**

Canalización `pl_ingesta_ventas`: un **ForEach con Copy data** deja una instantánea fechada de los archivos de origen en el lakehouse, la actividad **Dataflow** ejecuta la transformación y un **Notebook** valida el resultado. Incluye parámetro de canalización, dependencias por estado (*On success* / *On fail*), programación diaria y el análisis de ETL frente a ELT.

---

## 2. Flujo de transformación con Dataflows Gen2 para preparar datos analíticos

**→ [`entregables/02-dataflow-gen2-transformacion.md`](02-dataflow-gen2-transformacion.md)** · código M en [`dataflow/`](../dataflow/) · réplica ejecutada [`01-replica-dataflow-pandas.ipynb`](../notebooks/01-replica-dataflow-pandas.ipynb)

Flujo `df_ventas_minoristas`: un parámetro y cinco consultas que forman un **esquema en estrella**: `fact_ventas`, `dim_producto`, `dim_cliente`, `dim_fecha` (generada) y `ventas_mensuales` (referencia + combinar + agrupar). Resultados esperados: 542 líneas de venta, 708 690.07 en ventas.

---

## 3. Evidencia de ejecución y monitoreo de pipelines en Fabric

**→ [`entregables/03-evidencia-ejecucion-monitoreo.md`](03-evidencia-ejecucion-monitoreo.md)** · validación [`02-validacion-lakehouse.ipynb`](../notebooks/02-validacion-lakehouse.ipynb)

La lógica del flujo y el cuaderno de validación están verificados fuera de Fabric.

pendiente [evidencias de ejecución y monitoreo en Microsoft Fabric]

---

## Notas

- **Datos.** `orders.csv`, `customers.csv` y `products.csv` vienen del repositorio [dp-data](https://github.com/MicrosoftLearning/dp-data) de Microsoft Learning (licencia MIT). El flujo los lee directamente de esa URL; la copia de [`datasets/`](../datasets/) es la que usa la réplica en pandas.
- **Power Query M no se ejecuta fuera de Fabric.** Por eso la lógica se replicó en pandas, para comprobarla y fijar los valores esperados que el cuaderno de validación compara con lo que produzca Fabric.
