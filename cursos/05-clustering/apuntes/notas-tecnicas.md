# Notas técnicas — Curso 05

## Entorno

Mismo que los cursos anteriores (Python 3.11.7, scikit-learn 1.9.0, pandas 2.2.3). No hizo falta instalar nada nuevo.

## Datasets

### `seeds.csv`

- 210 filas, 8 columnas, sin nulos.
- 7 features: `area`, `perimeter`, `compactness`, `kernel_length`, `kernel_width`, `asymmetry_coefficient`, `groove_length`.
- Label `species`: 0 Kama, 1 Rosa, 2 Canadian — **70 de cada una**, perfectamente balanceado.

> **El ejercicio original usa solo 6 de las 7 features.** Toma `data.columns[0:6]`, lo que deja fuera `groove_length` (índice 6), y luego usa `data.columns[7]` para la especie. Probablemente sea un descuido del curso, pero se mantuvo igual para que los resultados sean comparables con los suyos.

### `customers.csv`

- 40 filas: `Name`, `AverageSpend`, `AverageFrequency`. Reutilizado del Curso 02.
- Usado para el entregable de perfil de segmentos, que las semillas de trigo no permiten abordar de forma realista.

## Decisiones

**Escalado.** Obligatorio antes de cualquier algoritmo de clustering, porque todos se basan en distancias.

- Semillas: `MinMaxScaler` antes del PCA (como el original).
- Clientes: `StandardScaler`.

**PCA.** Solo para visualización: reduce las 6 features a 2 coordenadas graficables, conservando el 91.8% de la varianza. **El clustering se entrena sobre las features originales**, no sobre los componentes — el PCA es únicamente para poder dibujar el resultado.

**Reproducibilidad.** Se añadió `random_state=0` a todos los `KMeans` y al `PCA`. Los cuadernos originales no lo fijan, así que sus resultados cambian entre ejecuciones — algo especialmente relevante en K-Means, cuyos centroides arrancan en posiciones aleatorias.

**`n_init`.** El cuaderno original usa `n_init=100` en el K-Means principal pero lo deja por defecto en el bucle del codo. Se fijó `n_init=10` en el bucle para que las cifras sean estables.

## Correcciones sobre el material original

| Problema | Solución |
|---|---|
| `plot_clusters` definida dos veces, idéntica, en celdas distintas | Unificada en una sola función con leyenda por clúster |
| Sin `random_state`, los resultados cambian en cada ejecución | Fijado en todos los estimadores |
| El bucle del codo no fija `n_init` | Fijado a 10 |

## Resultados

| Modelo | Dataset | k | Silueta |
|---|---|---|---|
| K-Means | seeds | 3 | 0.475 |
| Jerárquica aglomerativa | seeds | 3 | 0.422 |
| K-Means | customers | 4 | 0.810 |

**WCSS de las semillas** (para el codo): 2669.4 → 995.7 → 574.5 → 462.6 → 376.0 (k de 1 a 5). El codo está en k=3.

**Perfil de segmentos de clientes** (medianas de referencia: gasto 63.00, frecuencia 28.50):

| Segmento | Gasto medio | Frecuencia media | Valor estimado | Perfil |
|---|---|---|---|---|
| 2 | 88.90 | 46.31 | 4116.96 | Alto valor |
| 0 | 29.20 | 46.25 | 1350.50 | Comprador frecuente pequeño |
| 1 | 83.90 | 9.80 | 822.22 | Compra grande esporádica |
| 3 | 28.30 | 9.70 | 274.51 | Bajo compromiso |
