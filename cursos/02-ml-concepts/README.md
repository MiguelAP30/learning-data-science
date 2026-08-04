# Curso 02 - Introduction to Machine Learning Concepts

Curso: [Fundamentals of machine learning](https://learn.microsoft.com/training/modules/fundamentals-machine-learning/) (Microsoft Learn) · Certificación relacionada: DP-100

## Entregables

| # | Entregable | Archivo |
|---|---|---|
| 1 | Mapa conceptual de tipos de ML | [`entregables/01-mapa-conceptual-tipos-ml.md`](entregables/01-mapa-conceptual-tipos-ml.md) |
| 2 | Matriz de escenarios para seleccionar modelo | [`entregables/02-matriz-escenarios.md`](entregables/02-matriz-escenarios.md) |
| 3 | Notebook supervisado + no supervisado | [`notebooks/01-explorar-escenarios-ml.ipynb`](notebooks/01-explorar-escenarios-ml.ipynb) |

Resumen completo: [`entregables/resumen-entregables.md`](entregables/resumen-entregables.md)

## Notebooks

- [`notebooks/01-explorar-escenarios-ml.ipynb`](notebooks/01-explorar-escenarios-ml.ipynb) — Módulo 9 (ejercicio): entrena y evalúa los tres tipos de modelo del curso (regresión, clasificación y clustering) con scikit-learn.

El ejercicio original se hacía en la app web [ML Lite](https://aka.ms/ml-lite). Este notebook lo reproduce en código para ver qué hace la herramienta por dentro — en particular dos pasos que la app ocultaba: la codificación de variables de texto y el escalado de features.

## Datasets

Fuente: [ml-data.zip](https://aka.ms/mslearn-ai-data) (Microsoft Learn).

| Archivo | Usado en | Contenido |
|---|---|---|
| [`datasets/ice-cream.csv`](datasets/ice-cream.csv) | Parte 1 (regresión) | Ventas diarias de helados con clima y estacionalidad |
| [`datasets/penguins.csv`](datasets/penguins.csv) | Parte 2 (clasificación) | Medidas físicas de pingüinos y su especie (0/1/2) |
| [`datasets/customers.csv`](datasets/customers.csv) | Parte 3 (clustering) | Gasto y frecuencia de compra de 40 clientes |
| [`datasets/diabetes.csv`](datasets/diabetes.csv) | — | Métricas clínicas y diagnóstico (0/1). Sin usar: sirve para practicar clasificación binaria |
| [`datasets/home-rental.csv`](datasets/home-rental.csv) | — | Propiedades y su renta. Sin usar: sirve para practicar regresión |

## Imágenes

`imagenes/ml-lite-*.png` — capturas de los 5 pasos de la app web original, útiles para comparar resultados. La de resultados trae las métricas de referencia: MAE 4.274, RMSE 5.532, R² 0.989.

## Apuntes técnicos

- [`apuntes/notas-tecnicas.md`](apuntes/notas-tecnicas.md) — decisiones de preprocesamiento y resultados obtenidos.

## Cómo ejecutar

Requiere Python 3.11 con `numpy`, `pandas`, `matplotlib`, `scikit-learn` e `ipykernel`. Abre el notebook en VS Code, selecciona el kernel Python 3.11 y ejecuta las celdas en orden.
