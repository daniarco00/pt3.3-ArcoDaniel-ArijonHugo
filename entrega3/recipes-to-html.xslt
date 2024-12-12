<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/receta">
        <html>
            <head>
                <title><xsl:value-of select="titulo"/></title>
                <link rel="stylesheet" type="text/css" href="estilo.css"/>
            </head>
            <body>
                <div class="receta">
                    <h1><xsl:value-of select="titulo"/></h1>
                    <h2>Ingredientes:</h2>
                    <ul>
                        <xsl:for-each select="ingredientes/ingrediente">
                            <li><xsl:value-of select="."/></li>
                        </xsl:for-each>
                    </ul>
                    <h2>Instrucciones:</h2>
                    <ol>
                        <xsl:for-each select="instrucciones/paso">
                            <li><xsl:value-of select="."/></li>
                        </xsl:for-each>
                    </ol>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>