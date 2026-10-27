# Entregable 2 · Pipeline de procesamiento con tablas Delta y validaciones de calidad

**Cuaderno:** [`notebooks/02-pipeline-delta-calidad.ipynb`](../notebooks/02-pipeline-delta-calidad.ipynb)
**Versión declarativa (Lakeflow):** [`pipelines/siniestros_pipeline.py`](../pipelines/siniestros_pipeline.py)

Siniestros de una aseguradora (`insurance_claims_raw.csv`, 25 filas con errores reales: identificadores vacíos, fechas `not-a-date` o `26/02/2026`, importes `N/A` o negativos, estados inexistentes).

## Arquitectura

```
insurance_claims_raw.csv
        │
        ▼
 bronce_siniestros ──(tipado seguro + 12 reglas)──┬──► plata_siniestros ──► oro_resumen_siniestros
   (25, texto)                                    │      (16, Delta con restricciones, MERGE)
                                                  ├──► cuarentena_siniestros (9, con motivos)
                                                  └──► calidad_metricas (1 fila por regla y ejecución)
```

## Reglas de calidad

Siguen el modelo de las expectativas de Lakeflow, con tres acciones:

| Regla | Acción | Filas que la incumplen |
|---|---|---|
| `claim_id_presente` | descartar | 1 |
| `customer_id_presente` | descartar | 0 |
| `fecha_reclamacion_valida` | descartar | 2 (`not-a-date`, `26/02/2026`) |
| `fecha_incidente_valida` | descartar | 1 (`invalid-date`) |
| `incidente_antes_de_reclamacion` | descartar | 0 |
| `importe_valido` | descartar | 3 (vacíos y `N/A`) |
| `importe_no_negativo` | descartar | 3 |
| `poliza_presente` | advertir | 3 |
| `estado_conocido` | advertir | 4 (`UNDER_REVIEW`, `INVALID_STATUS`, `INVALID`) |
| `tipo_conocido` | advertir | 1 (`VEHICLE`) |
| `importe_dentro_de_cobertura` | advertir | 0 |
| `cobertura_positiva` | **fallar** | 0 |

**Resultado:** 25 filas → **16 a plata** (5 con advertencias) + **9 a cuarentena** (36%). Una fila puede incumplir varias reglas: `CLM-014` tiene fecha de incidente inválida **e** importe negativo, y la cuarentena guarda ambos motivos.

## Cuatro garantías de calidad, en capas

1. **Reglas en el cuaderno.** Separan las filas válidas, las advertidas y las rechazadas, y registran las métricas de cada ejecución.
2. **Restricciones en la tabla.** `plata_siniestros` tiene `NOT NULL` en las columnas clave y dos `CHECK`: `claim_amount >= 0` e `incident_date <= claim_date`. Al intentar insertar a mano un importe negativo, Delta lo rechaza:
   ```
   [DELTA_VIOLATE_CONSTRAINT_WITH_VALUES] CHECK constraint importe_no_negativo (claim_amount >= 0) violated by row with values:
    - claim_amount : -100.00
   ```
3. **Reglas críticas que detienen el pipeline.** Si una regla con acción *fallar* se incumple, el cuaderno lanza una excepción y la tarea del job falla.
4. **Verificación posterior.** El cuaderno [`03-verificacion-calidad.ipynb`](../notebooks/03-verificacion-calidad.ipynb), última tarea del job, comprueba el cuadre bronce = plata + cuarentena (25 = 16 + 9), que oro sume lo mismo que plata (243 930.00), que no haya claves duplicadas y que la cuarentena no supere el 50%.

## Carga idempotente y versionado de datos

`MERGE INTO` por `claim_id`: reprocesar el mismo archivo no duplica filas. El historial de la tabla lo demuestra:

| Versión | Operación | Insertadas | Actualizadas |
|---|---|---|---|
| 0 | CREATE TABLE | — | — |
| 1 | ADD CONSTRAINT | — | — |
| 2 | ADD CONSTRAINT | — | — |
| 3 | MERGE | 16 | 0 |
| 4 | MERGE (reproceso del mismo lote) | **0** | 16 |

**Viaje en el tiempo:** `VERSION AS OF 0` devuelve 0 filas (tabla recién creada) y `VERSION AS OF 3`, 16.

## Versión declarativa con Lakeflow

[`pipelines/siniestros_pipeline.py`](../pipelines/siniestros_pipeline.py) define las mismas tres capas con `@dp.table` y las reglas como expectativas (`@dp.expect_or_drop`, `@dp.expect`, `@dp.expect_or_fail`), con la sintaxis del laboratorio 09 del curso. Lakeflow aplica las reglas y muestra las métricas en su panel de calidad, sin código de control. Solo se puede ejecutar dentro de Databricks; el cuaderno 02 implementa lo mismo de forma explícita y es el que se ejecutó.

| | Cuaderno 02 (explícito) | Pipeline declarativo |
|---|---|---|
| Reglas | Lista de reglas + columnas de motivos | Decoradores de expectativas |
| Cuarentena | Tabla propia con los motivos | Las filas descartadas no se guardan (habría que crear una tabla aparte) |
| Métricas | Tabla `calidad_metricas`, propia | Panel de calidad de Lakeflow |
| Dónde corre | Databricks o cualquier Spark + Delta | Solo Databricks |
