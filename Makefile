# $Id$
# ------------------------------------------------------------

#
# GNU Makefile for xindy Web Site
#


XALAN = xalan

HTML = index.html \
	features.html \
	documentation.html make-rules.html \
	download-binary.html download-source.html \
	source-build-thomas.html source-build-roger.html \
	mailing-list.html
#	features.html latex.html
#	howto-authors.html howto-style-writers.html reference-xindy.html
#	faq.html demo.html


all:: $(HTML)

$(HTML): %.html : %.xml xindy.xsl header.xsl sitemap.xml
	$(XALAN) -HTML -INDENT 3 -IN $*.xml -XSL xindy.xsl -OUT $*.html



dist:: all
	rsync -av --delete . www.xindy.org:/shared/www/xindy \
	    --exclude=CVS --exclude=.cvsignore --exclude='*.x?l'
