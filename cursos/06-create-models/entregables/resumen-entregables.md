# Entregables — Curso 06: Create Machine Learning Models

Curso: [Create machine learning models](https://learn.microsoft.com/training/paths/create-machine-learn-models/) (Microsoft Learn)

- **Nivel:** Intermedio
- **Prioridad:** Obligatorio
- **Duración estimada:** 8-12 h de contenido | 14-20 h de práctica
- **Certificación relacionada:** DP-203 / DP-600 (complementario)

---

## 1. Mini portafolio con 3 modelos (regresión, clasificación y clustering)

**→ [`entregables/01-portafolio-modelos.md`](01-portafolio-modelos.md)**

| Tipo | Dataset | Modelo elegido | Resultado | Cuaderno |
|---|---|---|---|---|
| Regresión | Ventas de helados | Regresión lineal | RMSE 5.65 · R² 0.989 | [`01-regresion-helados.ipynb`](../notebooks/01-regresion-helados.ipynb) |
| Clasificación multiclase | Especies de pingüino | Regresión logística | F1 macro 0.984 (CV) · 1.000 (prueba) | [`02-clasificacion-pinguinos.ipynb`](../notebooks/02-clasificacion-pinguinos.ipynb) |
| Clustering | Clientes | K-Means, k=4 | Silueta 0.810 | [`03-clustering-clientes.ipynb`](../notebooks/03-clustering-clientes.ipynb) |

Incluye las predicciones de los 6 casos de prueba del ejercicio del módulo 9.

---

## 2. Informe de comparación de desempeño entre modelos

**→ [`entregables/02-informe-comparacion-modelos.md`](02-informe-comparacion-modelos.md)**

Cada tipo con su línea base y varios candidatos, evaluados con validación cruzada de 5 pliegues y confirmados en un conjunto de prueba:

- **Regresión:** media (línea base), regresión lineal, árbol, bosque aleatorio, gradient boosting.
- **Clasificación:** clase más frecuente (línea base), regresión logística, árbol, bosque aleatorio, SVM; en dos escenarios (4 medidas / solo aleta).
- **Clustering:** K-Means frente a jerárquica para k = 2…7, más las métricas de separación del módulo 7.

Hallazgo principal: el modelo más simple ganó o empató en los tres casos, y en clasificación las features pesaron mucho más que el algoritmo (F1 macro de ~0.66 a ~0.98 al pasar de 1 a 4 medidas).

---

## 3. Checklist de buenas prácticas para entrenamiento y evaluación

**→ [`entregables/03-checklist-buenas-practicas.md`](03-checklist-buenas-practicas.md)**

27 puntos en 5 fases (problema y datos · división · entrenamiento · evaluación · elegir y usar), cada uno con la referencia a dónde se aplicó en los cursos 02-06.

---

## Notas

- El contenido teórico del Curso 06 es el mismo que el del Curso 02 (*Fundamentals of machine learning*), y el ejercicio usa los mismos datos con la misma app ML Lite. Para no repetir el cuaderno del Curso 02, que entrena un modelo por tipo, el portafolio compara **varios algoritmos por tipo** con validación cruzada.
- Los datasets son los del archivo `ml-data.zip` del ejercicio. Son idénticos a los de `02-ml-concepts/datasets/`.
