# Entregables — Curso 02: Introduction to Machine Learning Concepts

Curso: [Fundamentals of machine learning](https://learn.microsoft.com/training/modules/fundamentals-machine-learning/) (Microsoft Learn)

- **Nivel:** Básico - Intermedio
- **Prioridad:** Obligatorio
- **Duración estimada:** 5-8 h de contenido | 10-14 h de práctica
- **Certificación relacionada:** DP-100

## Estado

| # | Entregable pedido | Estado | Dónde está |
|---|---|---|---|
| 1 | Mapa conceptual de tipos de ML (regresión, clasificación, clustering, deep learning) | ✅ | [`01-mapa-conceptual-tipos-ml.md`](01-mapa-conceptual-tipos-ml.md) |
| 2 | Matriz de escenarios para seleccionar tipo de modelo | ✅ | [`02-matriz-escenarios.md`](02-matriz-escenarios.md) |
| 3 | Notebook corto con ejemplos de problema supervisado y no supervisado | ✅ | [`../notebooks/01-explorar-escenarios-ml.ipynb`](../notebooks/01-explorar-escenarios-ml.ipynb) |

## Detalle

**1. Mapa conceptual.** Diagrama de la taxonomía completa (Mermaid, se renderiza directamente en GitHub) más la comparación clustering vs. clasificación multiclase y qué métricas aplican a cada rama. Incluye el aprendizaje profundo señalado como técnica transversal, no como cuarta rama.

**2. Matriz de escenarios.** Árbol de decisión + tabla de 10 escenarios mapeados a su tipo de modelo, guía para elegir métrica según qué error sale más caro, y checklist de señales de alarma antes de entrenar.

**3. Notebook.** Entrena los tres tipos de modelo sobre datasets reales:
- Supervisado — regresión (`ice-cream.csv`) y clasificación multiclase (`penguins.csv`).
- No supervisado — clustering (`customers.csv`).

Resultados: regresión R² 0.989 (referencia ML Lite: 0.989) · clasificación exactitud 1.000 · clustering k=4 con silueta 0.810.

## Datasets sin usar

`diabetes.csv` (clasificación binaria — permitiría añadir curva ROC y experimentar con el umbral) y `home-rental.csv` (regresión). Disponibles en [`../datasets/`](../datasets/) para practicar por cuenta propia.
