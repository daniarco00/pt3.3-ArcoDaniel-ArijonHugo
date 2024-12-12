from lxml import etree

# Cargar los archivos XML y XSLT
xml_file = 'receptes.xml'
xslt_file = 'recipes-to-html.xslt'

# Parsear los archivos
xml = etree.parse(xml_file)
xslt = etree.parse(xslt_file)
transform = etree.XSLT(xslt)

# Obtener las recetas
recetas = xml.xpath('//receta')
print(f"Se encontraron {len(recetas)} recetas en el XML.")

# Procesar cada receta
for i, receta in enumerate(recetas, start=1):
    titulo = receta.find('titulo').text if receta.find('titulo') is not None else f"Receta_{i}"
    print(f"Procesando receta {i}: {titulo}")
    
    # Crear un árbol temporal para la receta
    receta_tree = etree.ElementTree(receta)

    # Aplicar la transformación
    try:
        output = transform(receta_tree)
        if output is not None:
            # Generar nombre del archivo
            filename = f"receta_{i}.html"
            # Guardar el HTML
            with open(filename, 'wb') as f:
                f.write(etree.tostring(output, pretty_print=True, encoding='UTF-8'))
            print(f"Archivo generado: {filename}")
        else:
            print(f"Error: No se pudo transformar la receta {i}.")
    except Exception as e:
        print(f"Error al procesar la receta {i}: {e}")
