<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <xsl:for-each select="recipes/recipe">
            <xsl:variable name="filename" select="concat('recipe', @id, '.html')"/>
            <xsl:result-document href="{$filename}" method="html">
                <html>
                    <head>
                        <title><xsl:value-of select="name"/></title>
                        <link rel="stylesheet" type="text/css" href="estilo.css"/>
                    </head>
                    <body>
                        <div class="recipe">
                            <h1><xsl:value-of select="name"/></h1>
                            <h2>Ingredientes:</h2>
                            <ul>
                                <xsl:for-each select="ingredients/ingredient">
                                    <li><xsl:value-of select="."/></li>
                                </xsl:for-each>
                            </ul>
                            <h2>Instrucciones:</h2>
                            <ol>
                                <xsl:for-each select="instructions/step">
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