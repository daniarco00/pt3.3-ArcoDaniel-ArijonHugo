from lxml import etree

# Carga los archivos XML y XSLT
xml_file = 'receptes.xml'
xslt_file = 'recipes-to-html.xslt'

# Parseo de los archivos
xml = etree.parse(xml_file)
xslt = etree.parse(xslt_file)
transform = etree.XSLT(xslt)

# Extrae las recetas
recipes = xml.xpath('//receta')
print(f"Se encontraron {len(recipes)} recetas en el XML.")

# Procesar y generar archivos HTML
for index, recipe in enumerate(recipes, start=1):
    print(f"Procesando receta {index}...")

    # Crear un nuevo árbol XML solo con la receta actual
    single_recipe_tree = etree.ElementTree(recipe)

    # Aplicar la transformación
    output = transform(single_recipe_tree)
    if output is not None:
        # Generar el archivo HTML
        filename = f"receta{index}.html"
        with open(filename, 'wb') as f:
            f.write(etree.tostring(output, pretty_print=True, encoding='UTF-8'))
        print(f"Generado: {filename}")
    else:
        print(f"Fallo en la transformación de la receta {index}.")