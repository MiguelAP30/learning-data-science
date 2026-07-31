# Notas técnicas — Curso 01

## Entorno

- Python 3.11.7 (`C:\Program Files\Python311\python.exe`), no la instalación de 3.14 que trae Windows por defecto — esa no tenía `numpy`/`pandas`/`ipykernel` instalados.
- Paquetes usados: `numpy`, `pandas`, `matplotlib`, `scipy`, `scikit-learn`, `ipykernel`.
- En VS Code, seleccionar explícitamente el kernel "Python 3.11.7" (Select Kernel → Python Environments) antes de ejecutar cualquier notebook; el kernel por defecto puede apuntar a un intérprete sin estas dependencias.

## Decisiones de preprocesamiento (`grades.csv`)

- Filas con valores nulos en `StudyHours`/`Grade`: se eliminan con `dropna()` en vez de imputar, para todos los notebooks de este curso (decisión consistente en los 3 notebooks).
- `StudyHours == 1` (el valor de Vicky) se trató como valor atípico y se excluyó (`df_students.StudyHours > 1`) solo en el notebook de datos del mundo real, para el análisis de distribución y regresión. No se excluye en los notebooks anteriores.
- Umbral de aprobación (`Pass`): `Grade >= 60`, fijo en los tres notebooks.

## Notebooks de este curso

1. `01-numpy-pandas.ipynb` — cimientos: arrays, DataFrame, `loc`/`iloc`, carga de CSV, `isnull`/`fillna`/`dropna`.
2. `02-matplotlib-visualizacion.ipynb` — gráficos con Matplotlib, estadística descriptiva básica (media/mediana/moda), histograma, diagrama de caja, densidad.
3. `03-datos-mundo-real.ipynb` — valores atípicos por percentil, sesgo, variabilidad, normalización (MinMax), correlación y regresión lineal para predecir `Grade` a partir de `StudyHours`.

Las imágenes en `../imagenes/` son capturas exportadas de las celdas de `02-matplotlib-visualizacion.ipynb`.
