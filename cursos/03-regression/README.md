# Curso 03 - Train and Evaluate Regression Models

Curso: [Train and evaluate regression models](https://learn.microsoft.com/training/modules/train-evaluate-regression-models/) (Microsoft Learn) · Certificación relacionada: DP-100

Predicción del número de alquileres diarios de bicicletas a partir de la estación del año y las condiciones meteorológicas.

## Entregables

| # | Entregable | Archivo |
|---|---|---|
| 1 | Baseline + modelo mejorado | [`entregables/comparativa-modelos.md`](entregables/comparativa-modelos.md) · [`entregables/bike-share-model.pkl`](entregables/bike-share-model.pkl) |
| 2 | Evaluación con RMSE, MAE y R² | [`entregables/comparativa-modelos.md`](entregables/comparativa-modelos.md) |
| 3 | Notebook con ajuste de hiperparámetros y versión final | [`notebooks/03-optimizacion-modelos.ipynb`](notebooks/03-optimizacion-modelos.ipynb) |

Resumen completo: [`entregables/resumen-entregables.md`](entregables/resumen-entregables.md)

## Notebooks

Traducidos al español y adaptados de los ejercicios originales del curso.

- [`notebooks/01-regresion-lineal.ipynb`](notebooks/01-regresion-lineal.ipynb) — Módulo 3: exploración del dataset (distribuciones, correlaciones, feature engineering) y modelo **baseline** con `LinearRegression`.
- [`notebooks/02-modelos-regresion.ipynb`](notebooks/02-modelos-regresion.ipynb) — Módulo 5: comparación de 5 algoritmos (lineal, Lasso, árbol de decisión, Random Forest, Gradient Boosting).
- [`notebooks/03-optimizacion-modelos.ipynb`](notebooks/03-optimizacion-modelos.ipynb) — Módulo 7: búsqueda en cuadrícula de hiperparámetros, pipelines de preprocesamiento, guardado del modelo e inferencia.

## Resultado

| | MAE | RMSE | R² |
|---|---|---|---|
| Baseline (`LinearRegression`) | 323.00 | 449.41 | 0.604 |
| **Final (`GradientBoostingRegressor`)** | **228.48** | **322.29** | **0.796** |

## Datasets

- [`datasets/daily-bike-share.csv`](datasets/daily-bike-share.csv) — 731 días de alquiler de bicicletas con estación, clima y número de alquileres.

  Fuente: [MicrosoftLearning/mslearn-ml-basics](https://github.com/MicrosoftLearning/mslearn-ml-basics). Datos originales de [Capital Bikeshare](https://www.capitalbikeshare.com/system-data), usados según su [acuerdo de licencia](https://www.capitalbikeshare.com/data-license-agreement).

## Apuntes técnicos

- [`apuntes/notas-tecnicas.md`](apuntes/notas-tecnicas.md) — decisiones de preprocesamiento, reproducibilidad y desviaciones respecto al ejercicio original.

## Cómo ejecutar

Requiere Python 3.11 con `numpy`, `pandas`, `matplotlib`, `scikit-learn`, `joblib` e `ipykernel`. Abre el notebook en VS Code, selecciona el kernel Python 3.11 y ejecuta las celdas en orden.

> El cuaderno 03 incluye una búsqueda en cuadrícula con validación cruzada (27 entrenamientos): esa celda tarda bastante más que el resto.
