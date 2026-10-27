# Entregable 1 · Pipeline de ingesta y orquestación con Data Factory en Microsoft Fabric

**Canalización:** `pl_ingesta_ventas` · **Cuaderno de validación:** [`notebooks/02-validacion-lakehouse.ipynb`](../notebooks/02-validacion-lakehouse.ipynb)

La canalización orquesta todo el proceso: deja una copia de los archivos de origen en el lakehouse, ejecuta el flujo de datos Gen2 del [entregable 2](02-dataflow-gen2-transformacion.md) y valida las tablas resultantes. Se programa a diario y avisa si algo falla.

## Diseño

```
                     ┌──────────────── ForEach: archivos ────────────────┐
 (programación       │  Copy data: HTTP → Lakehouse Files/raw/<fecha>/    │
  diaria 06:00) ───► │  orders.csv · customers.csv · products.csv         │
                     └───────────────────────┬────────────────────────────┘
                                             │ al completarse correctamente
                                             ▼
                              Dataflow: df_ventas_minoristas
                         (transforma y carga 5 tablas en el lakehouse)
                                             │ al completarse correctamente
                                             ▼
                              Notebook: 02-validacion-lakehouse
                         (12 comprobaciones; lanza un error si alguna falla)
                                             │ si alguna actividad falla
                                             ▼
                                (opcional) Office 365 Outlook: aviso por correo
```

| Actividad | Tipo | Configuración clave | Para qué |
|---|---|---|---|
| `copiar_crudos` | **ForEach** con un **Copy data** dentro | Itera sobre el parámetro `archivos`. Origen: HTTP anónimo, URL base + `@item()`. Destino: lakehouse, carpeta `@concat('raw/', formatDateTime(pipeline().TriggerTime, 'yyyy-MM-dd'))`, nombre `@item()`. Formato *Binary* | Una **instantánea fechada** de los archivos tal como llegaron: auditoría y reproceso sin depender del origen (la capa bronce) |
| `transformar_ventas` | **Dataflow** | Flujo `df_ventas_minoristas`. Se ejecuta *On success* de `copiar_crudos` | La transformación del entregable 2 |
| `validar_lakehouse` | **Notebook** | Cuaderno `02-validacion-lakehouse`, con el lakehouse como predeterminado. *On success* de `transformar_ventas` | Fallar en rojo si los datos no cuadran, en vez de dejarlos pasar en silencio |
| `avisar_fallo` (opcional) | **Office 365 Outlook** | *On fail* de cualquiera de las anteriores | Enterarse del fallo sin abrir Fabric |

**Parámetro de la canalización:** `archivos` (tipo *Array*) = `["orders.csv", "customers.csv", "products.csv"]`.

**Programación:** *Schedule → Daily*, 06:00, zona horaria de Bogotá.

## ETL frente a ELT en este diseño

El curso describe dos combinaciones de canalización y flujo de datos:

| Patrón | Cómo | En este proyecto |
|---|---|---|
| **ETL** | El flujo de datos extrae del origen, transforma y carga; la canalización lo orquesta | El flujo `df_ventas_minoristas` lee los CSV del origen y carga las tablas transformadas |
| **ELT** | La canalización **copia** los datos crudos al lakehouse; después un flujo de datos los limpia desde ahí | La copia a `Files/raw/<fecha>/` es la parte E+L. Para un ELT completo, las consultas del flujo leerían de esa carpeta (conector *Lakehouse*) en vez de la URL; basta con cambiar el paso `Origen` de cada consulta |

Se dejó la lectura desde la URL para no depender de los identificadores del área de trabajo y del lakehouse, que el conector *Lakehouse* incrusta en el código M y cambian en cada entorno.

## Estado

pendiente [crear y ejecutar la canalización en Fabric]
