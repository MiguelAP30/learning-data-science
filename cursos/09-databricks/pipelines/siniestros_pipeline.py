# ==============================================================
# Siniestros: pipeline de calidad de datos
# Lakeflow Spark Declarative Pipelines (solo Databricks)
# ==============================================================
#
# Versión declarativa del cuaderno 02-pipeline-delta-calidad.ipynb.
# En lugar de escribir a mano el control de calidad, cada regla se declara
# como una *expectativa* sobre la tabla, y Lakeflow se encarga de aplicarla
# y de mostrar las métricas en el panel de calidad del pipeline:
#
#   @dp.expect_or_drop(nombre, condición)  -> descarta las filas que no la cumplen
#   @dp.expect(nombre, condición)          -> conserva la fila y registra la advertencia
#   @dp.expect_or_fail(nombre, condición)  -> detiene la actualización del pipeline
#
# Uso: en Databricks, Jobs & Pipelines > Create > ETL pipeline, añadir este archivo
# como código fuente y definir en la configuración del pipeline la clave
# `ruta_datos` con la carpeta del volumen donde está insurance_claims_raw.csv
# (por ejemplo /Volumes/adb-dp750/curso09/datos_crudos).
#
# Sintaxis según el laboratorio 09 del curso DP-750. No se puede ejecutar fuera de
# Databricks: el cuaderno 02 hace lo mismo con Spark + Delta y sí se ejecutó.
# ==============================================================

from pyspark import pipelines as dp
from pyspark.sql import functions as F

RUTA_DATOS = spark.conf.get('ruta_datos')


@dp.table(name='bronce_siniestros_dp', comment='Copia exacta del CSV de siniestros, todo como texto.')
def bronce_siniestros():
    return (spark.read.option('header', True).csv(f'{RUTA_DATOS}/insurance_claims_raw.csv')
            .withColumn('_fecha_ingesta', F.current_timestamp())
            .withColumn('_archivo_origen', F.col('_metadata.file_name')))


@dp.table(name='plata_siniestros_dp', comment='Siniestros tipados que superan las reglas de calidad.')
@dp.expect_or_drop('claim_id_presente', 'claim_id IS NOT NULL')
@dp.expect_or_drop('customer_id_presente', 'customer_id IS NOT NULL')
@dp.expect_or_drop('fecha_reclamacion_valida', 'claim_date IS NOT NULL')
@dp.expect_or_drop('fecha_incidente_valida', 'incident_date IS NOT NULL')
@dp.expect_or_drop('incidente_antes_de_reclamacion', 'incident_date <= claim_date')
@dp.expect_or_drop('importe_valido', 'claim_amount IS NOT NULL')
@dp.expect_or_drop('importe_no_negativo', 'claim_amount >= 0')
@dp.expect('poliza_presente', 'policy_id IS NOT NULL')
@dp.expect('estado_conocido', "status IN ('OPEN', 'PENDING', 'CLOSED')")
@dp.expect('tipo_conocido', "claim_type IN ('AUTO', 'HOME', 'HEALTH', 'LIFE')")
@dp.expect_or_fail('cobertura_positiva', 'coverage_amount > 0')
def plata_siniestros():
    return spark.read.table('bronce_siniestros_dp').select(
        'claim_id', 'policy_id', 'customer_id',
        F.expr("CAST(try_to_timestamp(claim_date, 'yyyy-MM-dd') AS DATE)").alias('claim_date'),
        F.expr("CAST(try_to_timestamp(incident_date, 'yyyy-MM-dd') AS DATE)").alias('incident_date'),
        F.expr('try_cast(claim_amount AS DECIMAL(12,2))').alias('claim_amount'),
        'claim_type', 'status',
        F.expr('try_cast(coverage_amount AS DECIMAL(12,2))').alias('coverage_amount'),
        'agent_code',
    )


@dp.table(name='oro_resumen_siniestros_dp', comment='Siniestros e importes por tipo y estado.')
def oro_resumen_siniestros():
    return (spark.read.table('plata_siniestros_dp')
            .groupBy('claim_type', 'status')
            .agg(F.count('claim_id').alias('siniestros'),
                 F.sum('claim_amount').alias('importe_total')))
