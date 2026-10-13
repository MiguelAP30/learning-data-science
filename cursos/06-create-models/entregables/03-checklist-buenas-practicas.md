# Checklist de buenas prácticas · entrenamiento y evaluación

Lista para repasar antes, durante y después de entrenar un modelo. Sale de lo aplicado en los cursos 02 a 06. Cada punto indica **dónde** se aplicó o dónde se vio qué pasa si se omite.

## 1. Antes de entrenar: el problema y los datos

- [ ] **Identificar el tipo de problema por la etiqueta.** Etiqueta numérica → regresión; categoría → clasificación (binaria o multiclase); sin etiqueta → clustering. *(Curso 06, módulo 3; evaluación del módulo: coste de calefacción = regresión)*
- [ ] **Descartar features que no puedan generalizar**, como identificadores o fechas únicas. *(`Date` en helados, `Name` en clientes)*
- [ ] **Revisar los nulos y decidir según su forma.** Si falta la observación entera, se descarta; si falta un valor suelto, se puede imputar. *(2 pingüinos con las 4 medidas vacías → descartados)*
- [ ] **Mirar la proporción de clases** antes de elegir métrica y división. *(Pingüinos: 44 / 36 / 20%)*
- [ ] **Convertir el texto en números** (one-hot para categorías sin orden). *(`DayOfWeek`, `Month`)*
- [ ] **Escalar cuando el algoritmo use distancias o magnitudes**: regresión logística, SVM, K-Means, redes neuronales. Los árboles no lo necesitan. *(`BodyMass` en miles frente a `CulmenDepth` en decenas)*

## 2. División de los datos

- [ ] **Reservar un conjunto de prueba** que ningún modelo vea hasta el final. *(70/30 en los tres modelos)*
- [ ] **Estratificar en clasificación**, para que entrenamiento y prueba conserven la proporción de clases. *(`stratify=y`)*
- [ ] **Fijar la semilla** (`random_state`) para que los resultados sean reproducibles. *(Curso 05: el material original no la fijaba)*

## 3. Entrenamiento

- [ ] **Empezar por una línea base.** Un modelo que no supera "predecir la media" o "predecir la clase más frecuente" no ha aprendido nada. *(R² ≈ 0 y F1 0.205 de las líneas base)*
- [ ] **Meter todo el preprocesamiento en un `Pipeline`.** El escalado y la codificación se ajustan solo con los datos de entrenamiento de cada pliegue, y al predecir se aplican igual automáticamente. *(Los tres cuadernos)*
- [ ] **Probar varios algoritmos, empezando por el más simple.** En los tres casos del portafolio el más simple ganó o empató. *(Regresión lineal; regresión logística)*
- [ ] **Ajustar hiperparámetros con validación cruzada, nunca con la prueba.** *(Curso 03: búsqueda en cuadrícula)*
- [ ] **Antes de cambiar de algoritmo, preguntarse si faltan features.** *(Pingüinos: F1 macro de ~0.66 a ~0.98 al pasar de 1 a 4 medidas; cambiar de algoritmo movía centésimas)*

## 4. Evaluación

- [ ] **Usar la métrica del tipo de problema.**
  - Regresión: MAE, MSE, RMSE, R².
  - Clasificación: exactitud, precisión, recall, F1, AUC.
  - Clustering: silueta, distancias al centro.
  *(Evaluación del módulo: la precisión es de clasificación; el MSE es de regresión y la silueta de clustering)*
- [ ] **No fiarse de la exactitud con clases desequilibradas.** Mirar recall y F1 por clase, o F1 macro. *(La trampa del 89% del módulo 5; regresión logística con la mejor exactitud y el peor F1 macro en el escenario B)*
- [ ] **Reportar la media y la desviación de la validación cruzada**, no un único número. Si dos modelos difieren menos que su desviación, no hay ganador claro. *(Escenario B de pingüinos)*
- [ ] **Confirmar en la prueba una sola vez**, al final. Si se usa para elegir, deja de ser una estimación honesta.
- [ ] **Mirar la matriz de confusión**, no solo los promedios. Muestra *qué* clases se confunden. *(Barbijo → Adelie: 13 de 21)*
- [ ] **En regresión, graficar real vs. predicho.** Un buen modelo queda pegado a la diagonal.
- [ ] **En clustering, contrastar el `k`** con al menos dos criterios (codo + silueta). *(k=4 en clientes)*
- [ ] **Desconfiar de un resultado perfecto** y buscar la explicación: dataset muy separable o fuga de información. *(Pingüinos: 100% en prueba, explicado por la separabilidad del dataset)*

## 5. Elegir y usar el modelo

- [ ] **Ante un empate, elegir el más simple e interpretable.** *(Regresión logística frente a SVM)*
- [ ] **Considerar criterios no métricos**: interpretabilidad, coste, si puede predecir casos nuevos. *(K-Means frente a la jerárquica, que no tiene `predict`)*
- [ ] **Guardar el pipeline completo, no solo el modelo**, para que el preprocesamiento viaje con él. *(Cursos 03 y 04)*
- [ ] **Vigilar los casos fuera del rango de entrenamiento.** El modelo siempre devuelve una respuesta, aunque el caso no se parezca a nada de lo visto. *(Cliente con frecuencia 105, el doble del máximo observado)*
- [ ] **No subir al repo modelos serializados ni datos pesados que se regeneran ejecutando el cuaderno.** *(`*.pkl` en `.gitignore` desde el Curso 03)*
