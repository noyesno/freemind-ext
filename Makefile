
xsltproc = xsltproc

mm2s5: xslt/freemind2s5.xsl demo.mm
	$(xsltproc) xslt/freemind2s5.xsl demo.mm > demo.html


mm-strip:
	bin/mm-strip.sed demo.mm

