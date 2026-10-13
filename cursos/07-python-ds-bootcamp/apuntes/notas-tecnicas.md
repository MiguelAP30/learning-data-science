# Notas técnicas — Curso 07

## Por qué proyectos propios y no los del curso

Los entregables piden un proyecto EDA, uno de clasificación y uno de regresión con validación cruzada. El curso trae proyectos equivalentes (911 Calls, LendingClub, Ecommerce Customers…), pero sus cuadernos, sus enunciados y varios de sus datasets, que son sintéticos y creados por el autor, son material de pago sin licencia de redistribución. Los proyectos de este repo se hicieron desde cero con datasets públicos que se cargan desde las propias librerías:

| Proyecto | Dataset | Relación con el curso |
|---|---|---|
| EDA | Titanic (`seaborn`) | Usado en los ejercicios de Seaborn y en la clase de regresión logística |
| Clasificación | Breast Cancer Wisconsin (`scikit-learn`) | Usado en la clase de SVM |
| Regresión | California Housing (`scikit-learn`) | Mismo problema que la clase de regresión lineal (precio de vivienda), con datos reales |

## Protocolo común

- `random_state=42` en divisiones, validación cruzada y modelos con aleatoriedad.
- Conjunto de prueba reservado al principio y usado una sola vez.
- Preprocesamiento dentro de `Pipeline`, para que el escalado se ajuste solo con los datos de entrenamiento de cada pliegue.
- El modelo se **elige por validación cruzada**; la prueba solo confirma.

## 01 · EDA Titanic

- Se eliminan columnas redundantes de la versión de seaborn (`alive`, `class`, `embark_town`, `who`, `adult_male`).
- `age` se imputa con la mediana por `pclass` × `sex` usando `groupby().transform('median')`. La columna `edad_imputada` marca qué edades son reales, y los gráficos de distribución de edad usan solo las reales: las imputadas se apilarían en unos pocos valores y deformarían la forma.
- Los grupos de edad (`pd.cut`) sí incluyen las edades imputadas.

## 02 · Clasificación

- `y = 1 - target`: en scikit-learn el 0 es maligno, y se invierte para que maligno sea la clase positiva (1), y `recall` mida directamente los malignos detectados.
- KNN: `k` de 1 a 40, con la tasa de error media de una validación cruzada de 5 pliegues.
- `GridSearchCV` del SVM con `scoring='recall'`.
- Se silencia `UndefinedMetricWarning`: la línea base nunca predice "maligno", así que su precisión no está definida.
- AUC con `decision_function` cuando el modelo la tiene (regresión logística, SVM) y con `predict_proba` en el resto.

## 03 · Regresión

- Exclusión de `MedHouseVal >= 5.0` (valores topados).
- División 80/20; validación cruzada `KFold(5, shuffle=True)` sobre el 80%.
- `cross_validate(return_train_score=True)` para comparar el error de entrenamiento con el de validación.
- Curva de validación con `validation_curve` sobre `max_depth` de 1 a 25.
- Sin ajuste de hiperparámetros del bosque aleatorio (`n_estimators=100`); el objetivo era la comparación con validación cruzada, no exprimir el mejor modelo.

## Material original en local

Los arreglos aplicados al material del curso, y el estado de cada cuaderno, están en [`guia-del-curso.md`](guia-del-curso.md). Resumen de la verificación: los 77 cuadernos se ejecutaron de forma automática. Fallan solo los 5 de TensorFlow 1 y una celda de cufflinks, más los errores intencionales del autor y los ejercicios sin resolver.
