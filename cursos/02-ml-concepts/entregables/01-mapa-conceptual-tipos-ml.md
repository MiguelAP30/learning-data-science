# Mapa conceptual — Tipos de Machine Learning

Curso 02 · [Fundamentals of machine learning](https://learn.microsoft.com/training/modules/fundamentals-machine-learning/)

## El mapa

```mermaid
graph TD
    ML["<b>Aprendizaje Automático</b><br/>usa datos pasados para predecir<br/>valores desconocidos"]

    ML --> SUP["<b>Supervisado</b><br/>los datos traen features Y label<br/>[x1,x2,x3], y"]
    ML --> NOSUP["<b>No supervisado</b><br/>los datos traen solo features<br/>[x1,x2,x3]"]

    SUP --> REG["<b>Regresión</b><br/>el label es un valor numérico"]
    SUP --> CLA["<b>Clasificación</b><br/>el label es una categoría"]

    CLA --> BIN["<b>Binaria</b><br/>2 clases posibles<br/>verdadero / falso"]
    CLA --> MUL["<b>Multiclase</b><br/>3+ clases posibles"]

    NOSUP --> CLU["<b>Clustering</b><br/>agrupa por similitud<br/>el label lo crea el modelo"]

    REG --> REGA["Regresión lineal"]
    BIN --> BINA["Regresión logística<br/><i>(clasifica, pese al nombre)</i>"]
    MUL --> MULA["OvR · Multinomial/Softmax"]
    CLU --> CLUA["K-Means"]

    DL["<b>Aprendizaje Profundo</b><br/>redes neuronales de varias capas<br/><i>técnica transversal, no un tipo aparte</i>"]
    DL -.resuelve.-> REG
    DL -.resuelve.-> CLA

    classDef raiz fill:#1f4e79,stroke:#0d2f4f,color:#fff
    classDef rama fill:#2e75b6,stroke:#1f4e79,color:#fff
    classDef hoja fill:#9dc3e6,stroke:#2e75b6,color:#000
    classDef algo fill:#f2f2f2,stroke:#999,color:#000
    classDef prof fill:#7030a0,stroke:#4c1d6b,color:#fff

    class ML raiz
    class SUP,NOSUP rama
    class REG,CLA,CLU,BIN,MUL hoja
    class REGA,BINA,MULA,CLUA algo
    class DL prof
```

## Cómo leerlo

La división de primer nivel se decide con **una sola pregunta**: ¿los datos de entrenamiento traen label o no?

- **Sí** → supervisado. Segunda pregunta: ¿qué tipo de label? Numérico → regresión. Categórico → clasificación.
- **No** → no supervisado. El clustering crea el label (el número de clúster) que antes no existía.

El **aprendizaje profundo** aparece aparte y con línea punteada a propósito: no es una cuarta rama junto a regresión/clasificación/clustering, sino una **técnica** (basada en redes neuronales) que puede resolver problemas de varias de esas ramas.

## Diferencia clave: clustering vs. clasificación multiclase

A primera vista hacen lo mismo (repartir observaciones en grupos discretos). La diferencia no está en el resultado sino en el punto de partida:

| | Clasificación multiclase | Clustering |
|---|---|---|
| ¿Se conocen las clases de antemano? | Sí, vienen en los datos de entrenamiento | No, no existe ninguna etiqueta previa |
| ¿Qué aprende el algoritmo? | La relación features → clase conocida | Agrupamientos basados solo en similitud de features |
| ¿Se puede medir "cuántas acertó"? | Sí | No — solo se mide la separación geométrica |

Ambos se pueden encadenar: primero clustering para descubrir qué grupos existen, luego bautizarlos a mano, y usar esas etiquetas para entrenar un clasificador que asigne casos nuevos.

## Qué se mide en cada rama

| Rama | Métricas de evaluación |
|---|---|
| Regresión | MAE, MSE, RMSE, R² |
| Clasificación | Matriz de confusión → exactitud, precisión, recall, F1, AUC |
| Clustering | Silueta, distancia media al centroide, inercia |

Lo que cambia entre ramas no es solo el algoritmo: es **qué se puede medir**. En clustering no hay respuesta correcta contra la cual comparar, así que lo único evaluable es la geometría del resultado.
