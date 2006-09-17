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



RSYNC_EXCLUDE = --exclude=Makefile \
	    --exclude=CVS --exclude=.cvsignore --exclude='*.x?l'

dist:: all
	chmod -R g+w .
	rsync $(RSYNC_OPT) -rlptOgv --delete $(RSYNC_EXCLUDE) \
	    . sourceforge:/home/groups/x/xi/xindy/htdocs

trydist:: all
	$(MAKE) dist RSYNC_OPT=-n

update::
	cd .. ; \
		if [ -d $$OLDPWD.backup ] ; \
		   then	/bin/rm -rf $$OLDPWD.backup ; \
		   else /bin/true ; \
		fi  && \
		cp -Rp $$OLDPWD $$OLDPWD.backup
	rsync $(RSYNC_OPT) -rltgv --delete $(RSYNC_EXCLUDE) \
	    sourceforge:/home/groups/x/xi/xindy/htdocs/ .
