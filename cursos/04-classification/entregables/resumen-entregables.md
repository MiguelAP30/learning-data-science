# Entregables — Curso 04: Train and Evaluate Classification Models

Curso: [Train and evaluate classification models](https://learn.microsoft.com/training/modules/train-evaluate-classification-models/) (Microsoft Learn)

- **Nivel:** Intermedio
- **Prioridad:** Obligatorio
- **Duración estimada:** 4-6 h de contenido | 8-12 h de práctica
- **Certificación relacionada:** DP-100

Dos casos de estudio: predecir diabetes a partir de datos clínicos (binaria) y la especie de un pingüino a partir de sus medidas (multiclase).

---

## 1. Modelo de clasificación binaria y multiclase

**→ [`notebooks/`](../notebooks/)**

| Cuaderno | Tipo | Dataset | Mejor modelo |
|---|---|---|---|
| [`01-clasificacion-binaria.ipynb`](../notebooks/01-clasificacion-binaria.ipynb) | Binaria | `diabetes.csv` (15.000 pacientes) | Regresión logística — baseline, exactitud 0.7893 |
| [`02-metricas-clasificacion.ipynb`](../notebooks/02-metricas-clasificacion.ipynb) | Binaria | `diabetes.csv` | Random Forest + preprocesamiento — F1 **0.9010** |
| [`03-clasificacion-multiclase.ipynb`](../notebooks/03-clasificacion-multiclase.ipynb) | Multiclase (3 clases) | `penguins.csv` (342 pingüinos) | SVM + escalado — F1 macro **0.9767** |

Los tres se versionan **ya ejecutados**, con sus salidas y gráficas, para poder revisarlos sin correrlos.

---

## 2. Matriz de confusión y curva ROC/PR

**→ [`entregables/matriz-confusion-y-curvas.md`](matriz-confusion-y-curvas.md)**

Documento con las cuatro figuras y su lectura:

- Matriz de confusión binaria (2857 TN · 129 FP · 167 FN · 1347 TP)
- Curvas ROC y PR binarias (AUC 0.9826 · AP 0.9651)
- Matriz de confusión multiclase (3×3)
- Curvas ROC y PR multiclase, una por clase en modo OVR (AUC promedio 0.9990)

> La **curva PR no está en el ejercicio original** del curso, que solo cubre ROC. Se añadió por ser uno de los entregables pedidos, y el documento explica cuándo una es preferible a la otra.

---

## 3. Comparativo de métricas: precisión, recall, F1 y exactitud

**→ [`entregables/comparativa-metricas.md`](comparativa-metricas.md)**

Tablas comparativas de los cinco modelos entrenados, con las cuatro métricas pedidas más AUC y AP.

El hallazgo que mejor ilustra el punto del curso, sobre el baseline binario:

| Métrica | Valor | Traducción |
|---|---|---|
| Exactitud | 0.7893 | Parece un modelo aceptable |
| **Recall** | **0.6037** | **Se le escapa el 40% de los diabéticos reales** |

Es exactamente el motivo por el que la exactitud sola no basta.

---

## Notas sobre el material original

| Problema encontrado | Qué se hizo |
|---|---|
| El enlace del módulo 5 al cuaderno está roto (trae `%7B:target=%22_blank%22%7D` pegado a la URL) | Se recuperó desde la URL limpia |
| `LogisticRegression(multi_class='auto')` fue **eliminado** en scikit-learn 1.7 y da error en la versión actual | Se omite el parámetro; el comportamiento multiclase es automático |
| `row[0]` posicional sobre una Series está obsoleto en pandas 2.x | Sustituido por `row.iloc[0]` |
| El cuaderno multiclase redibuja la matriz de confusión del modelo **anterior** al evaluar el nuevo | Corregido: se recalcula |
| Sin `random_state` en Random Forest ni SVM | Añadido, para que las métricas sean reproducibles |
| F1 solo aparecía dentro del `classification_report` | Añadido explícitamente, por ser métrica pedida |

## Pendiente

El curso propone un desafío opcional de clasificación de vinos según sus variedades de uva. No incluido aquí.
