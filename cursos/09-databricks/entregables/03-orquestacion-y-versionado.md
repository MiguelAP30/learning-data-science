# Entregable 3 · Evidencia de orquestación de jobs y versionamiento de notebooks

## 1. El job definido como código

**→ [`databricks.yml`](../databricks.yml)** (Declarative Automation Bundle)

```
ingesta_llamadas ─────┐
                      ├──► verificacion_calidad
pipeline_siniestros ──┘
```

| Elemento | Configuración |
|---|---|
| Tareas | 3 cuadernos; las dos primeras en paralelo y la verificación cuando ambas terminan (`depends_on`) |
| Parámetros | `catalogo` y `esquema`, que llegan a los cuadernos como widgets |
| Programación | Cada noche a las 2:00, hora de Bogotá (`0 0 2 * * ?`), en pausa por defecto |
| Reintentos | 1 reintento al minuto en las tareas de ingesta |
| Control | Tiempo máximo de 1 h, una sola ejecución a la vez, notificación por correo si falla |
| Fallo controlado | Si la verificación detecta un problema, lanza una excepción y el job queda en rojo |

## 2. Versionado

| Qué | Cómo | Evidencia |
|---|---|---|
| **Cuadernos** | Git: este repositorio, conectado a Databricks como *Git folder* | Historial de commits de [`notebooks/`](../notebooks/) en GitHub |
| **Definición del job** | Git: `databricks.yml` versionado junto a los cuadernos | Historial de commits |
| **Datos** | Delta Lake: cada escritura crea una versión, con viaje en el tiempo | Tabla de historial en el [entregable 2](02-pipeline-delta-calidad.md#carga-idempotente-y-versionado-de-datos) |

---

## 3. Evidencias en Azure Databricks

- pendiente [Git folder conectado al repositorio]
- pendiente [tablas creadas en Unity Catalog]
- pendiente [grafo de tareas del job]
- pendiente [ejecución del job completada]
- pendiente [salida de la verificación de calidad]
- pendiente [programación y notificaciones del job]
- pendiente [commit desde el Git folder]
- pendiente [historial de versiones del cuaderno]
- pendiente [DESCRIBE HISTORY de plata_siniestros]
