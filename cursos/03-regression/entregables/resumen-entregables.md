# Entregables — Curso 03: Train and Evaluate Regression Models

Curso: [Train and evaluate regression models](https://learn.microsoft.com/training/modules/train-evaluate-regression-models/) (Microsoft Learn)

- **Nivel:** Intermedio
- **Prioridad:** Obligatorio
- **Duración estimada:** 6-9 h de contenido | 12-18 h de práctica
- **Certificación relacionada:** DP-100

Caso de estudio: predicción del número de alquileres diarios de bicicletas a partir de la estación del año y las condiciones meteorológicas (731 días de datos reales).

---

## 1. Modelo de regresión entrenado con baseline y modelo mejorado

**→ [`notebooks/02-modelos-regresion.ipynb`](../notebooks/02-modelos-regresion.ipynb)**

Entrena cinco algoritmos sobre exactamente la misma división de datos (70/30, `random_state=0`) y los compara:

| Modelo | MAE | RMSE | R² | |
|---|---|---|---|---|
| LinearRegression | 322.998 | 449.414 | 0.604 | ← **baseline** |
| Lasso | 320.598 | 448.504 | 0.606 | |
| DecisionTreeRegressor | 316.123 | 487.693 | 0.534 | |
| RandomForestRegressor | 243.781 | 342.615 | 0.770 | |
| **GradientBoostingRegressor** | **228.476** | **322.293** | **0.796** | ← **modelo mejorado** |

El baseline se entrena y explora a fondo en [`notebooks/01-regresion-lineal.ipynb`](../notebooks/01-regresion-lineal.ipynb), donde además se perfila el dataset y se descarta una feature no predictiva.

**Mejora conseguida:** −29% de error absoluto medio y +32% de varianza explicada.

---

## 2. Evaluación con RMSE, MAE y R²

**→ [`entregables/comparativa-modelos.md`](comparativa-modelos.md)**

Documento con la tabla completa de los siete modelos evaluados, la mejora del baseline al modelo final métrica por métrica, y la interpretación de los resultados.

Las tres métricas se calculan en los tres cuadernos:

| Métrica | Qué mide | Baseline → Final |
|---|---|---|
| **MAE** | Error medio en unidades del label (alquileres) | 323.00 → 228.48 |
| **RMSE** | Error medio penalizando más los fallos grandes | 449.41 → 322.29 |
| **R²** | Proporción de varianza explicada (0 a 1) | 0.604 → 0.796 |

> El ejercicio original de Microsoft Learn solo calcula MSE, RMSE y R². Se añadió **MAE** en los tres cuadernos por ser una de las métricas exigidas.

---

## 3. Notebook con ajuste de hiperparámetros y versión final

**→ [`notebooks/03-optimizacion-modelos.ipynb`](../notebooks/03-optimizacion-modelos.ipynb)**

Contiene:

- **Búsqueda en cuadrícula** (`GridSearchCV`) sobre `learning_rate` × `n_estimators` con validación cruzada de 3 pliegues — 27 entrenamientos.
- **Pipelines de preprocesamiento**: `StandardScaler` para las numéricas y `OneHotEncoder` para las categóricas, dentro de un `ColumnTransformer`.
- **Versión final** del modelo, serializada con `joblib`.
- **Inferencia** sobre datos nuevos: predicción individual y en lote a 5 días.

El archivo `bike-share-model.pkl` se genera al ejecutar el cuaderno y **no se versiona** (ver `.gitignore`): es un binario no revisable en un diff y atado a la versión de scikit-learn con la que se creó. La fuente de verdad es el cuaderno.

---

## Dos resultados que conviene leer

Documentados con su explicación en [`comparativa-modelos.md`](comparativa-modelos.md), porque contradicen lo esperado:

1. **La búsqueda en cuadrícula no mejoró el modelo**: devolvió `learning_rate=0.1, n_estimators=100`, que son los valores por defecto de scikit-learn.
2. **El preprocesamiento lo empeoró ligeramente** (R² 0.796 → 0.793). Los algoritmos basados en árboles deciden por umbrales, así que reescalar no cambia el orden de los valores. El escalado sirve para modelos lineales y basados en distancias.

Por eso el modelo entregado es el **Gradient Boosting sin preprocesamiento**: el que mejor rinde de los siete probados.

## Pendiente

El curso propone un desafío final de predicción de precios inmobiliarios (`02 - Real Estate Regression Challenge`), no incluido aquí. El dataset `home-rental.csv` del Curso 02 sirve para practicar lo mismo.
