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


SHELL = /bin/bash


all:: $(HTML)

$(HTML): %.html : %.xml xindy.xsl header.xsl sitemap.xml
	$(XALAN) -HTML -INDENT 3 -IN $*.xml -XSL xindy.xsl -OUT $*.html



dist:: all
	chmod -R g+w .
	rsync -av --delete --exclude=Makefile \
	    --exclude=CVS --exclude=.cvsignore --exclude='*.x?l' \
	    . sourceforge:/home/groups/x/xi/xindy/htdocs

trydist:: all
	chmod -R g+w .
	rsync -n -av --delete --exclude=Makefile \
	    --exclude=CVS --exclude=.cvsignore --exclude='*.x?l' \
	    . sourceforge:/home/groups/x/xi/xindy/htdocs

update::
	cd .. ; \
		if [ -d $$OLDPWD.backup ] ; \
		   then	mvdel $$OLDPWD.backup ; \
		   else /bin/true ; \
		fi  && \
		cpfs $$OLDPWD $$OLDPWD.backup
	rsync -rltgv --delete --exclude=Makefile \
	    --exclude=CVS --exclude=.cvsignore --exclude='*.x?l' \
	    sourceforge:/home/groups/x/xi/xindy/htdocs/ .
