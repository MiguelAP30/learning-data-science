# Notas técnicas — Curso 02

## Entorno

Mismo que el Curso 01 (Python 3.11.7), más `scikit-learn` que ya quedó instalado.

## Decisiones de preprocesamiento

### `ice-cream.csv` (regresión)

- Se descarta `Date` como feature: es única cada día, no aporta nada generalizable.
- `DayOfWeek` y `Month` son texto → **one-hot encoding** con `OneHotEncoder`. La app web hacía esto de forma invisible.
- `Temperature` y `Rainfall` se dejan tal cual (`passthrough`).
- Todo va dentro de un `Pipeline` + `ColumnTransformer`, para que la misma transformación se aplique automáticamente al predecir casos nuevos.
- División 70/30, `random_state=42`.

### `penguins.csv` (clasificación)

- **2 filas con las 4 medidas nulas** (índices 3 y 271) → se descartan con `dropna()`. No tiene sentido imputar cuando falta la observación entera. Quedan 342 de 344.
- `StandardScaler` antes de la regresión logística: `BodyMass` está en miles y `CulmenDepth` en decenas.
- División estratificada (`stratify=y`) para conservar la proporción de las 3 especies en ambos conjuntos.

### `customers.csv` (clustering)

- `StandardScaler` antes de K-Means: el algoritmo se basa en distancias, y gasto y frecuencia tienen escalas distintas.
- `k` óptimo elegido por **coeficiente de silueta** probando k = 2..7 (equivale a la opción "Automático" de la app web).
- Los centroides se devuelven a las unidades originales con `inverse_transform` para poder graficarlos sobre los datos sin escalar.

## Resultados obtenidos

| Modelo | Métricas |
|---|---|
| Regresión (helados) | MAE 4.590 · MSE 31.923 · RMSE 5.650 · R² 0.989 |
| Clasificación (pingüinos) | Exactitud 1.000 (dataset muy separable) |
| Clustering (clientes) | k óptimo = 4 · silueta 0.810 |

Las métricas de regresión quedan muy cerca de las de la app web (MAE 4.274, RMSE 5.532, R² 0.989); la diferencia se explica por la división aleatoria distinta.

El clustering encontró 4 grupos que corresponden a un cuadrante de gasto alto/bajo × frecuencia alta/baja.

## Predicciones de los casos de prueba

- Helados — Caso 1 (Friday, May, 72.3°, 0.01): **130**. Caso 2 (Monday, November, 55.8°, 0.56): **41**.
- Pingüinos — Caso 1: clase **1** (Gentoo, p=0.985). Caso 2: clase **2** (Barbijo, p=0.954).
- Clientes — Caso 1 (gasto 21, frec. 105): clúster **1**. Caso 2 (gasto 46.9, frec. 2): clúster **3**.
