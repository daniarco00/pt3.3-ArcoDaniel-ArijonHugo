from lxml import etree

# Load the XML and XSLT files
xml_file = 'recipes.xml'
xslt_file = 'recipes-to-html.xslt'

# Parse the XML and XSLT files
xml = etree.parse(xml_file)
xslt = etree.parse(xslt_file)
transform = etree.XSLT(xslt)

# Apply the transformation to the entire XML document
output = transform(xml)

# Save the transformed output to a single HTML file for verification
with open('output.html', 'wb') as f:
    f.write(etree.tostring(output, pretty_print=True))

print("Transformation complete. Check the generated HTML files.")