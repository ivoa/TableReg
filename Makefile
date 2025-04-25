# ivoatex Makefile.  The http://ivoa.net/documents/notes/IVOATex
# for the targets available.

# short name of your document (edit $DOCNAME.tex; would be like RegTAP)
DOCNAME = TableReg

# count up; you probably do not want to bother with versions <1.0
DOCVERSION = 1.1

# Publication date, ISO format; update manually for "releases"
DOCDATE = 2025-04-25

# What is it you're writing: NOTE, WD, PR, REC, PEN, or EN
DOCTYPE = NOTE

# An e-mail address of the person doing the submission to the document
# repository (can be empty until a make upload is being made)
AUTHOR_EMAIL=msdemlei@ari.uni-heidelberg.de

# Source files for the TeX document (but the main file must always
# be called $(DOCNAME).tex)
SOURCES = $(DOCNAME).tex gitmeta.tex

# List of image files to be included in submitted package (anything that
# can be rendered directly by common web browsers)
FIGURES = fig-rel-sketch.tikz.tex

# List of PDF figures (figures that must be converted to pixel images to
# work in web browsers).
VECTORFIGURES = fig-rel-sketch.tikz.svg

# Additional files to distribute (e.g., CSS, schema files, examples...)
AUX_FILES = example-record.xml

DOCREPO_BASEURL=http://ivoa.net/documents/Notes/TableReg

-include ivoatex/Makefile

ivoatex/Makefile:
	@echo "*** ivoatex submodule not found.  Initialising submodules."
	@echo
	git submodule update --init

STILTS ?= stilts

# These tests need stilts >3.4
test:
	@$(STILTS) xsdvalidate \
		schemaloc="http://www.ivoa.net/xml/VODataService/v1.1=http://www.ivoa.net/xml/VODataService/v1.1" \
		example-record.xml

