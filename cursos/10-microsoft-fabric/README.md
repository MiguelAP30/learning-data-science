# Curso 10 - Ingest Data with Microsoft Fabric

Curso: [Ingest data with Microsoft Fabric](https://learn.microsoft.com/training/paths/ingest-data-with-microsoft-fabric/) (Microsoft Learn) · Certificación relacionada: DP-600 / DP-700 (complementario)

Ingesta y transformación de datos en Microsoft Fabric con flujos de datos Gen2 (Power Query) y canalizaciones de Data Factory.

## Entregables

| # | Entregable | Archivo |
|---|---|---|
| 1 | Pipeline de ingesta y orquestación usando capacidades de Data Factory en Microsoft Fabric | [`entregables/01-pipeline-ingesta-orquestacion.md`](entregables/01-pipeline-ingesta-orquestacion.md) |
| 2 | Flujo de transformación con Dataflows Gen2 para preparar datos analíticos | [`entregables/02-dataflow-gen2-transformacion.md`](entregables/02-dataflow-gen2-transformacion.md) |
| 3 | Evidencia de ejecución y monitoreo de pipelines en Fabric | [`entregables/03-evidencia-ejecucion-monitoreo.md`](entregables/03-evidencia-ejecucion-monitoreo.md) |

Resumen completo: [`entregables/resumen-entregables.md`](entregables/resumen-entregables.md)

## Contenido

```
10-microsoft-fabric/
├── dataflow/                 → consultas Power Query M del flujo de datos Gen2 (una por archivo)
├── notebooks/
│   ├── 01-replica-dataflow-pandas.ipynb   → misma lógica que el flujo, en pandas: comprueba y fija los resultados esperados
│   └── 02-validacion-lakehouse.ipynb      → actividad final de la canalización (Fabric); probado en local con Spark
├── datos-esperados/          → tablas y valores de control que debe producir el flujo en Fabric
├── datasets/                 → orders, customers y products de dp-data (MIT)
├── imagenes/                 → gráficas y evidencias
└── apuntes/notas-tecnicas.md
```

## Cómo ejecutar

- **En Microsoft Fabric:** guías paso a paso en los entregables [1](entregables/01-pipeline-ingesta-orquestacion.md#cómo-montarlo-en-fabric) y [2](entregables/02-dataflow-gen2-transformacion.md#cómo-montarlo-en-fabric).
- **La réplica en pandas:** Python 3.11 con `pandas` y `matplotlib`; ejecuta `notebooks/01-replica-dataflow-pandas.ipynb`.
- **La validación en local:** necesita Spark. Se puede usar el contenedor del [Curso 09](../09-databricks/entorno-local/), después de ejecutar la réplica.
