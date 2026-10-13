# Curso 07 - Python for Data Science and Machine Learning Bootcamp

Curso: [Python for Data Science and Machine Learning Bootcamp](https://www.udemy.com/course/python-for-data-science-and-machine-learning-bootcamp/) (Udemy, Pierian Data) · Certificación relacionada: complementaria

Recorrido completo del ecosistema de ciencia de datos en Python: NumPy, Pandas, visualización (Matplotlib, Seaborn, Plotly), machine learning con scikit-learn (regresión, clasificación, clustering, PCA, recomendadores, NLP), Spark y deep learning.

## Entregables

| # | Entregable | Archivo |
|---|---|---|
| 1 | Proyecto EDA con Pandas, Matplotlib y Seaborn | [`entregables/01-proyecto-eda.md`](entregables/01-proyecto-eda.md) |
| 2 | Proyecto de clasificación con scikit-learn | [`entregables/02-proyecto-clasificacion.md`](entregables/02-proyecto-clasificacion.md) |
| 3 | Proyecto de regresión con validación cruzada | [`entregables/03-proyecto-regresion-validacion-cruzada.md`](entregables/03-proyecto-regresion-validacion-cruzada.md) |

Resumen completo: [`entregables/resumen-entregables.md`](entregables/resumen-entregables.md)

## Notebooks

- [`notebooks/01-proyecto-eda-titanic.ipynb`](notebooks/01-proyecto-eda-titanic.ipynb): análisis exploratorio del Titanic con Pandas, Matplotlib y Seaborn.
- [`notebooks/02-proyecto-clasificacion-cancer-mama.ipynb`](notebooks/02-proyecto-clasificacion-cancer-mama.ipynb): 5 clasificadores comparados con validación cruzada, más KNN con método del codo y SVM con búsqueda en cuadrícula.
- [`notebooks/03-proyecto-regresion-vivienda.ipynb`](notebooks/03-proyecto-regresion-vivienda.ipynb): 4 regresores comparados con validación cruzada, más la curva de sesgo-varianza.

## Resultados

| Proyecto | Modelo elegido | Validación cruzada | Prueba |
|---|---|---|---|
| Clasificación (tumores) | Regresión logística | Recall maligno 0.953 · AUC 0.993 | Recall maligno 0.938 · AUC 0.998 |
| Regresión (vivienda) | Bosque aleatorio | RMSE 0.461 · R² 0.773 | RMSE 0.465 · R² 0.774 |

## Datos

Los tres proyectos usan datasets públicos que se cargan desde las propias librerías, sin archivos en el repo:

- Titanic: `seaborn.load_dataset('titanic')`.
- Breast Cancer Wisconsin: `sklearn.datasets.load_breast_cancer()`.
- California Housing: `sklearn.datasets.fetch_california_housing()` (se descarga la primera vez y queda en caché).

## Material del curso

El material original de Pierian Data (77 cuadernos y sus datos) **no está publicado**: es contenido de pago sin licencia de redistribución. Vive solo en local en `Refactored_Py_DS_ML_Bootcamp-master/`, excluido por `.gitignore`.

- [`apuntes/guia-del-curso.md`](apuntes/guia-del-curso.md): mi índice de estudio de ese material. Incluye la cobertura frente a las secciones de Udemy, el estado de cada cuaderno y los ajustes necesarios para las librerías actuales.
- [`apuntes/notas-tecnicas.md`](apuntes/notas-tecnicas.md): decisiones técnicas de los tres proyectos.

## Cómo ejecutar

Requiere Python 3.11 con `numpy`, `pandas`, `matplotlib`, `seaborn`, `scikit-learn` e `ipykernel`, y conexión a internet la primera vez (descarga de los datasets). Abre el notebook en VS Code, selecciona el kernel Python 3.11 y ejecuta las celdas en orden.
