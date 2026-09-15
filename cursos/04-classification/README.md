# Curso 04 - Train and Evaluate Classification Models

Curso: [Train and evaluate classification models](https://learn.microsoft.com/training/modules/train-evaluate-classification-models/) (Microsoft Learn) · Certificación relacionada: DP-100

Dos casos: predecir diabetes a partir de datos clínicos (binaria) y la especie de un pingüino a partir de sus medidas (multiclase).

## Entregables

| # | Entregable | Archivo |
|---|---|---|
| 1 | Modelo de clasificación binaria y multiclase | [`notebooks/`](notebooks/) |
| 2 | Matriz de confusión y curva ROC/PR | [`entregables/matriz-confusion-y-curvas.md`](entregables/matriz-confusion-y-curvas.md) |
| 3 | Comparativo de métricas: precisión, recall, F1 y exactitud | [`entregables/comparativa-metricas.md`](entregables/comparativa-metricas.md) |

Resumen completo: [`entregables/resumen-entregables.md`](entregables/resumen-entregables.md)

## Notebooks

Traducidos al español y adaptados de los ejercicios originales del curso.

- [`notebooks/01-clasificacion-binaria.ipynb`](notebooks/01-clasificacion-binaria.ipynb) — Módulo 3: exploración del dataset y clasificador binario baseline con regresión logística.
- [`notebooks/02-metricas-clasificacion.ipynb`](notebooks/02-metricas-clasificacion.ipynb) — Módulo 5: informe de clasificación, matriz de confusión, curvas ROC y PR, pipelines de preprocesamiento y comparación de algoritmos.
- [`notebooks/03-clasificacion-multiclase.ipynb`](notebooks/03-clasificacion-multiclase.ipynb) — Módulo 7: clasificación de tres especies, métricas macro, curvas OVR y SVM.

## Resultados

**Binaria** (4.500 pacientes de prueba):

| Modelo | Exactitud | Precisión | Recall | F1 |
|---|---|---|---|---|
| Regresión logística (baseline) | 0.7893 | 0.7242 | 0.6037 | 0.6585 |
| **Random Forest + preprocesamiento** | **0.9342** | **0.9126** | **0.8897** | **0.9010** |

**Multiclase** (103 pingüinos de prueba, métricas macro):

| Modelo | Exactitud | Precisión | Recall | F1 |
|---|---|---|---|---|
| Regresión logística | 0.9709 | 0.9688 | 0.9608 | 0.9646 |
| **SVM + escalado** | **0.9806** | **0.9767** | **0.9767** | **0.9767** |

## Datasets

Fuente: [MicrosoftLearning/mslearn-ml-basics](https://github.com/MicrosoftLearning/mslearn-ml-basics).

- [`datasets/diabetes.csv`](datasets/diabetes.csv) — 15.000 pacientes con 8 medidas de diagnóstico y etiqueta `Diabetic` (0/1). Basado en datos del *National Institute of Diabetes and Digestive and Kidney Diseases*.
- [`datasets/penguins.csv`](datasets/penguins.csv) — 344 pingüinos con 4 medidas físicas y su especie (0/1/2). Datos de la Dra. Kristen Gorman y la Palmer Station, Antarctica LTER.

## Imágenes

`imagenes/` — matrices de confusión y curvas ROC/PR generadas por los cuadernos, embebidas en el entregable 2.

## Apuntes técnicos

- [`apuntes/notas-tecnicas.md`](apuntes/notas-tecnicas.md) — decisiones de preprocesamiento, arreglos de compatibilidad y desviaciones respecto al ejercicio original.

## Cómo ejecutar

Requiere Python 3.11 con `numpy`, `pandas`, `matplotlib`, `scikit-learn`, `joblib` e `ipykernel`. Abre el notebook en VS Code, selecciona el kernel Python 3.11 y ejecuta las celdas en orden.

Los cuadernos 02 y 03 generan modelos `.pkl` en `entregables/`. Esos archivos **no se versionan** (ver `.gitignore` del repo): son binarios no revisables en un diff y atados a la versión de scikit-learn con la que se crearon.
