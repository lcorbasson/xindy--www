<?xml version="1.0" encoding="iso-8859-1"?>
<!-- $Id$
     ============================================================
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1" indent="yes"/>


  <xsl:template name="header">
      <TABLE cellpadding="0" cellspacing="0" border="0">
        <TR>
	  <TD colspan="3" height="50" align="left" class="headtop">
            <img src="images/xindy-image.gif" border="0" alt="logo"/>&#160;
            <img src="images/xindy-logo-trans.gif" border="0" alt="xindy"/>
          </TD>
        </TR>
        <TR>
	  <TD height="35" align="left" class="headtop">
	    <img src="images/xindy-subtitle-trans.gif" border="0"
                 alt="A Flexible Indexing System"/>
          </TD>
          <TD width="100%" class="headtop">&#160;</TD>
	  <TD height="35" align="right" class="headtop">
            <A href="http://sourceforge.net/"><img
               src="images/sflogo-small.png" border="0"
	       alt="Powered by sourceforge.net"/></A></TD>
        </TR>
     </TABLE>
  </xsl:template>

  <xsl:template name="top-selections">
    <TABLE cellpadding="0" cellspacing="0" border="0">
        <TR>
	  <TD width="100%" class="headsep">&#160;</TD>
          <TD height="30" class="headsep">
            <A href="./"> About </A> |
            <A href="documentation.html"> Documentation </A> |
            <A href="download-binary.html"> Download </A> |
            <A href="mailing-list.html"> Community </A>
          </TD>
	  <TD width="100" class="headsep">&#160;</TD>
        </TR>
     </TABLE>
  </xsl:template>

</xsl:stylesheet>
