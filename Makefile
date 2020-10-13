# NOTE: this file has been modified by A. Andiron from the original source
BUILD = build
BOOKNAME = Tremble
# This BOOKNAME variable is the output file name, not the title
TITLE = title.txt
CHAPTERS = spriggan/Tremble_the_Flowering_Wood.md
COVER_IMAGE = cover/Tremble-cover_standing-book-5x8thin.png
# I think the cover pic works better if you use a .png
# But upload a .tif to Amazon's cover pic
LATEX_CLASS = report
CSS = epub.css

all: book

book: epub html pdf

clean:
	rm -r $(BUILD)

epub: $(BUILD)/epub/$(BOOKNAME).epub

html: $(BUILD)/html/$(BOOKNAME).html

pdf: $(BUILD)/pdf/$(BOOKNAME).pdf

$(BUILD)/epub/$(BOOKNAME).epub: $(TITLE) $(CHAPTERS)
	mkdir -p $(BUILD)/epub
	pandoc --css=$(CSS) --epub-cover-image=$(COVER_IMAGE) -o $@ $^

$(BUILD)/html/$(BOOKNAME).html: $(CHAPTERS)
	mkdir -p $(BUILD)/html
	pandoc $(TOC) --to=html5 -o $@ $^

$(BUILD)/pdf/$(BOOKNAME).pdf: $(TITLE) $(CHAPTERS)
	mkdir -p $(BUILD)/pdf
	pandoc $(TOC) --pdf-engine=xelatex -V documentclass=$(LATEX_CLASS) -o $@ $^

.PHONY: all book clean epub html pdf
