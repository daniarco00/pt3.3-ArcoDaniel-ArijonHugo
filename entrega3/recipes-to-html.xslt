<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/recetas">
        <html>
            <head>
                <title>Recetario</title>
                <link rel="stylesheet" type="text/css" href="estilo.css"/>
            </head>
            <body>
                <h1>Recetario</h1>
                <xsl:for-each select="receta">
                    <div class="receta">
                        <h2><xsl:value-of select="titulo"/></h2>
                        <h3>Ingredientes:</h3>
                        <ul>
                            <xsl:for-each select="ingredientes/ingrediente">
                                <li><xsl:value-of select="."/></li>
                            </xsl:for-each>
                        </ul>
                        <h3>Instrucciones:</h3>
                        <ol>
                            <xsl:for-each select="instrucciones/paso">
                                <li><xsl:value-of select="."/></li>
                            </xsl:for-each>
                        </ol>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
