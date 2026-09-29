# Curso 05 - Train and Evaluate Clustering Models

Curso: [Train and evaluate clustering models](https://learn.microsoft.com/training/modules/train-evaluate-cluster-models/) (Microsoft Learn) · Certificación relacionada: DP-100 (complementario)

Aprendizaje **no supervisado**: agrupar observaciones sin ninguna etiqueta conocida.

## Entregables

| # | Entregable | Archivo |
|---|---|---|
| 1 | Segmentación con K-Means y método del codo | [`entregables/segmentacion-kmeans-codo.md`](entregables/segmentacion-kmeans-codo.md) |
| 2 | Evaluación de clústeres con silhouette score | [`entregables/evaluacion-silhouette.md`](entregables/evaluacion-silhouette.md) |
| 3 | Perfil de segmentos con recomendaciones de negocio | [`entregables/perfil-segmentos-clientes.md`](entregables/perfil-segmentos-clientes.md) |

Resumen completo: [`entregables/resumen-entregables.md`](entregables/resumen-entregables.md)

## Notebooks

- [`notebooks/01-explorar-clusters.ipynb`](notebooks/01-explorar-clusters.ipynb) — Módulo 3: PCA para visualizar 6 dimensiones en 2, y método del codo para determinar cuántos clústeres hay.
- [`notebooks/02-kmeans-y-jerarquico.ipynb`](notebooks/02-kmeans-y-jerarquico.ipynb) — Módulo 5: K-Means y agrupación jerárquica aglomerativa, comparadas con silueta y contra las especies reales.
- [`notebooks/03-segmentacion-clientes.ipynb`](notebooks/03-segmentacion-clientes.ipynb) — **Añadido** (no está en el curso original): segmentación de clientes de punta a punta, con perfilado de negocio.

## Resultados

**Semillas de trigo** (210 obs., 6 features, k=3):

| Algoritmo | Silueta |
|---|---|
| K-Means | **0.475** |
| Jerárquica aglomerativa | 0.422 |

PCA conserva el **91.8%** de la varianza al reducir de 6 a 2 dimensiones.

**Clientes** (40 obs., 2 features): k óptimo = **4**, silueta **0.810**.

## Datasets

- [`datasets/seeds.csv`](datasets/seeds.csv) — 210 semillas de trigo con 7 medidas físicas y su variedad (Kama, Rosa, Canadian).

  Publicado originalmente por el Instituto de Agrofísica de la Academia Polaca de Ciencias en Lublin (Dua, D. y Graff, C., 2019). Disponible en el [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml).

- [`datasets/customers.csv`](datasets/customers.csv) — 40 clientes con gasto y frecuencia promedio de compra. Reutilizado del Curso 02.

## Imágenes

`imagenes/` — curvas del codo, siluetas y visualizaciones de los clústeres, embebidas en los entregables.

## Apuntes técnicos

- [`apuntes/notas-tecnicas.md`](apuntes/notas-tecnicas.md) — decisiones de escalado, reproducibilidad y desviaciones respecto al ejercicio original.

## Cómo ejecutar

Requiere Python 3.11 con `numpy`, `pandas`, `matplotlib`, `scikit-learn` e `ipykernel`. Abre el notebook en VS Code, selecciona el kernel Python 3.11 y ejecuta las celdas en orden.
