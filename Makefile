
xsltproc = xsltproc
# usage: xsltproc input.xsl input.xml > output.html

mm2s5: xslt/mm2s5.xsl demo/slides.mm
	$(xsltproc) $^ > output/$@.html

mm2faq: xslt/mm2faq.xsl demo/faq.mm
	$(xsltproc) $^ > output/$@.html

mm-strip:
	bin/mm-strip.sed demo.mm

