# Entregable 3 · Evidencia de ejecución y monitoreo de pipelines en Fabric

La ejecución y la supervisión ocurren dentro de Microsoft Fabric, así que las evidencias son capturas de pantalla. Esta guía indica qué capturar y dónde guardarlo. Requiere una capacidad de Fabric: la **prueba gratuita de 60 días** sirve ([activarla](https://aka.ms/fabrictrial)).

## Lo que ya está verificado fuera de Fabric

| Qué | Dónde | Resultado |
|---|---|---|
| La lógica del flujo de datos | [`01-replica-dataflow-pandas.ipynb`](../notebooks/01-replica-dataflow-pandas.ipynb) | 5 tablas, 5 comprobaciones de integridad ✅ |
| El cuaderno de validación de la canalización | [`02-validacion-lakehouse.ipynb`](../notebooks/02-validacion-lakehouse.ipynb), ejecutado con Spark sobre los resultados esperados | 12 comprobaciones ✅ |
| Los valores que deben salir en Fabric | [`datos-esperados/valores-control.csv`](../datos-esperados/valores-control.csv) | 542 / 295 / 847 / 365 / 122 filas; ventas 708 690.07 |

## Guía de capturas

Haz antes el laboratorio del curso (área de trabajo + lakehouse) y monta el flujo y la canalización según los entregables [1](01-pipeline-ingesta-orquestacion.md) y [2](02-dataflow-gen2-transformacion.md). Guarda las capturas en `imagenes/evidencias/`.

### Flujo de datos

| # | Qué capturar | Archivo |
|---|---|---|
| 1 | Editor de Power Query con la **vista de diagrama**: las 5 consultas y sus dependencias | `01-dataflow-diagrama.png` |
| 2 | Panel **Query settings** de `fact_ventas` con los **pasos aplicados** y el destino *Lakehouse* | `02-dataflow-pasos-destino.png` |
| 3 | **Historial de actualizaciones** del flujo (en el área de trabajo: `…` del flujo → *Recent runs*), con una ejecución correcta | `03-dataflow-historial.png` |

### Canalización

| # | Qué capturar | Archivo |
|---|---|---|
| 4 | El **lienzo** de `pl_ingesta_ventas` con las actividades conectadas | `04-pipeline-lienzo.png` |
| 5 | Pestaña **Output** tras *Run*: cada actividad con su duración y estado *Succeeded* | `05-pipeline-output.png` |
| 6 | Detalle de la actividad `validar_lakehouse`: salida del cuaderno con las comprobaciones ✅ | `06-pipeline-validacion.png` |
| 7 | Panel **Schedule** con la programación diaria activada | `07-pipeline-programacion.png` |

### Supervisión

| # | Qué capturar | Archivo |
|---|---|---|
| 8 | **Monitor** (barra lateral): la ejecución de la canalización y la del flujo, con estado, inicio y duración | `08-monitor-hub.png` |
| 9 | **View run history** de la canalización con varias ejecuciones (lanza dos o tres) | `09-pipeline-historial.png` |
| 10 | **Una ejecución fallida y diagnosticada:** cambia temporalmente en el cuaderno de validación un valor esperado (por ejemplo, 542 → 543), ejecuta, captura el error en *Output* y vuelve a dejarlo como estaba | `10-pipeline-fallo.png` |

### Resultado

| # | Qué capturar | Archivo |
|---|---|---|
| 11 | Explorador del lakehouse con las 5 tablas en *Tables* y una de ellas abierta | `11-lakehouse-tablas.png` |
| 12 | *SQL analytics endpoint* del lakehouse con `SELECT COUNT(*), SUM(LineItemTotal) FROM fact_ventas` → 542 y 708 690.07 | `12-lakehouse-consulta.png` |

**Limpieza:** al terminar, *Workspace settings → General → Remove this workspace*.

## Estado de las evidencias

| # | Evidencia | Estado |
|---|---|---|
| — | Lógica del flujo verificada y resultados esperados | ✅ En el repositorio |
| — | Cuaderno de validación de la canalización probado | ✅ En el repositorio |
| 1–12 | Capturas desde Microsoft Fabric | ⏳ Pendiente de ejecución en Fabric |
