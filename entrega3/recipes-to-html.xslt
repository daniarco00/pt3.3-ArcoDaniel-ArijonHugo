<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/">
        <xsl:for-each select="recetas/receta">
            <!-- Crear un archivo por receta -->
            <xsl:variable name="filename" select="concat('receta_', translate(titulo, ' ', '_'), '.html')"/>
            
            <xsl:result-document href="{$filename}">
                <html>
                    <head>
                        <title><xsl:value-of select="titulo"/></title>
                        <link rel="stylesheet" type="text/css" href="estilo.css"/>
                        <style>
                            body {
                                font-family: Arial, sans-serif;
                                margin: 20px;
                                background-color: #f4f4f9;
                            }
                            .receta {
                                border: 1px solid #ddd;
                                padding: 20px;
                                background-color: #fff;
                                margin-bottom: 20px;
                            }
                            .receta h1 {
                                color: #333;
                            }
                            .receta h3 {
                                color: #555;
                            }
                            ul, ol {
                                margin-left: 20px;
                            }
                            .receta img {
                                max-width: 100%;
                                height: auto;
                            }
                        </style>
                    </head>
                    <body>
                        <div class="receta">
                            <h1><xsl:value-of select="titulo"/></h1>
                            
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
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>

