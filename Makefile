
#HTML_FLAGS = -c modern.css
HTML_FLAGS = -M pagetitle="Meet the Cat" -c gh-pandoc.css --embed-resources --standalone
TEX_FLAGS = --template=mydefault.latex --pdf-engine=xelatex
PDF_FLAGS = -V 'geometry:paperwidth=21cm' -V 'geometry:paperheight=29.7cm' -V 'geometry:vmargin=2cm' -V 'geometry:hmargin=2cm' -V 'fontsize:12pt'

filter = -F pandoc-crossref

screenies-2x1 = browser+bookmarks.png browser+search.png prefs-audio+midi.png prefs-gui+startup.png

all: html pdf
html: Purr-Data-Intro.html
pdf: Purr-Data-Intro.pdf

# This requires ImageMagick.

prefs-audio+midi.png: prefs-audio.png prefs-midi.png
	montage $^ -tile 2x1 -geometry +0+0 $@

prefs-gui+startup.png: prefs-gui.png prefs-startup.png
	montage $^ -tile 2x1 -geometry +0+0 $@

browser+bookmarks.png: browser-bookmark.png bookmarks.png
	montage $^ -tile 2x1 -geometry +0+0 $@

browser+search.png: browser.png search.png
	montage $^ -tile 2x1 -geometry +0+0 $@

clean:
	rm -f Purr-Data-Intro.html Purr-Data-Intro.pdf $(screenies-2x1)

%.html: %.md $(screenies-2x1)
	pandoc $(filter) -s $< -o $@ $(HTML_FLAGS)

%.pdf: %.md $(screenies-2x1)
	pandoc $(filter) -s $< -o $@ $(TEX_FLAGS) $(PDF_FLAGS)
