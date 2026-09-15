# Notas técnicas — Curso 04

## Entorno

Mismo que los cursos anteriores (Python 3.11.7, scikit-learn 1.9.0, pandas 2.2.3).

## Datasets

### `diabetes.csv`

- 15.000 filas, sin nulos. Label `Diabetic` (0/1), 8 features numéricas.
- **33.6% de casos positivos** en el conjunto de prueba — desbalance moderado. Relevante para interpretar la curva PR.
- Se descarta `PatientID` como feature (identificador único, no generalizable).

> Este mismo archivo está también en `cursos/02-ml-concepts/datasets/`, donde quedó como material de práctica sin usar. Se mantiene una copia propia aquí para que el curso sea autocontenido.

### `penguins.csv`

- 344 filas, **2 con las 4 features nulas** (índices 3 y 271) → se descartan con `dropna()`. Quedan 342.
- Tres clases: 0 Adelie, 1 Gentoo, 2 Chinstrap. Desbalanceadas (152/124/68), por eso la división usa `stratify`.

## Arreglos de compatibilidad sobre el material original

Los cuadernos originales **no se ejecutan** tal cual con las versiones actuales. Lo verificado y corregido:

| Problema | Versión que lo rompe | Solución aplicada |
|---|---|---|
| `LogisticRegression(multi_class='auto')` | Eliminado en scikit-learn **1.7** → `TypeError` | Se omite el parámetro; el comportamiento multiclase es automático |
| `row[0]` posicional sobre una Series en `iterrows()` | Obsoleto en pandas 2.x (`FutureWarning`) | Sustituido por `row.iloc[0]` |

## Otras correcciones

**Bug del cuaderno multiclase original.** Al evaluar el modelo SVM, el ejercicio de Microsoft vuelve a dibujar la matriz de confusión `mcm` calculada para el modelo **anterior** (regresión logística), en vez de recalcularla. Aquí se recalcula dentro de la función `evaluar_multiclase()`.

**Reproducibilidad.** Se añadió `random_state=0` a `RandomForestClassifier` y `SVC`. Los originales no lo fijan, así que sus métricas cambian en cada ejecución.

**Métricas.** Se añadió `f1_score` explícito y las curvas **precisión-recall**, que el ejercicio original no incluye. Ambas son exigidas por los entregables de la curva de formación.

## Decisión discutible del ejercicio original que se mantuvo

El cuaderno de métricas trata la columna `Age` (índice 7) como **categórica** y le aplica one-hot encoding, mientras escala las otras siete como numéricas.

Age es una variable numérica: aplicarle one-hot genera una columna binaria por cada edad distinta del dataset. Funciona y el modelo mejora, pero es una elección cuestionable — pierde el orden natural de la edad y dispara el número de columnas.

Se mantuvo igual que el original para poder comparar resultados, pero queda anotado como algo a revisar.

## Preprocesamiento

- **Binaria**: `StandardScaler` sobre las 7 features numéricas + `OneHotEncoder` sobre `Age`, dentro de un `ColumnTransformer`.
- **Multiclase**: `StandardScaler` sobre las 4 features.

Resultado: **mejoró en los dos casos**, a diferencia del Curso 03 donde empeoró el modelo. La diferencia es el tipo de algoritmo — aquí regresión logística (lineal) y SVM (basada en distancias), que sí se benefician del escalado; allá Gradient Boosting (árboles), que no.

## Modelos generados

Los cuadernos 02 y 03 guardan `diabetes-model.pkl` y `penguin-model.pkl` en `entregables/`. **No se versionan** (`.gitignore` del repo); se regeneran ejecutando el cuaderno correspondiente.

## Resultados

| Modelo | Exactitud | Precisión | Recall | F1 |
|---|---|---|---|---|
| Binaria — Regresión logística (baseline) | 0.7893 | 0.7242 | 0.6037 | 0.6585 |
| Binaria — Regresión logística + preproc. | 0.8389 | 0.7765 | 0.7318 | 0.7535 |
| Binaria — Random Forest + preproc. | 0.9342 | 0.9126 | 0.8897 | 0.9010 |
| Multiclase — Regresión logística (macro) | 0.9709 | 0.9688 | 0.9608 | 0.9646 |
| Multiclase — SVM + escalado (macro) | 0.9806 | 0.9767 | 0.9767 | 0.9767 |
