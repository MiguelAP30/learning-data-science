# Curso 06 - Create Machine Learning Models

Curso: [Create machine learning models](https://learn.microsoft.com/training/paths/create-machine-learn-models/) (Microsoft Learn) · Certificación relacionada: DP-203 / DP-600 (complementario)

Los tres tipos de modelo del curso (regresión, clasificación y clustering) en un mini portafolio. En cada uno se comparan varios algoritmos frente a una línea base.

## Entregables

| # | Entregable | Archivo |
|---|---|---|
| 1 | Mini portafolio con 3 modelos (regresión, clasificación y clustering) | [`entregables/01-portafolio-modelos.md`](entregables/01-portafolio-modelos.md) |
| 2 | Informe de comparación de desempeño entre modelos | [`entregables/02-informe-comparacion-modelos.md`](entregables/02-informe-comparacion-modelos.md) |
| 3 | Checklist de buenas prácticas para entrenamiento y evaluación | [`entregables/03-checklist-buenas-practicas.md`](entregables/03-checklist-buenas-practicas.md) |

Resumen completo: [`entregables/resumen-entregables.md`](entregables/resumen-entregables.md)

## Notebooks

- [`notebooks/01-regresion-helados.ipynb`](notebooks/01-regresion-helados.ipynb): ventas de helados. 5 regresores comparados; gana la regresión lineal.
- [`notebooks/02-clasificacion-pinguinos.ipynb`](notebooks/02-clasificacion-pinguinos.ipynb): especie de pingüino. 5 clasificadores en dos escenarios (4 medidas / solo aleta); gana la regresión logística.
- [`notebooks/03-clustering-clientes.ipynb`](notebooks/03-clustering-clientes.ipynb): segmentos de clientes. K-Means frente a jerárquica para k = 2…7; K-Means con k=4.

Los tres cuadernos incluyen la predicción de los casos de prueba del ejercicio del módulo 9 (*Explore Machine Learning*).

## Resultados

| Tipo | Modelo elegido | Validación cruzada | Prueba |
|---|---|---|---|
| Regresión | Regresión lineal | RMSE 5.02 · R² 0.992 | RMSE 5.65 · R² 0.989 |
| Clasificación | Regresión logística | F1 macro 0.984 | F1 macro 1.000 |
| Clustering | K-Means, k=4 | — | Silueta 0.810 |

## Datasets

Del archivo `ml-data.zip` del ejercicio. Son idénticos a los del Curso 02.

- [`datasets/ice-cream.csv`](datasets/ice-cream.csv): 200 días con día de la semana, mes, temperatura, lluvia y helados vendidos.
- [`datasets/penguins.csv`](datasets/penguins.csv): 344 pingüinos con 4 medidas y especie; 2 filas sin medidas.
- [`datasets/customers.csv`](datasets/customers.csv): 40 clientes con gasto y frecuencia promedio de compra.

## Imágenes

`imagenes/`: gráficas generadas por los cuadernos y embebidas en los entregables.

## Apuntes técnicos

- [`apuntes/notas-tecnicas.md`](apuntes/notas-tecnicas.md): protocolo de evaluación, decisiones de preprocesamiento y relación con el Curso 02.

## Cómo ejecutar

Requiere Python 3.11 con `numpy`, `pandas`, `matplotlib`, `scikit-learn` e `ipykernel`. Abre el notebook en VS Code, selecciona el kernel Python 3.11 y ejecuta las celdas en orden. Las imágenes de `imagenes/` se regeneran al ejecutarlos.
