# Comparativo de métricas — precisión, recall, F1 y exactitud

Curso 04 · Todos los modelos entrenados y evaluados sobre la misma división de datos (70/30, `random_state=0`).

---

## Clasificación binaria — diabetes

15.000 pacientes · 8 features · 10.500 de entrenamiento, 4.500 de prueba · 33.6% de casos positivos.

| Modelo | Exactitud | Precisión | Recall | F1 | AUC | AP |
|---|---|---|---|---|---|---|
| Regresión logística (baseline) | 0.7893 | 0.7242 | 0.6037 | 0.6585 | 0.8568 | 0.7446 |
| Regresión logística + preprocesamiento | 0.8389 | 0.7765 | 0.7318 | 0.7535 | 0.9202 | 0.8554 |
| **Random Forest + preprocesamiento** | **0.9342** | **0.9126** | **0.8897** | **0.9010** | **0.9826** | **0.9651** |

### Qué dice cada métrica sobre el baseline

Este es el punto del curso, y se ve mejor con números reales que con definiciones:

| Métrica | Valor | Traducción |
|---|---|---|
| Exactitud | 0.7893 | Acierta 4 de cada 5 predicciones |
| Precisión | 0.7242 | De los que señaló como diabéticos, el 72% lo era |
| **Recall** | **0.6037** | **De los diabéticos reales, se le escapó el 40%** |
| F1 | 0.6585 | El equilibrio entre las dos anteriores |

Mirando solo la exactitud (0.79) el modelo parece aceptable. El recall revela que **deja sin detectar a 2 de cada 5 pacientes enfermos** — que en un contexto clínico es exactamente el error que más caro sale.

### Mejora acumulada

| Métrica | Baseline | Final | Mejora |
|---|---|---|---|
| Exactitud | 0.7893 | 0.9342 | +18.4% |
| Precisión | 0.7242 | 0.9126 | +26.0% |
| **Recall** | 0.6037 | 0.8897 | **+47.4%** |
| F1 | 0.6585 | 0.9010 | +36.8% |

El recall es el que más mejora: los falsos negativos bajaron de 600 a 167.

---

## Clasificación multiclase — especies de pingüino

342 pingüinos (tras descartar 2 filas sin datos) · 4 features · 3 clases · división estratificada.

Con más de dos clases no hay una "clase positiva" única, así que precisión, recall y F1 se promedian. Aquí se usa **macro** (mismo peso a cada clase, sin importar cuántos casos tenga).

| Modelo | Exactitud | Precisión (macro) | Recall (macro) | F1 (macro) | AUC (OVR) |
|---|---|---|---|---|---|
| Regresión logística | 0.9709 | 0.9688 | 0.9608 | 0.9646 | **0.9994** |
| **SVM + escalado** | **0.9806** | **0.9767** | **0.9767** | **0.9767** | 0.9990 |

Las diferencias son pequeñas porque el dataset es fácil de separar. La SVM gana en las cuatro métricas principales; la regresión logística queda marginalmente por encima en AUC.

---

## Dos lecturas que vale la pena retener

**1. La exactitud sola no sirve.** Con un 3% de positivos, un clasificador que siempre prediga "no" alcanza un 97% de exactitud sin identificar a un solo enfermo. Aquí el desbalance es menor, pero el baseline ya muestra el patrón: exactitud decente (0.79) escondiendo un recall pobre (0.60).

**2. El preprocesamiento ayuda aquí, pero no siempre.** Escalar y codificar mejoró la regresión logística de forma clara (F1 de 0.66 a 0.75). En el Curso 03, el mismo preprocesamiento **empeoró** un Gradient Boosting.

La regla es la misma en ambos casos: el escalado sirve para modelos **lineales** y basados en **distancias**, y no le hace nada a los basados en **árboles**, que deciden por umbrales y no se ven afectados por la escala.

---

## Cómo reproducirlo

| Sección | Cuaderno |
|---|---|
| Binaria — baseline | [`../notebooks/01-clasificacion-binaria.ipynb`](../notebooks/01-clasificacion-binaria.ipynb) |
| Binaria — comparativa completa | [`../notebooks/02-metricas-clasificacion.ipynb`](../notebooks/02-metricas-clasificacion.ipynb) |
| Multiclase | [`../notebooks/03-clasificacion-multiclase.ipynb`](../notebooks/03-clasificacion-multiclase.ipynb) |

> El ejercicio original del curso no calcula F1 de forma explícita (solo aparece dentro del `classification_report`) ni usa `random_state` en el Random Forest. Aquí se añadieron ambos: F1 porque es una de las métricas pedidas, y la semilla para que estas cifras sean reproducibles.
