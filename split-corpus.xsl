<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:template match="/">
        <xsl:result-document method="xml" indent="yes" href="split-files/letters-family.xml">
            <letters category="family">
                <xsl:apply-templates select="//year" mode="letters-family"/>
            </letters>
        </xsl:result-document>
        <xsl:result-document method="xml" indent="yes" href="split-files/letters-other.xml">
            <letters category="others">
                <xsl:apply-templates select="//year" mode="letters-other"/>
            </letters>
        </xsl:result-document>
        <xsl:result-document method="xml" indent="yes" href="split-files/miscellaneous.xml">
            <letters category="miscellaneous">
                <xsl:apply-templates select="//body/*[not(self::year)]" mode="miscellaneous"/>
            </letters>
        </xsl:result-document>
    </xsl:template>
    <xsl:template match="year" mode="letters-family">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:sequence select="letter[starts-with(@addressee, 'Достоевск')]"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="year" mode="letters-other">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:sequence select="letter[not(starts-with(@addressee, 'Достоевск'))]"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="*" mode="miscellaneous">
        <xsl:copy-of select="."/>
    </xsl:template>
</xsl:stylesheet>
