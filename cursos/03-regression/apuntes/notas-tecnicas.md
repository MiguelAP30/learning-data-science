# Notas técnicas — Curso 03

## Entorno

Mismo que los cursos anteriores (Python 3.11.7). Añade `joblib` para serializar el modelo (viene con scikit-learn).

## Dataset `daily-bike-share.csv`

- 731 filas (una por día, dos años de datos: 2011 y 2012). Sin valores nulos.
- El label es `rentals`. Media ≈ 848 alquileres/día, con desviación estándar grande — mucha variación diaria.
- `temp`, `atemp`, `hum` y `windspeed` **ya vienen normalizadas** en el archivo original (valores entre 0 y 1).
- `weathersit` tiene 4 categorías posibles pero **la 4 no aparece nunca** en los datos (ningún día de lluvia fuerte/granizo).

## Decisiones tomadas

### Features usadas

Se descartan `instant` (identificador), `dteday` (fecha) y `yr` (año del estudio, no generalizable a futuro). Quedan 10 features:

```
season, mnth, holiday, weekday, workingday, weathersit, temp, atemp, hum, windspeed
```

`day` (día del mes) se crea con feature engineering en el cuaderno 01, se analiza y **se descarta**: los diagramas de caja muestran que apenas varía respecto al label, así que no es predictiva.

### División de datos

70/30 con `random_state=0` en los tres cuadernos → 511 filas de entrenamiento, 220 de prueba. Es imprescindible que sea la misma división en todos para que la comparación entre modelos sea válida.

### Reproducibilidad

Se añadió `random_state=0` a `DecisionTreeRegressor`, `RandomForestRegressor` y `GradientBoostingRegressor`. El ejercicio original **no lo hace**, y por eso advierte de que las métricas cambian en cada ejecución. Fijar la semilla permite que las cifras de la comparativa sean reproducibles.

### Métricas

Se añadió **MAE** (`mean_absolute_error`) a los tres cuadernos. El ejercicio original solo calcula MSE, RMSE y R²; MAE es una de las métricas exigidas por los entregables de la curva de formación.

### Preprocesamiento (cuaderno 03)

- Numéricas (índices 6-9): `StandardScaler`.
- Categóricas (índices 0-5): `OneHotEncoder(handle_unknown='ignore')`.
- Ambos dentro de un `ColumnTransformer` en un `Pipeline`.

**Resultado: empeoró ligeramente el modelo** (R² 0.7964 → 0.7926). No es un error de implementación: los modelos basados en árboles deciden por umbrales y no les afecta la escala de las features. Se deja documentado en vez de ocultarlo.

## Desviaciones respecto al ejercicio original

| Original | Aquí | Por qué |
|---|---|---|
| Descargar el CSV a mano y subirlo con "Upload Data" | Ruta directa a `../datasets/` | El dataset ya está versionado en el repo |
| `export_text(model)` imprime el árbol completo | `export_text(model, max_depth=3)` | El árbol sin poda tiene cientos de nodos; imprimirlo entero es ilegible |
| Sin `random_state` en los estimadores | Con `random_state=0` | Reproducibilidad |
| Solo MSE, RMSE, R² | + MAE | Exigido por los entregables |
| Bloque de métricas repetido en cada celda | Función `evaluar()` reutilizable | Evita repetir el mismo código 5 veces |
| Modelo guardado en `./bike-share.pkl` | `../entregables/bike-share-model.pkl` | El modelo entrenado es uno de los entregables |

## Modelo final

`GradientBoostingRegressor(random_state=0)` **sin** preprocesamiento — el que mejor rindió de los siete probados.

MAE 228.48 · RMSE 322.29 · R² 0.7964
