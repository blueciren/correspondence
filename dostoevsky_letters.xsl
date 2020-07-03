<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" version="3.0">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
        <head>
         <title>Dostoevsky_correspondence</title>
        </head>
    <body>
        <xsl:for-each select="//letter/@adresser">
            
            <tr>
                <td><xsl:value-of select="."/></td>
                <xsl:text>&#x9;</xsl:text>
                <td><xsl:value-of select="//letter/@addressee"/></td>
            </tr>
            
            
            <!--<p>
                <xsl:value-of select="."/>
                <xsl:text>&#x9;</xsl:text>
                <xsl:value-of select="//letter/@addressee"/>
            </p>-->

        </xsl:for-each>
    </body>
    
    </html>
    </xsl:template>
    
</xsl:stylesheet>
