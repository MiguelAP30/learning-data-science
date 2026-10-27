# -*- coding: utf-8 -*-
"""Ejecuta en sitio los cuadernos indicados (en orden) y muestra salidas de texto y errores."""
import sys, os
import nbformat
from nbclient import NotebookClient

sys.stdout.reconfigure(encoding='utf-8')
for path in sys.argv[1:]:
    nb = nbformat.read(path, as_version=4)
    NotebookClient(nb, timeout=900, kernel_name='python3', allow_errors=True,
                   resources={'metadata': {'path': os.path.dirname(path)}}).execute()
    for c in nb.cells:  # logs de la JVM (Ivy, Hive, log4j): ruido propio del entorno local
        if c.cell_type == 'code':
            c.outputs = [o for o in c.get('outputs', []) if o.get('name') != 'stderr']
    nbformat.write(nb, path)
    print('=' * 30, os.path.basename(path), flush=True)
    for i, c in enumerate(nb.cells):
        if c.cell_type != 'code':
            continue
        for o in c.get('outputs', []):
            t = o.get('output_type')
            if t == 'error':
                print(f'[{i}] ERROR {o["ename"]}: {o["evalue"][:400]}')
            elif t == 'stream' and o.get('name') == 'stdout':
                print(f'[{i}]', o['text'].rstrip())
            elif t in ('execute_result', 'display_data') and 'text/plain' in o.get('data', {}) and 'image/png' not in o['data']:
                print(f'[{i}]', o['data']['text/plain'][:1500])
