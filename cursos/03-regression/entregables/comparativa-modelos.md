# Comparativa de modelos — Baseline vs. modelo mejorado

Curso 03 · Predicción de alquileres diarios de bicicletas (`daily-bike-share.csv`, 731 días)

Todos los modelos se entrenaron y evaluaron sobre **exactamente la misma división** de datos (70/30, `random_state=0` → 511 filas de entrenamiento, 220 de prueba), para que la comparación sea justa.

## Resultados

| Modelo | MAE ↓ | RMSE ↓ | R² ↑ | |
|---|---|---|---|---|
| LinearRegression | 322.998 | 449.414 | 0.604 | ← **baseline** |
| Lasso | 320.598 | 448.504 | 0.606 | |
| DecisionTreeRegressor | 316.123 | 487.693 | 0.534 | |
| RandomForestRegressor | 243.781 | 342.615 | 0.770 | |
| **GradientBoostingRegressor** | **228.476** | **322.293** | **0.796** | ← **modelo final** |
| GradientBoosting + hiperparámetros ajustados | 228.476 | 322.293 | 0.796 | |
| GradientBoosting + preprocesamiento | 232.065 | 325.261 | 0.793 | |
| RandomForest + preprocesamiento | 231.634 | 325.243 | 0.793 | |

↓ menor es mejor · ↑ mayor es mejor

## Mejora conseguida

| Métrica | Baseline | Final | Mejora |
|---|---|---|---|
| **MAE** | 322.998 | 228.476 | −29.3% de error |
| **RMSE** | 449.414 | 322.293 | −28.3% de error |
| **R²** | 0.604 | 0.796 | +31.8% de varianza explicada |

En términos interpretables: el modelo base se equivocaba en promedio en unos **323 alquileres** por día; el final se equivoca en unos **228**.

## Lectura de los resultados

**Un árbol solo rinde peor que una recta.** `DecisionTreeRegressor` obtuvo R² 0.534, por debajo del baseline lineal (0.604). Un árbol sin poda se ajusta a cada caso individual del entrenamiento y generaliza mal.

**Combinar árboles sí funciona.** Los dos algoritmos de conjunto superaron claramente tanto al árbol individual como al modelo lineal. El boosting (0.796) quedó ligeramente por encima del bagging (0.770).

**El ajuste de hiperparámetros no mejoró nada.** La búsqueda en cuadrícula sobre `learning_rate` × `n_estimators` devolvió `{'learning_rate': 0.1, 'n_estimators': 100}` — los valores por defecto. No es un fallo: significa que scikit-learn ya trae valores razonables para este caso, y que habría que ampliar la cuadrícula para encontrar algo mejor.

**El preprocesamiento empeoró ligeramente el modelo.** Añadir escalado (`StandardScaler`) y one-hot bajó el R² de 0.796 a 0.793. La razón es de fondo: los modelos basados en árboles deciden con umbrales del tipo "¿esta feature es menor que X?", y reescalar no altera el orden de los valores. El escalado sirve para modelos **lineales** y basados en **distancias**, no para árboles.

Por eso el modelo final entregado es el **Gradient Boosting sin preprocesamiento**: es el que mejor rinde de todos los probados.

## Modelo final

`GradientBoostingRegressor(random_state=0)`, entrenado sobre las 511 filas del conjunto de entrenamiento.

Al ejecutar el cuaderno [`../notebooks/03-optimizacion-modelos.ipynb`](../notebooks/03-optimizacion-modelos.ipynb) se serializa con `joblib` en `bike-share-model.pkl`. Ese archivo no está en el repositorio (ver `.gitignore`): es un binario no revisable en un diff y atado a la versión de scikit-learn con la que se creó. Se regenera ejecutando el cuaderno.

Una vez generado, se carga y se usa así:

```python
import joblib
import numpy as np

model = joblib.load('bike-share-model.pkl')

# [season, mnth, holiday, weekday, workingday, weathersit, temp, atemp, hum, windspeed]
X_new = np.array([[1, 1, 0, 3, 1, 1, 0.226957, 0.22927, 0.436957, 0.1869]])
print(f'{model.predict(X_new)[0]:.0f} alquileres')
```

## Reproducibilidad

Los tres cuadernos usan `random_state=0` tanto en la división de datos como en los algoritmos con componente aleatorio (árbol, Random Forest, Gradient Boosting). El ejercicio original del curso no fija la semilla en los estimadores, lo que hace que sus resultados varíen entre ejecuciones.
