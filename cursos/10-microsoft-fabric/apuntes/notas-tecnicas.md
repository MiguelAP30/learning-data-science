# Notas técnicas — Curso 10

## Por qué consultas M en archivos sueltos

Un flujo de datos Gen2 no se exporta como un único archivo de texto que se pueda versionar cómodamente: la plantilla de Power Query (`.pqt`) es un binario. Tener cada consulta en su `.m` permite leerla y versionarla en Git, y montarla pegándola en el editor avanzado.

## Decisiones del código M

- **`Web.Contents(UrlBase, [RelativePath = "..."])`** en lugar de `Web.Contents(UrlBase & "...")`. Con la URL concatenada, el servicio no puede analizar el origen antes de ejecutar ("origen dinámico") y la actualización programada puede fallar. Con `RelativePath`, el origen es siempre `UrlBase`.
- **`QuoteStyle.Csv`** porque los nombres de producto llevan comas entre comillas (`"Mountain-100 Silver, 38"`).
- **Cultura `en-US`** en `Table.TransformColumnTypes`, para que el punto decimal se interprete igual sin importar la región configurada.
- **`Table.FromColumns({Fechas}, type table [Date = date])`** para generar `dim_fecha` con el tipo ya definido.
- **Tipo explícito tras `Table.ExpandTableColumn`:** las columnas expandidas de una combinación quedan con tipo `any`, que el destino Lakehouse no admite.
- **`DateKey` como entero `aaaammdd`** en `fact_ventas` y `dim_fecha`: una clave numérica para relacionarlas en el modelo semántico.
- **Correo fuera de `dim_cliente`:** solo se conserva el dominio. Los flujos de datos no tienen seguridad de nivel de fila, así que lo que no hace falta para analizar no se publica.

## Réplica en pandas

Cada paso de M tiene su equivalente:

| M | pandas |
|---|---|
| `Table.Distinct(t, {cols})` | `drop_duplicates(cols)` |
| `Table.SelectRows` | máscara booleana |
| `Table.AddColumn(... Date.Month ...)` | `.dt.month` |
| `Table.NestedJoin` + `ExpandTableColumn` (LeftOuter) | `merge(how='left')` |
| `Table.Group` con `List.Count(List.Distinct(...))` | `groupby().agg(nunique)` |
| `Table.Sort` | `sort_values` |

**Una diferencia posible:** `ventas_mensuales` redondea cada grupo a 2 decimales. La suma de los grupos redondeados podría diferir unos céntimos de la suma sin redondear de `fact_ventas`. Aquí coinciden (708 690.07), pero la validación usa una tolerancia de 0.01 por si en Fabric no fuera así.

## Cuaderno de validación

- Detecta Fabric con `import notebookutils`, que solo existe allí.
- En Fabric, `spark.table('fact_ventas')` lee la tabla del **lakehouse predeterminado** del cuaderno, por eso hay que asociárselo.
- Las comprobaciones de huérfanos usan *left anti join*: devuelve las filas de `fact_ventas` sin correspondencia en la dimensión.
- En local se probó con la imagen de Spark del Curso 09 sobre los CSV de `datos-esperados/`. Lo que se prueba es el cuaderno, no el flujo: el flujo solo se comprueba de verdad al ejecutarlo en Fabric.
