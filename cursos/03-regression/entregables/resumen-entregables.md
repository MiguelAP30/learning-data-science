# Entregables — Curso 03: Train and Evaluate Regression Models

Curso: [Train and evaluate regression models](https://learn.microsoft.com/training/modules/train-evaluate-regression-models/) (Microsoft Learn)

- **Nivel:** Intermedio
- **Prioridad:** Obligatorio
- **Duración estimada:** 6-9 h de contenido | 12-18 h de práctica
- **Certificación relacionada:** DP-100

## Estado

| # | Entregable pedido | Estado | Dónde está |
|---|---|---|---|
| 1 | Modelo de regresión entrenado con baseline y modelo mejorado | ✅ | Baseline: [`../notebooks/01-regresion-lineal.ipynb`](../notebooks/01-regresion-lineal.ipynb) · Mejorado: [`../notebooks/02-modelos-regresion.ipynb`](../notebooks/02-modelos-regresion.ipynb) · Modelo serializado: [`bike-share-model.pkl`](bike-share-model.pkl) |
| 2 | Evaluación con RMSE, MAE y R² | ✅ | Las tres métricas en los tres cuadernos · Tabla completa en [`comparativa-modelos.md`](comparativa-modelos.md) |
| 3 | Notebook con ajuste de hiperparámetros y versión final | ✅ | [`../notebooks/03-optimizacion-modelos.ipynb`](../notebooks/03-optimizacion-modelos.ipynb) |

## Detalle

**1. Baseline y modelo mejorado.** El baseline es una `LinearRegression` (R² 0.604). El modelo mejorado es un `GradientBoostingRegressor` (R² 0.796), elegido tras comparar cinco algoritmos sobre la misma división de datos. La mejora es de un **−29% en MAE** y **+32% en varianza explicada**.

**2. Evaluación con las tres métricas.** El ejercicio original de Microsoft Learn solo calcula MSE, RMSE y R². Se añadió **MAE** en los tres cuadernos porque es una de las métricas exigidas aquí.

**3. Ajuste de hiperparámetros.** Búsqueda en cuadrícula (`GridSearchCV`) sobre `learning_rate` × `n_estimators` con validación cruzada de 3 pliegues, más experimentación con pipelines de preprocesamiento. El cuaderno termina guardando el modelo final con `joblib` y usándolo para inferencia sobre datos nuevos (predicción individual y en lote a 5 días).

## Un resultado que conviene leer

Ni el ajuste de hiperparámetros ni el preprocesamiento mejoraron el modelo — de hecho el preprocesamiento lo empeoró ligeramente. Está documentado y explicado en [`comparativa-modelos.md`](comparativa-modelos.md): los modelos basados en árboles no se benefician del escalado, porque deciden por umbrales y no por magnitudes.

Se deja así, con el resultado real, en vez de forzar una mejora artificial.

## Pendiente

El curso propone un desafío final de predicción de precios inmobiliarios (`02 - Real Estate Regression Challenge`). No incluido aquí; el dataset `home-rental.csv` del Curso 02 sirve para practicar lo mismo.
