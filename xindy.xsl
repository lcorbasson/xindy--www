<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1" indent="yes"/>


<!-- External definitions -->

     <xsl:include href="header.xsl"/>




<!-- Determine selected label -->

  <xsl:template name="setclass">
  <xsl:param name="category"/>

    <xsl:variable name="cat-selected">
      <xsl:value-of select="/page/@category"/>
    </xsl:variable>

     <xsl:choose>
       <xsl:when test=" $cat-selected = $category ">
	  <xsl:text>sidelabelselected</xsl:text>
       </xsl:when>
       <xsl:otherwise>
	  <xsl:text>sidelabel</xsl:text>
       </xsl:otherwise>
     </xsl:choose>
  </xsl:template>




<!-- ========================= PAGE ============================= -->

  <xsl:template match="/">

    <HTML>
      <HEAD>
        <TITLE>XINDY  Web Site</TITLE>
      <LINK TITLE="Web Styles" HREF="xindy.css" TYPE="text/css" REL="stylesheet"></LINK>
      </HEAD>


      <BODY>

<!-- header -->

      <xsl:call-template name="header"/>
      <xsl:call-template name="top-selections"/>


<!-- main -->

     <TABLE width="100%" cellpadding="0" cellspacing="0" border="0">
        <TR>
<!-- left column -->
        <TD width="140" valign="top" class="sidebasis">
           <TABLE width="100%" cellpadding="2" cellspacing="0" border="0" class="sidebasis">
             <TR><TD height="25">&#160;</TD></TR>

             <!-- read entry list from sitemap.xml -->
             <xsl:apply-templates select="document(/page/sitemap/@filename)/site/entry"/>

             <TR><TD height="300">&#160;</TD></TR>

        </TABLE>
        </TD>



<!-- separator -->
        <TD width="50" class="mainbasis">&#160;</TD>


<!-- text area -->
        <TD valign="top">
        <TABLE width="600" cellpadding="0" cellspacing="0" border="0"
                class="mainbasis">

           <TR><TD height="25" colspan="2" class="mainbasis">&#160; </TD></TR>

           <xsl:apply-templates select="page/title"/>

           <TR><TD  colspan="2" class="mainbasis">&#160; </TD></TR>

           <xsl:apply-templates select="page/text"/>
           <xsl:apply-templates select="page/coltext"/>
           <xsl:apply-templates select="page/next"/>
           <xsl:apply-templates select="page/prev"/>

           <TR><TD colspan="2" class="mainbasis">&#160; </TD></TR>
        </TABLE>
        </TD>

        </TR>
        </TABLE>
      </BODY>
    </HTML>
  </xsl:template>


<!-- ================== Tag Transformations ========================== -->

<!-- Navigation bar content -->

    <xsl:variable name="cat-selected">
      <xsl:value-of select="/page/@category"/>
    </xsl:variable>


  <xsl:template match="entry">
    <xsl:variable name="group">
      <xsl:value-of select="group"/>
    </xsl:variable>

  <xsl:choose>

     <xsl:when test=" $cat-selected = $group ">    <!-- if selected -->
       <xsl:choose>
         <xsl:when test="grouptitle">
           <!-- main entry first, if specified -->
           <TR><TD height="25" class="sidelabelselected">
           <A><xsl:attribute name="href">
              <xsl:copy-of select="url"/>
	      </xsl:attribute>
              <xsl:copy-of select="grouptitle/node()"/>
           </A></TD></TR>
         </xsl:when>
       </xsl:choose>

       <!-- then existing sub entries -->
       <xsl:choose>
         <xsl:when test="pagetitle">
           <TR><TD height="15" class="sidelabelselected">
           <A><xsl:attribute name="href">
	      <xsl:copy-of select="url"/>
	      </xsl:attribute>
	     &#160;&#160;&#160;&#187;
             <xsl:copy-of select="pagetitle/node()"/>
           </A></TD></TR>
         </xsl:when>
       </xsl:choose>
     </xsl:when>

     <xsl:otherwise>                            <!-- if not selected -->
       <xsl:choose>
         <xsl:when test="grouptitle">
           <!-- grouptitle is link -->
           <TR><TD height="25" class="sidelabel">
           <A><xsl:attribute name="href">
	      <xsl:copy-of select="url"/>
	      </xsl:attribute>
	      <xsl:copy-of select="grouptitle/node()"/>
           </A></TD></TR>
         </xsl:when>
       </xsl:choose>

     </xsl:otherwise>

     </xsl:choose>
  </xsl:template>



<!-- Page content -->

  <xsl:template match="title">
    <TR>
      <TD width="180" height="50" class="title">
        <xsl:copy-of select="node()"/>
      </TD>
      <TD valign="top"><img src="images/graue_linie.gif" width="400" height="1"></img>
     </TD>
    </TR>
  </xsl:template>


  <xsl:template match="text">
    <TR>
      <TD  colspan="2" class="text">
        <xsl:copy-of select="node()"/>
      </TD>
    </TR>
  </xsl:template>


  <xsl:template match="coltext">
    <TR>
      <xsl:apply-templates select="leftcol-title"/>
      <xsl:apply-templates select="leftcol"/>
      <xsl:apply-templates select="rightcol"/>
    </TR>
    <TR><TD colspan="2" height="10pt" class="mainbasis"></TD></TR>
  </xsl:template>

  <xsl:template match="leftcol-title">
    <TD width="180" class="leftcol-title">
      <xsl:copy-of select="node()"/>
    </TD>
  </xsl:template>

  <xsl:template match="leftcol">
    <TD width="180" class="leftcol">
      <xsl:copy-of select="node()"/>
    </TD>
  </xsl:template>

  <xsl:template match="rightcol">
    <TD class="rightcol">
      <xsl:copy-of select="node()"/>
    </TD>
  </xsl:template>



<!-- Inline navigation, within page content -->

  <xsl:template match="next">
    <TR><TD colspan="2" class="mainbasis">&#160; </TD></TR>
    <TR>
      <TD  colspan="2" align="right" class="followup">
        &#187; <A>
          <xsl:attribute name="href">
            <xsl:value-of select="@url"/>
	  </xsl:attribute>
        <xsl:copy-of select="node()"/></A>
      </TD>
    </TR>
  </xsl:template>

  <xsl:template match="prev">
    <TR><TD colspan="2" class="mainbasis">&#160; </TD></TR>
    <TR>
      <TD colspan="2" align="right" class="followup">
        &#171; <A>
          <xsl:attribute name="href">
            <xsl:value-of select="@url"/>
	  </xsl:attribute>
        <xsl:copy-of select="node()"/></A>
      </TD>
    </TR>
  </xsl:template>




</xsl:stylesheet>
