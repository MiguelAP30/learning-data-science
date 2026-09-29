# Entregables — Curso 05: Train and Evaluate Clustering Models

Curso: [Train and evaluate clustering models](https://learn.microsoft.com/training/modules/train-evaluate-cluster-models/) (Microsoft Learn)

- **Nivel:** Intermedio
- **Prioridad:** Recomendado
- **Duración estimada:** 3-5 h de contenido | 6-10 h de práctica
- **Certificación relacionada:** DP-100 (complementario)

---

## 1. Segmentación con K-Means y método del codo

**→ [`entregables/segmentacion-kmeans-codo.md`](segmentacion-kmeans-codo.md)**

El método del codo aplicado a dos datasets, con las curvas de WCSS y la segmentación resultante.

| Dataset | k elegido | Criterio |
|---|---|---|
| Semillas de trigo (210 obs., 6 features) | 3 | Codo marcado tras la caída 2→3 |
| Clientes (40 obs., 2 features) | 4 | WCSS se desploma de 20.53 a 3.03 |

En las semillas el resultado se puede verificar: el dataset contiene efectivamente tres variedades, aunque el algoritmo nunca vio esa columna.

---

## 2. Evaluación de clústeres con silhouette score

**→ [`entregables/evaluacion-silhouette.md`](evaluacion-silhouette.md)**

Los dos usos de la silueta, con resultados medidos.

**Elegir `k`** — en los clientes, máximo claro en k=4 (silueta 0.810).

**Comparar algoritmos** — sobre las semillas, con la misma k=3:

| Algoritmo | Silueta |
|---|---|
| K-Means | **0.475** |
| Jerárquica aglomerativa | 0.422 |

Incluye la comparación visual contra las **especies reales**, que muestra cómo ambos algoritmos reconstruyen aproximadamente la estructura verdadera sin haber visto una sola etiqueta.

---

## 3. Perfil de segmentos con recomendaciones de negocio

**→ [`entregables/perfil-segmentos-clientes.md`](perfil-segmentos-clientes.md)**

Segmentación de clientes en 4 grupos (silueta 0.810), con su perfil y la acción comercial recomendada para cada uno.

| Segmento | Perfil | Gasto medio | Frecuencia | Valor estimado |
|---|---|---|---|---|
| 2 | Alto valor | 88.90 | 46.31 | **4 116.96** |
| 0 | Comprador frecuente pequeño | 29.20 | 46.25 | 1 350.50 |
| 1 | Compra grande esporádica | 83.90 | 9.80 | 822.22 |
| 3 | Bajo compromiso | 28.30 | 9.70 | 274.51 |

Los cuatro segmentos tienen el mismo tamaño (25% cada uno) pero el más valioso aporta **15 veces** más que el menor.

> El ejercicio original del curso usa semillas de trigo, que no permiten un análisis de negocio realista. Este entregable usa el dataset de clientes, que es el caso de uso que el propio curso menciona como aplicación típica del clustering.

---

## Notas sobre el material original

| Observación | Qué se hizo |
|---|---|
| Los cuadernos no fijan `random_state` en K-Means | Añadido, para que los resultados sean reproducibles |
| El ejercicio usa solo 6 de las 7 features de las semillas (`groove_length` queda fuera) | Se mantuvo igual para poder comparar, pero queda anotado |
| La función `plot_clusters` está duplicada en dos celdas | Unificada en una sola, con leyenda |
| El dataset de semillas no permite recomendaciones de negocio | Se añadió un tercer cuaderno con segmentación de clientes |

## Pendiente

El curso propone un desafío opcional: agrupar un dataset de tres features numéricas (A, B, C) sin etiquetas, determinando cuántos clústeres hay. No incluido aquí.
