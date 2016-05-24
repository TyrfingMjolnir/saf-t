<?xml version="1.0" encoding="UTF-8"?>
<!-- Created with vim and tidy for imports of SAF-T to FileMaker by Gjermund Gusland Thorsen<gjermundprivat@gmail.com> tested with xsltproc -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/*">
    <FMPXMLRESULT xmlns="http://www.filemaker.com/fmpxmlresult">
      <ERRORCODE>0</ERRORCODE>
      <PRODUCT BUILD="" NAME="" VERSION=""/>
      <DATABASE DATEFORMAT="M/d/yyyy" LAYOUT="TaxCode" NAME="" RECORDS="{count(/StandardTaxCodes/TaxCode)}" TIMEFORMAT="h:mm:ss a"/>
      <METADATA>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="taxCodeID" TYPE="NUMBER"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="description" TYPE="TEXT"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="compensation" TYPE="TEXT"/>
      </METADATA>
      <RESULTSET FOUND="{count(/StandardTaxCodes/TaxCode)}">
        <xsl:apply-templates select="/StandardTaxCodes/TaxCode"/>
      </RESULTSET>
    </FMPXMLRESULT>
  </xsl:template>
  <xsl:template match="*[name() = 'TaxCode']">
    <ROW xmlns="http://www.filemaker.com/fmpxmlresult" MODID="0" RECORDID="{position()}">
      <COL>
        <DATA>
          <xsl:value-of select="ID"/>
        </DATA>
      </COL>
      <COL>
        <DATA>
          <xsl:value-of select="Description[@ISOLanguageCode='ENG']"/>
        </DATA>
      </COL>
      <COL>
        <DATA>
          <xsl:value-of select="Compensation"/>
        </DATA>
      </COL>
    </ROW>
  </xsl:template>
</xsl:stylesheet>
