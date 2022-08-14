
#HTML_FLAGS = -c modern.css
HTML_FLAGS = -M pagetitle="Meet the Cat" -c gh-pandoc.css --self-contained
TEX_FLAGS = --template=mydefault.latex --pdf-engine=xelatex
PDF_FLAGS = -V 'geometry:paperwidth=21cm' -V 'geometry:paperheight=29.7cm' -V 'geometry:vmargin=2cm' -V 'geometry:hmargin=2cm' -V 'fontsize:12pt'

filter = -F pandoc-crossref

all: html pdf
html: Purr-Data-Intro.html
pdf: Purr-Data-Intro.pdf

clean:
	rm -f Purr-Data-Intro.html Purr-Data-Intro.pdf

%.html: %.md
	pandoc $(filter) -s $< -o $@ $(HTML_FLAGS)

%.pdf: %.md
	pandoc $(filter) -s $< -o $@ $(TEX_FLAGS) $(PDF_FLAGS)
