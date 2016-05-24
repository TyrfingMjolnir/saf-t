<?xml version="1.0" encoding="UTF-8"?>
<!-- Created with vim and tidy for imports of SAF-T to FileMaker by Gjermund Gusland Thorsen<gjermundprivat@gmail.com> tested with xsltproc -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/*">
    <FMPXMLRESULT xmlns="http://www.filemaker.com/fmpxmlresult">
      <ERRORCODE>0</ERRORCODE>
      <PRODUCT BUILD="" NAME="" VERSION=""/>
      <DATABASE DATEFORMAT="M/d/yyyy" LAYOUT="" NAME="" RECORDS="{count(/StandardAccounts/Account)}" TIMEFORMAT="h:mm:ss a"/>
      <METADATA>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="accountID" TYPE="NUMBER"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="description" TYPE="TEXT"/>
      </METADATA>
      <RESULTSET FOUND="{count(/StandardAccounts/Account)}">
        <xsl:apply-templates select="/StandardAccounts/Account"/>
      </RESULTSET>
    </FMPXMLRESULT>
  </xsl:template>
  <xsl:template match="*[name() = 'Account']">
    <ROW xmlns="http://www.filemaker.com/fmpxmlresult" MODID="0" RECORDID="{position()}">
      <COL>
        <DATA>
          <xsl:value-of select="AccountID"/>
        </DATA>
      </COL>
      <COL>
        <DATA>
          <xsl:value-of select="Description[@ISOLanguageCode='ENG']"/>
        </DATA>
      </COL>
    </ROW>
  </xsl:template>
</xsl:stylesheet>
