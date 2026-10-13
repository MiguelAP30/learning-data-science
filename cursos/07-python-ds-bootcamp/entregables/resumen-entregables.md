# Entregables — Curso 07: Python for Data Science and Machine Learning Bootcamp

Curso: [Python for Data Science and Machine Learning Bootcamp](https://www.udemy.com/course/python-for-data-science-and-machine-learning-bootcamp/) (Udemy, Pierian Data)

- **Nivel:** Básico - Intermedio
- **Prioridad:** Obligatorio
- **Duración estimada:** 24-26 h de contenido | 50-70 h de práctica
- **Certificación relacionada:** Complementaria

---

## 1. Proyecto EDA con Pandas, Matplotlib y Seaborn

**→ [`entregables/01-proyecto-eda.md`](01-proyecto-eda.md)** · cuaderno [`01-proyecto-eda-titanic.ipynb`](../notebooks/01-proyecto-eda-titanic.ipynb)

Titanic (891 pasajeros): limpieza de nulos con imputación por grupo y cinco preguntas sobre la supervivencia. Hallazgos: el sexo es el factor dominante (mujeres de 1ª 96.8% frente a hombres de 3ª 13.5%); la prioridad a los niños llegó solo hasta los 12 años; el tamaño de familia tiene un efecto no lineal que la correlación (0.017) no detecta.

---

## 2. Proyecto de clasificación con scikit-learn

**→ [`entregables/02-proyecto-clasificacion.md`](02-proyecto-clasificacion.md)** · cuaderno [`02-proyecto-clasificacion-cancer-mama.ipynb`](../notebooks/02-proyecto-clasificacion-cancer-mama.ipynb)

Diagnóstico de tumores de mama (569 casos). Compara regresión logística, KNN (k elegido por el método del codo), árbol, bosque aleatorio y SVM (ajustado con `GridSearchCV`). Gana la **regresión logística**: recall maligno 0.953 en CV; en prueba detecta 60 de 64 malignos con 1 falsa alarma (AUC 0.998).

---

## 3. Proyecto de regresión con validación cruzada

**→ [`entregables/03-proyecto-regresion-validacion-cruzada.md`](03-proyecto-regresion-validacion-cruzada.md)** · cuaderno [`03-proyecto-regresion-vivienda.ipynb`](../notebooks/03-proyecto-regresion-vivienda.ipynb)

Precio de la vivienda en California (19 648 distritos). Validación cruzada de 5 pliegues sobre 4 algoritmos y curva de validación del compromiso sesgo-varianza. Gana el **bosque aleatorio**: RMSE 0.461 en CV y 0.465 en prueba (≈ 46 500 $), R² 0.774.

---

## Notas

- **Proyectos propios con datos públicos.** Siguen los temas y técnicas del curso, pero no reutilizan sus cuadernos ni sus datos. Los tres datasets se cargan desde `seaborn` o `scikit-learn`, así que el repositorio no redistribuye archivos de datos.
- **El material original del curso** (cuadernos y datos de Pierian Data) está solo en local: es contenido de pago sin licencia de redistribución. Su índice de estudio, escrito por mí, sí está publicado: [`apuntes/guia-del-curso.md`](../apuntes/guia-del-curso.md).
