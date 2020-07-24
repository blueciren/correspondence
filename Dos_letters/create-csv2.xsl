<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:kiun="kiunfabiana"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="text"/>
    <xsl:function name="kiun:quote" as="xs:string">
        <xsl:param name="input" as="xs:string"/>
        <xsl:variable name="result">
            <xsl:text>"</xsl:text>
            <xsl:sequence select="$input"/>
            <xsl:text>"</xsl:text>
        </xsl:variable>
        <xsl:sequence select="$result"/>
    </xsl:function>
    
    <xsl:variable name="all-letters" as="document-node()+" select="collection('split-files')"/>
    
    <xsl:template match="/">
        <xsl:text>"Addressor", "Addressee", "Year"&#x0a;</xsl:text>
        <xsl:for-each select="$all-letters//letter">
            <xsl:sort select="@addressee"/>
            <xsl:sequence select="kiun:quote('Достоевский Ф. М.')"/>
            <xsl:text>,</xsl:text>
            <xsl:sequence select="kiun:quote(@addressee)"/>
            <xsl:text>,</xsl:text>
            <xsl:sequence select="kiun:quote(@date)"/>
            
            <!-- 
                why they do not work? 
           <xsl:sequence select="year[descendant::letter[@addressee]]/@id"/>
            <xsl:sequence select="@date"/>
         
            -->
            
            <xsl:text>&#x0a;</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
