# Entregable 3 · Evidencia de ejecución y monitoreo de pipelines en Fabric

## Lo que ya está verificado fuera de Fabric

| Qué | Dónde | Resultado |
|---|---|---|
| La lógica del flujo de datos | [`01-replica-dataflow-pandas.ipynb`](../notebooks/01-replica-dataflow-pandas.ipynb) | 5 tablas, 5 comprobaciones de integridad superadas |
| El cuaderno de validación de la canalización | [`02-validacion-lakehouse.ipynb`](../notebooks/02-validacion-lakehouse.ipynb), ejecutado con Spark sobre los resultados esperados | 12 comprobaciones superadas |
| Los valores que deben salir en Fabric | [`datos-esperados/valores-control.csv`](../datos-esperados/valores-control.csv) | 542 / 295 / 847 / 365 / 122 filas; ventas 708 690.07 |

## Evidencias en Microsoft Fabric

- pendiente [vista de diagrama del flujo de datos]
- pendiente [pasos aplicados y destino de fact_ventas]
- pendiente [historial de actualizaciones del flujo de datos]
- pendiente [lienzo de la canalización]
- pendiente [salida de la ejecución de la canalización]
- pendiente [salida de la validación del lakehouse]
- pendiente [programación de la canalización]
- pendiente [centro de supervisión (Monitor)]
- pendiente [historial de ejecuciones de la canalización]
- pendiente [ejecución fallida diagnosticada]
- pendiente [tablas en el lakehouse]
- pendiente [consulta de control en el SQL analytics endpoint]
