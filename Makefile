# $Id$
# ------------------------------------------------------------

#
# GNU Makefile for xindy Web Site
#


XALAN = xalan

HTML = index.html
#	features.html latex.html
#	documentation.html howto-authors.html howto-style-writers.html
#	reference-xindy.html reference-make-rules.html reports.html
#	faq.html mailing-list.html demo.html


all:: $(HTML)

$(HTML): %.html : %.xml xindy.xsl header.xsl sitemap.xml
	$(XALAN) -HTML -INDENT 3 -IN $*.xml -XSL xindy.xsl -OUT $*.html



dist:: all
	rsync -av --delete . www.xindy.org:/shared/www/xindy \
	    --exclude=CVS --exclude=.cvsignore --exclude='*.x?l'
