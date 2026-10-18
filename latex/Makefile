LATEXMK ?= latexmk
OUTDIR := build
SOURCES := academic-cv-zh.tex academic-cv-en.tex
SHARED := academic-cv.cls
PDFS := $(addprefix $(OUTDIR)/,$(SOURCES:.tex=.pdf))
FLAGS := -xelatex -interaction=nonstopmode -halt-on-error -file-line-error

.PHONY: all pdf zh en examples clean distclean preview FORCE

all: pdf
pdf: $(PDFS)
zh: $(OUTDIR)/academic-cv-zh.pdf
en: $(OUTDIR)/academic-cv-en.pdf

$(OUTDIR)/%.pdf: %.tex $(SHARED) FORCE
	@mkdir -p "$(OUTDIR)"
	$(LATEXMK) $(FLAGS) -outdir="$(OUTDIR)" "$<"

FORCE:

examples: pdf
	@mkdir -p ../examples
	cp $(PDFS) ../examples/

preview: examples
	@mkdir -p ../docs/previews
	pdftoppm -scale-to 1600 -png -singlefile "$(OUTDIR)/academic-cv-zh.pdf" ../docs/previews/academic-cv-zh
	pdftoppm -scale-to 1600 -png -singlefile "$(OUTDIR)/academic-cv-en.pdf" ../docs/previews/academic-cv-en

# Keep the PDFs when cleaning auxiliary files.
clean:
	$(LATEXMK) -c -outdir="$(OUTDIR)" $(SOURCES)

distclean: clean
	$(RM) $(PDFS)
