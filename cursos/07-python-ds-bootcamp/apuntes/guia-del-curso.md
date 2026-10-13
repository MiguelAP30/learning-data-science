# Guía del curso — Python for Data Science and Machine Learning Bootcamp

Índice de estudio del material del curso, escrito por mí. **El material original (cuadernos y datos de Pierian Data) no está en este repositorio**: es contenido de pago sin licencia de redistribución, así que vive solo en local, en `Refactored_Py_DS_ML_Bootcamp-master/`, excluido por `.gitignore`.

En local, cada cuaderno lleva una celda inicial **🇪🇸 Guía en español** con el tipo de cuaderno, de qué trata, en qué fijarse y su relación con mis notas. Las celdas que hubo que adaptar a las librerías actuales llevan el comentario `# [ajuste local]`.

**Leyenda:** ✅ corre completo · ✏️ ejercicio para resolver · ⚠️ corre salvo alguna celda · ❌ no ejecutable con las librerías actuales · 🔧 tiene celdas adaptadas

## Cobertura: curso en Udemy frente al material descargado

| Udemy | Sección | Carpeta del material | Cobertura |
|---|---|---|---|
| 1–3 | Introducción, instalación y Jupyter | `00` (bienvenida) | Sin cuadernos: son vídeos de instalación y presentación |
| 4 | Python Crash Course | `01` | Completa |
| 5 | NumPy | `02` | Completa |
| 6 | Pandas | `03` | Completa |
| 7 | Pandas Exercises | `04` | Completa |
| 8 | Matplotlib | `05` | Completa |
| 9 | Seaborn | `06` | Completa |
| 10 | Pandas Built-in Data Visualization | `07` | Completa |
| 11 | Plotly and Cufflinks | `08` | Completa |
| 12 | Geographical Plotting | `09` | Completa |
| 13 | Data Capstone Project | `10` | Completa |
| 14 | Introducción al machine learning | — | Sin cuadernos: es teoría en vídeo. Por eso la carpeta `12` no existe |
| 15 | Linear Regression | `11` | Completa |
| 16 | Cross Validation and Bias-Variance Trade-Off | — | Sin cuadernos: 1 vídeo de 6 min |
| 17 | Logistic Regression | `13` | Completa |
| 18 | K Nearest Neighbors | `14` | Completa |
| 19 | Decision Trees and Random Forests | `15` | Completa |
| 20 | Support Vector Machines | `16` | Completa |
| 21 | K Means Clustering | `17` | Completa |
| 22 | Principal Component Analysis | `18` | Completa |
| 23 | Recommender Systems | `19` | Completa |
| 24 | Natural Language Processing | `20` | Completa |
| 25 | Neural Nets and Deep Learning (31 clases, 5 h) | `22` (5 cuadernos) | **Desactualizada**: el material descargado es la versión antigua con TensorFlow 1 (5 cuadernos), y la sección actual tiene 31 clases. Conviene revisar si esas clases traen cuadernos nuevos en sus recursos |
| 26 | Big Data and Spark with Python (12 clases) | `21` (3 cuadernos) | Probablemente parcial: 12 clases frente a 3 cuadernos. Parte de la diferencia pueden ser clases de instalación sin cuaderno; conviene revisar los recursos de la sección |
| 27 | Bonus | — | Sin cuadernos |
| — | (extra, no aparece en Udemy) | `23` SciPy | Notas extra del autor |

## Índice por sección

### 00 · Bienvenida

Presentación del curso.

| Cuaderno | Tipo | De qué trata | Estado |
|---|---|---|---|
| 00-00 · 00-Welcome to the Course | Clase | Cuaderno de bienvenida al curso. | ✅ |

### 01 · Python Crash Course

Repaso acelerado de Python: tipos, estructuras de datos, control de flujo y funciones. *Relacionado: las notas de `Python/` del Second Brain, aún por completar.*

| Cuaderno | Tipo | De qué trata | Estado |
|---|---|---|---|
| 01-01 · 01-Python Crash Course | Clase | Repaso acelerado de Python: tipos de datos, estructuras, control de flujo y funciones. | ✅ · 1 error intencional (las tuplas no se pueden modificar) |
| 01-02 · 02-Python Crash Course Exercises | Ejercicio | Ejercicio práctico sobre fundamentos de Python, usando strings, listas y diccionarios. | ✏️ · para resolver |
| 01-03 · 03-Python Crash Course Exercises - Solutions | Solución | Solución del anterior | ✅ |

### 02 · NumPy

Arrays, indexado, broadcasting y operaciones vectorizadas. *Ya visto en: Curso 01.*

| Cuaderno | Tipo | De qué trata | Estado |
|---|---|---|---|
| 02-01 · 01-NumPy Arrays | Clase | Cómo crear arrays de NumPy y los métodos para generarlos sin escribir los valores a mano. | ✅ |
| 02-02 · 02-Numpy Indexing and Selection | Clase | Cómo seleccionar partes de un array: por posición, por condición y en 2D. | ✅ |
| 02-03 · 03-Numpy Operations | Clase | Operaciones aritméticas entre arrays y funciones universales (ufuncs). | ✅ |
| 02-04 · 04-Numpy Exercises | Ejercicio | Ejercicio práctico sobre NumPy, usando arrays generados con los métodos de la clase. | ✏️ · para resolver |
| 02-05 · 05-Numpy Exercises - Solutions | Solución | Solución del anterior | ✅ |

### 03 · Pandas

Series, DataFrames, datos faltantes, groupby, combinar tablas y entrada/salida. *Ya visto en: Curso 01.*

| Cuaderno | Tipo | De qué trata | Estado |
|---|---|---|---|
| 03-01 · 01-Introduction to Pandas | Clase | Introducción a la sección de Pandas: explica el orden recomendado para recorrer los cuadernos. | ✅ |
| 03-02 · 02-Series | Clase | La Series: el bloque básico de Pandas, un array de NumPy con un índice con nombre. | ✅ |
| 03-03 · 03-DataFrames | Clase | El DataFrame: selección, filtrado y manejo del índice, incluido el índice jerárquico (multi-índice). | ✅ 🔧 |
| 03-04 · 04-Missing Data | Clase | Cómo detectar y tratar valores faltantes. | ✅ |
| 03-05 · 05-Groupby | Clase | Agrupar filas por una columna y calcular agregados por grupo. | ✅ 🔧 |
| 03-06 · 06-Merging, Joining, and Concatenating | Clase | Las tres formas de combinar DataFrames. | ✅ |
| 03-07 · 07-Operations | Clase | Operaciones útiles del día a día sobre DataFrames. | ✅ |
| 03-08 · 08-Data Input and Output | Clase | Leer y escribir datos en distintos formatos. | ✅ 🔧 |

### 04 · Ejercicios de Pandas

Dos ejercicios con datos reales: salarios de San Francisco y compras online. *Ya visto en: Curso 01.*

| Cuaderno | Tipo | De qué trata | Estado |
|---|---|---|---|
| 04-01 · 01-SF Salaries Exercise | Ejercicio | Ejercicio práctico sobre análisis con Pandas, usando salarios de empleados públicos de San Francisco (`Salaries.csv`). | ✏️ · para resolver |
| 04-02 · 02-SF Salaries Exercise - Solutions | Solución | Solución del anterior | ✅ 🔧 |
| 04-03 · 03-Ecommerce Purchases Exercise  | Ejercicio | Ejercicio práctico sobre análisis con Pandas, usando un registro de compras de comercio electrónico (`Ecommerce Purchases`). | ✏️ · para resolver |
| 04-04 · 04-Ecommerce Purchases Exercise - Solutions | Solución | Solución del anterior | ✅ |

### 05 · Matplotlib

Método funcional contra orientado a objetos, subplots y personalización. *Ya visto en: Curso 01.*

| Cuaderno | Tipo | De qué trata | Estado |
|---|---|---|---|
| 05-01 · 01-Matplotlib Concepts Lecture | Clase | Los fundamentos de Matplotlib y, sobre todo, la diferencia entre sus dos formas de uso. | ✅ |
| 05-02 · 02-Matplotlib Exercises | Ejercicio | Ejercicio práctico sobre Matplotlib, usando datos generados con NumPy. | ✏️ · para resolver |
| 05-03 · 03-Matplotlib Exercises - Solutions | Solución | Solución del anterior | ✅ |
| 05-04 · 04-Advanced Matplotlib Concepts | Clase | Opciones avanzadas de Matplotlib. | ✅ 🔧 |

### 06 · Seaborn

Gráficos estadísticos: distribuciones, categóricos, matrices, cuadrículas y regresión. *Ya visto en: Curso 01 — cierra el pendiente de Seaborn.*

| Cuaderno | Tipo | De qué trata | Estado |
|---|---|---|---|
| 06-01 · 01-Distribution Plots | Clase | Gráficos de distribución: cómo se reparten los valores de una o dos variables. | ✅ |
| 06-02 · 02-Categorical Plots | Clase | Gráficos para variables categóricas: comparar una métrica entre grupos. | ✅ 🔧 |
| 06-03 · 03-Matrix Plots | Clase | Gráficos de matriz: datos en forma de tabla convertidos en colores. | ✅ 🔧 |
| 06-04 · 04-Grids | Clase | Cuadrículas: repetir el mismo gráfico para distintos subconjuntos de los datos. | ✅ |
| 06-05 · 05-Regression Plots | Clase | Gráficos de regresión: dispersión con la recta ajustada encima. | ✅ 🔧 |
| 06-06 · 06-Style and Color | Clase | Estilo y color de los gráficos de Seaborn. | ✅ · `sns.puppyplot()` es una broma del autor y falla a propósito 🔧 |
| 06-07 · 07-Seaborn Exercises | Ejercicio | Ejercicio práctico sobre Seaborn, usando el dataset del Titanic (incluido en Seaborn). | ✏️ · para resolver |
| 06-08 · 08-Seaborn Exercises - Solutions | Solución | Solución del anterior | ✅ 🔧 |

### 07 · Visualización con Pandas

Gráficos rápidos llamados directamente desde un DataFrame. *Ya visto en: Curso 01.*

| Cuaderno | Tipo | De qué trata | Estado |
|---|---|---|---|
| 07-01 · 01-Pandas Built-in Data Visualization | Clase | La visualización integrada de Pandas: gráficos llamados directamente desde un DataFrame. | ✅ 🔧 |
| 07-02 · 02-Pandas Data Visualization Exercise | Ejercicio | Ejercicio práctico sobre visualización con Pandas, usando el archivo `df3`. | ✏️ · para resolver |
| 07-03 · 03-Pandas Data Visualization Exercise - Solutions | Solución | Solución del anterior | ✅ 🔧 |

### 08 · Plotly y Cufflinks

Gráficos interactivos.

| Cuaderno | Tipo | De qué trata | Estado |
|---|---|---|---|
| 08-01 · 01-Plotly and Cufflinks | Clase | Gráficos interactivos con Plotly, usando Cufflinks como puente para llamarlos desde un DataFrame. | ⚠️ · todo corre salvo la celda `spread` 🔧 |

### 09 · Mapas coropléticos

Mapas de regiones coloreadas por valor con Plotly.

| Cuaderno | Tipo | De qué trata | Estado |
|---|---|---|---|
| 09-01 · 01-Choropleth Maps | Clase | Mapas coropléticos con Plotly: regiones coloreadas según un valor. | ✅ 🔧 |
| 09-02 · 02-Choropleth Maps Exercise | Ejercicio | Ejercicio práctico sobre mapas coropléticos, usando consumo eléctrico mundial y datos electorales de EE. | ✏️ · para resolver |
| 09-03 · 03-Choropleth Maps Exercise - Solutions | Solución | Solución del anterior | ✅ 🔧 |

### 10 · Proyectos de análisis

Dos proyectos completos de EDA: llamadas al 911 y acciones bancarias. *Ya visto en: Curso 01.*

| Cuaderno | Tipo | De qué trata | Estado |
|---|---|---|---|
| 10-01 · 01-911 Calls Data Capstone Project | Proyecto | Proyecto de análisis exploratorio sobre llamadas al 911 en Pensilvania (`911.csv`): más de 600.000 registros reales. | ✏️ · para resolver |
| 10-02 · 02-911 Calls Data Capstone Project - Solutions | Solución | Solución del anterior | ✅ |
| 10-03 · 03-Finance Project | Proyecto | Proyecto de análisis de acciones bancarias durante la crisis financiera (2006-2016). | ✏️ · para resolver |
| 10-04 · 04-Finance Project - Solutions | Solución | Solución del anterior | ✅ 🔧 |

### 11 · Regresión lineal

Regresión con scikit-learn, interpretación de coeficientes y residuales. *Ya visto en: Curso 03.*

| Cuaderno | Tipo | De qué trata | Estado |
|---|---|---|---|
| 11-01 · 01-Linear Regression with Python | Clase | Regresión lineal completa con scikit-learn sobre precios de viviendas (`USA_Housing.csv`). | ✅ 🔧 |
| 11-02 · 02-Linear Regression Project | Proyecto | Proyecto: una tienda online quiere saber si invertir en su app o en su web, a partir de datos de sus clientes (`Ecommerce Customers`). | ✏️ · para resolver |
| 11-03 · 03-Linear Regression Project - Solutions | Solución | Solución del anterior | ✅ |

### 13 · Regresión logística

Clasificación binaria con el Titanic y con datos de publicidad. *Ya visto en: Curso 04.*

| Cuaderno | Tipo | De qué trata | Estado |
|---|---|---|---|
| 13-01 · 01-Logistic Regression with Python | Clase | Regresión logística sobre los pasajeros del Titanic (`titanic_train.csv`): ¿quién sobrevivió?. | ✅ 🔧 |
| 13-02 · 02-Logistic Regression Project | Proyecto | Proyecto: predecir si un usuario hará clic en un anuncio a partir de sus datos (`advertising.csv`). | ✏️ · para resolver |
| 13-03 · 03-Logistic Regression Project - Solutions | Solución | Solución del anterior | ✅ |

### 14 · K vecinos más cercanos

Algoritmo nuevo basado en distancias; elección de K. *Ya visto en: Curso 05 (método del codo).*

| Cuaderno | Tipo | De qué trata | Estado |
|---|---|---|---|
| 14-01 · 01-K Nearest Neighbors with Python | Clase | K vecinos más cercanos (KNN): clasificar un punto según la clase de los puntos que tiene más cerca. | ✅ |
| 14-02 · 02-K Nearest Neighbors Project | Proyecto | Proyecto KNN sobre un dataset anónimo (`KNN_Project_Data`). | ✏️ · para resolver |
| 14-03 · 03-K Nearest Neighbors Project - Solutions | Solución | Solución del anterior | ✅ |

### 15 · Árboles y random forest

Árboles de decisión, random forest y un proyecto de préstamos. *Ya visto en: Cursos 03 y 04.*

| Cuaderno | Tipo | De qué trata | Estado |
|---|---|---|---|
| 15-01 · 01-Decision Trees and Random Forests in Python | Clase | Árboles de decisión y random forest sobre un dataset médico pequeño (`kyphosis.csv`). | ✅ 🔧 |
| 15-02 · 02-Decision Trees and Random Forest Project | Proyecto | Proyecto: predecir si un préstamo será devuelto con datos de LendingClub (`loan_data.csv`). | ✏️ · para resolver |
| 15-03 · 03-Decision Trees and Random Forest Project - Solutions | Solución | Solución del anterior | ✅ |

### 16 · Máquinas de vectores de soporte

SVM y búsqueda en cuadrícula de hiperparámetros. *Ya visto en: Cursos 03 y 04.*

| Cuaderno | Tipo | De qué trata | Estado |
|---|---|---|---|
| 16-01 · 01-Support Vector Machines with Python | Clase | Máquinas de vectores de soporte sobre el dataset de cáncer de mama de scikit-learn. | ✅ 🔧 |
| 16-02 · 02-Support Vector Machines Project | Proyecto | Proyecto SVM con el clásico dataset de flores iris. | ✏️ · para resolver 🔧 |
| 16-03 · 03-Support Vector Machines Project - Solutions | Solución | Solución del anterior | ✅ 🔧 |

### 17 · K-Means

Clustering con K-Means sobre datos artificiales y universidades. *Ya visto en: Cursos 02 y 05.*

| Cuaderno | Tipo | De qué trata | Estado |
|---|---|---|---|
| 17-01 · 01-K Means Clustering with Python | Clase | K-Means sobre datos artificiales generados con make_blobs. | ✅ |
| 17-02 · 02-K Means Clustering Project | Proyecto | Proyecto: agrupar universidades en públicas y privadas solo con sus datos (`College_Data`). | ✏️ · para resolver |
| 17-03 · 03-K Means Clustering Project - Solutions | Solución | Solución del anterior | ✅ 🔧 |

### 18 · PCA

Reducción de dimensionalidad e interpretación de componentes. *Ya visto en: Curso 05.*

| Cuaderno | Tipo | De qué trata | Estado |
|---|---|---|---|
| 18-01 · 01-Principal Component Analysis | Clase | Análisis de componentes principales sobre el dataset de cáncer de mama (30 features). | ✅ |

### 19 · Sistemas de recomendación

Recomendadores por correlación y filtrado colaborativo.

| Cuaderno | Tipo | De qué trata | Estado |
|---|---|---|---|
| 19-01 · 01-Recommender Systems with Python | Clase | Sistema de recomendación simple sobre valoraciones de películas (MovieLens). | ✅ |
| 19-02 · 02-Advanced Recommender Systems with Python | Clase | Recomendadores más avanzados: filtrado colaborativo basado en memoria y en modelo. | ✅ 🔧 |

### 20 · Procesamiento de lenguaje natural

Texto a números (bolsa de palabras, TF-IDF) y clasificación con Naive Bayes.

| Cuaderno | Tipo | De qué trata | Estado |
|---|---|---|---|
| 20-01 · 01-NLP (Natural Language Processing) with Python | Clase | Procesamiento de lenguaje natural: clasificar mensajes SMS en spam o no spam. | ✅ 🔧 |
| 20-02 · 02-NLP Project | Proyecto | Proyecto: clasificar reseñas de Yelp en 1 o 5 estrellas a partir del texto (`yelp.csv`). | ✏️ · para resolver |
| 20-03 · 03-NLP Project - Solutions | Solución | Solución del anterior | ✅ 🔧 |

### 21 · Big Data y Spark

PySpark: SparkContext, RDD, transformaciones y acciones. *Ya visto en: Anticipo del Curso 09.*

| Cuaderno | Tipo | De qué trata | Estado |
|---|---|---|---|
| 21-01 · 01-Introduction to Spark and Python | Clase | Primeros pasos con Spark desde Python (PySpark): el contexto de Spark y los RDD. | ✅ 🔧 |
| 21-02 · 02-Lambda Expressions | Clase | Expresiones lambda: funciones anónimas de una línea. | ✅ |
| 21-03 · 03-RDD Transformations and Actions | Clase | Transformaciones y acciones sobre RDD con más detalle. | ✅ 🔧 |

### 22 · Deep Learning

TensorFlow. Escrito para la versión 1, hoy obsoleta. *Ya visto en: Curso 02.*

| Cuaderno | Tipo | De qué trata | Estado |
|---|---|---|---|
| 22-01 · 01-Tensorflow Basics | Clase | Fundamentos de TensorFlow: constantes, sesiones y operaciones. | ❌ · TensorFlow 1 |
| 22-02 · 02-MNIST-with-Tensorflow | Clase | Clasificar dígitos manuscritos (MNIST) con una red sencilla en TensorFlow. | ❌ · TensorFlow 1 |
| 22-03 · 03-Tensorflow with Estimators | Clase | Modelos de TensorFlow mediante la API de estimadores, sobre el dataset iris. | ❌ · TensorFlow 1 |
| 22-04 · 04-Tensorflow Project Exercise | Proyecto | Proyecto: autenticar billetes como verdaderos o falsos con una red neuronal (`bank_note_data.csv`). | ❌ · TensorFlow 1 |
| 22-05 · 05-Tensorflow Project Exercise - Solutions | Solución | Solución del anterior | ❌ · TensorFlow 1 |

### 23 · SciPy (extra)

Álgebra lineal y matrices dispersas.

| Cuaderno | Tipo | De qué trata | Estado |
|---|---|---|---|
| 23-01 · 01-SciPy | Clase | Notas extra sobre SciPy: álgebra lineal y matrices dispersas. | ✅ |

## Qué no funciona y por qué

- **Deep Learning (`22`), 5 cuadernos.** Escritos para TensorFlow 1 (sesiones, placeholders, `tf.contrib`, estimadores); esas APIs ya no existen. No instalé TensorFlow: la última versión que permitiría adaptarlos exige bajar NumPy a 1.x y rompería los cursos anteriores. Si hace falta, lo limpio es un entorno virtual aparte.
- **Cufflinks `spread` (`08`), 1 celda.** La librería no se mantiene desde 2020 y usa código que pandas 2 eliminó.

## Ajustes hechos en local (28 cuadernos)

Para que el material corra con Python 3.11, pandas 2.2, seaborn 0.13 y scikit-learn 1.9. Ninguno cambia lo que enseña el cuaderno.

| Tipo de ajuste | Ejemplos |
|---|---|
| APIs renombradas o eliminadas | `.ix` → `.loc`, `sheetname` → `sheet_name`, `size` → `height`, `factorplot` → `catplot`, `split` → `dodge`, `cross_validation` → `model_selection`, `get_feature_names` → `get_feature_names_out` |
| pandas 2 ya no ignora columnas de texto | `numeric_only=True` en medias, desviaciones y correlaciones |
| Bugs del material original | Variables nunca definidas (`df`, `x`, `y`), lista tratada como DataFrame, errata en la escala de color `'YIOrRd'` |
| Fuentes de datos cerradas | Google Finance → `yfinance`, con copia local de los datos |
| Dependencias externas | Árbol con `plot_tree` en vez de Graphviz; imágenes de Wikimedia cargadas en el visor |
| Entorno Windows | Spark necesita que se le indique el intérprete de Python |

## Entorno

Además de lo instalado en los cursos anteriores: `plotly` 5.24.1 (cufflinks no funciona con plotly 6 o superior), `cufflinks`, `yfinance`, `pyspark` con Java 21, `nltk` con el corpus `stopwords`, `sqlalchemy` y `lxml`.
