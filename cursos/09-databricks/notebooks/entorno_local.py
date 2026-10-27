"""Sesión de Spark con Delta Lake para ejecutar los cuadernos fuera de Databricks.

En Databricks no se usa: allí `spark` ya existe y Delta Lake viene incluido.
Fuera de Databricks (contenedor con Apache Spark 4.0), crea una sesión equivalente:
Delta Lake como formato de tabla y un metastore local para que las tablas
persistan entre cuadernos.
"""
from pyspark.sql import SparkSession

DELTA = 'io.delta:delta-spark_2.13:4.0.0'


def sesion_spark_local(nombre_app, almacen='/tmp/curso09/warehouse'):
    return (
        SparkSession.builder
        .master('local[2]')
        .appName(nombre_app)
        .config('spark.jars.packages', DELTA)
        .config('spark.sql.extensions', 'io.delta.sql.DeltaSparkSessionExtension')
        .config('spark.sql.catalog.spark_catalog', 'org.apache.spark.sql.delta.catalog.DeltaCatalog')
        .config('spark.sql.warehouse.dir', almacen)
        .config('spark.driver.extraJavaOptions', '-Dderby.system.home=/tmp/curso09')
        .config('spark.sql.shuffle.partitions', '4')
        .config('spark.ui.showConsoleProgress', 'false')
        .enableHiveSupport()
        .getOrCreate()
    )
