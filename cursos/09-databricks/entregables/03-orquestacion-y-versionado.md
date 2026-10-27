# Entregable 3 · Evidencia de orquestación de jobs y versionamiento de notebooks

Este entregable tiene dos partes:

- **Lo que ya está en el repositorio:** la definición del job como código y el versionado de los cuadernos y de los datos.
- **Lo que hay que ejecutar en Azure Databricks** y capturar como evidencia: el job corriendo y los cuadernos conectados a Git. Requiere un área de trabajo de Azure, así que esa parte la ejecuta el autor siguiendo esta guía.

---

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
| **Cuadernos** | Git: este repositorio, conectado a Databricks como *Git folder* | Historial de commits de [`notebooks/`](../notebooks/) en GitHub + captura del Git folder |
| **Definición del job** | Git: `databricks.yml` versionado junto a los cuadernos | Historial de commits |
| **Datos** | Delta Lake: cada escritura crea una versión, con viaje en el tiempo | Tabla de historial en el [entregable 2](02-pipeline-delta-calidad.md#carga-idempotente-y-versionado-de-datos) |

---

## 3. Guía para ejecutar en Azure Databricks y capturar la evidencia

### Requisitos

- Suscripción de Azure con permisos de administrador. Los recursos tienen coste: elimínalos al terminar (paso 7).
- Área de trabajo **Premium** de Azure Databricks. Se crea con el [Laboratorio 00 del curso](https://microsoftlearning.github.io/DP-750T00-Implement-Data-Engineering-Solutions-using-Azure-Databricks/Instructions/Labs/00-setup.html): un script en Cloud Shell, unos 15 minutos. Crea el área de trabajo `adb-dp750` con un catálogo del mismo nombre.

### Paso 1 · Conectar el repositorio como Git folder

1. En el área de trabajo: **Workspace → Home → Create → Git folder**.
2. URL: `https://github.com/MiguelAP30/learning-data-science`, proveedor **GitHub**.
3. Para un repositorio público basta con leerlo; para hacer commits desde Databricks hay que vincular la cuenta de GitHub en **Settings → Linked accounts**.

📸 **Captura 1:** el Git folder abierto en `cursos/09-databricks/notebooks`, con la rama `main` visible → `imagenes/evidencias/01-git-folder.png`

### Paso 2 · Ejecutar los cuadernos una vez a mano

1. Abre `01-ingesta-transformacion-spark.ipynb` y elige **Serverless** en el selector de cómputo.
2. **Run all.** La primera celda crea el esquema `curso09` y el volumen `datos_crudos`, y descarga el CSV desde este repositorio.
3. Repite con `02-pipeline-delta-calidad.ipynb`.

📸 **Captura 2:** el **Catalog Explorer** con las tablas creadas en `adb-dp750 > curso09` (bronce, plata, oro, cuarentena, métricas) → `imagenes/evidencias/02-tablas-unity-catalog.png`

### Paso 3 · Crear el job

**Opción A, desde la interfaz:**

1. **Jobs & Pipelines → Create → Job.** Nombre: `curso09-ingesta-y-calidad`.
2. Tarea `ingesta_llamadas`: tipo *Notebook*, origen *Workspace*, ruta del cuaderno 01 dentro del Git folder, cómputo *Serverless*.
3. **+ Add task** → `pipeline_siniestros` con el cuaderno 02, **sin** dependencias.
4. **+ Add task** → `verificacion_calidad` con el cuaderno 03; en **Depends on** marca las dos anteriores.
5. En **Job parameters** añade `catalogo = adb-dp750` y `esquema = curso09`.
6. En las dos primeras tareas, **Retries**: 1.

**Opción B, con la CLI** (con la [CLI de Databricks](https://learn.microsoft.com/es-es/azure/databricks/dev-tools/cli/install) instalada y autenticada):

```bash
cd cursos/09-databricks
databricks bundle validate
databricks bundle deploy -t dev
```

📸 **Captura 3:** el grafo de tareas del job (la pestaña *Tasks*) → `imagenes/evidencias/03-job-grafo.png`

### Paso 4 · Ejecutar y monitorizar

1. **Run now.** Espera a que las tres tareas terminen en verde.
2. Abre la ejecución y entra en `verificacion_calidad` para ver su salida.

📸 **Captura 4:** la ejecución completada con las tres tareas en verde → `imagenes/evidencias/04-job-ejecucion-ok.png`
📸 **Captura 5:** la salida de `verificacion_calidad` con las comprobaciones ✅ → `imagenes/evidencias/05-verificacion-salida.png`

### Paso 5 · Programación y alertas

1. En el job: **Add trigger → Scheduled**, diario a las 2:00. Puede quedar en pausa.
2. **Job notifications → On failure**: tu correo.

📸 **Captura 6:** el panel derecho del job con la programación y la notificación configuradas → `imagenes/evidencias/06-job-programacion.png`

### Paso 6 · Versionado

1. Haz un cambio pequeño en un cuaderno desde el Git folder (por ejemplo, una línea en una celda de Markdown) y en el botón de la rama elige **Commit & Push**.
2. Abre el historial de versiones del cuaderno: **File → Version history**.

📸 **Captura 7:** el diálogo de Git con el cambio listo para commit → `imagenes/evidencias/07-git-commit.png`
📸 **Captura 8:** el historial de versiones del cuaderno → `imagenes/evidencias/08-historial-versiones.png`
📸 **Captura 9:** `DESCRIBE HISTORY` de `plata_siniestros` en el editor SQL → `imagenes/evidencias/09-delta-historial.png`

### Paso 7 · Limpieza

Cuando tengas las capturas, borra el grupo de recursos `rg-dp750` desde Azure Portal para que no siga generando coste. El [Laboratorio 99](https://microsoftlearning.github.io/DP-750T00-Implement-Data-Engineering-Solutions-using-Azure-Databricks/Instructions/Labs/99-cleanup.html) lo hace con un script.

---

## 4. Estado de las evidencias

| # | Evidencia | Estado |
|---|---|---|
| — | Job definido como código (`databricks.yml`) | ✅ En el repositorio |
| — | Cuadernos versionados en Git | ✅ En el repositorio |
| — | Versionado de datos con Delta (historial y viaje en el tiempo) | ✅ Ejecutado en local; salidas en el cuaderno 02 |
| — | Verificación de calidad que puede detener el job | ✅ Ejecutada en local; salida en el cuaderno 03 |
| 1–9 | Capturas desde Azure Databricks | ⏳ Pendiente de ejecución en Azure |
