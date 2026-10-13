# Notas técnicas — Curso 06

## Relación con el Curso 02

El Curso 06 reutiliza el módulo *Fundamentals of machine learning*, el mismo del Curso 02: misma teoría, mismo ejercicio con ML Lite y mismos datos (`ml-data.zip` es idéntico, archivo por archivo, a `02-ml-concepts/datasets/`).

El cuaderno del Curso 02 entrena **un** modelo por tipo, como la app. Aquí se compara **varios** por tipo, que es lo que piden los entregables (portafolio + informe de comparación).

## Protocolo de evaluación (común a los tres cuadernos)

- `random_state=42` en divisiones, validación cruzada y modelos con aleatoriedad.
- División 70/30. En clasificación, estratificada.
- Validación cruzada de 5 pliegues **solo sobre el entrenamiento**: `KFold(shuffle=True)` en regresión y `StratifiedKFold` en clasificación.
- La prueba se usa una sola vez, al final, para confirmar.
- Preprocesamiento siempre dentro del `Pipeline`, para que en cada pliegue se ajuste solo con los datos de entrenamiento de ese pliegue.

## Decisiones por cuaderno

### 01 · Regresión (helados)

- `Date` fuera; `DayOfWeek` y `Month` con `OneHotEncoder(handle_unknown='ignore')`; `Temperature` y `Rainfall` sin transformar.
- Sin escalado: ninguno de los 5 algoritmos comparados depende de distancias, y la regresión lineal da las mismas predicciones con o sin escalar.
- `n_estimators=200` en el bosque aleatorio; el resto con los valores por defecto. No se ajustaron hiperparámetros: el objetivo era comparar algoritmos, no optimizar uno.
- Los resultados de la regresión lineal en prueba (MAE 4.590, RMSE 5.650, R² 0.989) coinciden con los del Curso 02, que usó la misma división.

### 02 · Clasificación (pingüinos)

- `dropna()` elimina las 2 filas con las 4 medidas vacías (quedan 342).
- `StandardScaler` solo en los pipelines de regresión logística y SVM.
- Métrica principal: **F1 macro**, por el desequilibrio de clases (44 / 36 / 20%).
- Escenario B (solo `FlipperLength`): se añadió porque con las 4 medidas el dataset es casi perfectamente separable, y todos los modelos rondan el 0.98, lo que no permite comparar nada. Reproduce el ejemplo simplificado del módulo 6.
- En el escenario A, el orden de la tabla desempata por F1 en prueba, porque regresión logística y SVM empatan en CV.

### 03 · Clustering (clientes)

- `StandardScaler` sobre las dos features.
- K-Means con `n_init=10`; jerárquica aglomerativa con enlace *ward* (por defecto).
- `k` elegido por máxima silueta de K-Means, contrastado con el codo.
- Las 4 métricas del módulo 7 se calculan a mano con NumPy en el espacio escalado. La "distancia media a otros centros" promedia la distancia de cada punto a todos los centros que no son el suyo.
- La "distancia a su centro" de los casos de prueba se compara con la distancia máxima observada por clúster para detectar casos fuera de rango.

## Predicciones de los casos de prueba

| Modelo | Caso 1 | Caso 2 |
|---|---|---|
| Helados | 130 | 41 |
| Pingüinos | 1 · Gentoo | 2 · Barbijo |
| Clientes | Clúster 1 (dist. 3.20, fuera de rango) | Clúster 3 (dist. 0.75) |

Las seis coinciden con las del Curso 02.
