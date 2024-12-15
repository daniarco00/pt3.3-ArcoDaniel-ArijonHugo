import os
from lxml import etree

# Rutas de los archivos XML y XSLT
xml_file = '/home/daniel/Escritorio/pt3.3-ArcoDaniel-ArijonHugo/entrega3/recetas.xml'
xslt_file = '/home/daniel/Escritorio/pt3.3-ArcoDaniel-ArijonHugo/entrega3/recipes-to-html.xslt'

# Cargar XML y XSLT
xml = etree.parse(xml_file)
xslt = etree.parse(xslt_file)
transform = etree.XSLT(xslt)

# Procesar cada receta
recetas = xml.xpath('//receta')
print(f"Se encontraron {len(recetas)} recetas.")

for receta in recetas:
    titulo = receta.find('titulo').text.strip()
    nombre_archivo = f"receta_{titulo.replace(' ', '_')}.html"

    # Crear un nuevo árbol XML con una receta
    root = etree.Element("recetas")
    root.append(receta)
    receta_tree = etree.ElementTree(root)

    # Aplicar la transformación
    output = transform(receta_tree)

    # Guardar el HTML en un archivo
    with open(nombre_archivo, 'wb') as f:
        f.write(etree.tostring(output, pretty_print=True, encoding='UTF-8'))
    print(f"Archivo generado: {nombre_archivo}")

print("Proceso completado.")
