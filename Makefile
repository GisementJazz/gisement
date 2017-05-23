SRCS_C=$(shell find mscz/*.C.mscz | sed 's: :\\ :g')
SRCS_Bb=$(shell find mscz/*.Bb.mscz | sed 's: :\\ :g')
SRCS_Eb=$(shell find mscz/*.Eb.mscz | sed 's: :\\ :g')

PDFS_C=$(subst mscz,pdf,$(SRCS_C))
PDFS_Bb=$(subst mscz,pdf,$(SRCS_Bb))
PDFS_Eb=$(subst mscz,pdf,$(SRCS_Eb))
PDFS=$(PDFS_C) $(PDFS_Bb) $(PDFS_Eb)

books: books/book.C.pdf books/book.Bb.pdf books/book.Eb.pdf dl

book_C: books/book.C.pdf
book_Bb: books/book.Bb.pdf
book_Eb: books/book.Eb.pdf

books/book.C.pdf: imports_C $(PDFS_C)
	convert pdf/*.C.pdf books/book.C.pdf
books/book.Bb.pdf: imports_Bb $(PDFS_C) $(PDFS_Bb)
	convert pdf/*.Bb.pdf books/book.Bb.pdf
books/book.Eb.pdf: imports_Eb $(PDFS_C) $(PDFS_Eb)
	convert pdf/*.Eb.pdf books/book.Eb.pdf

mscz2pdf_C: $(PDFS_C)
mscz2pdf_Bb: $(PDFS_Bb)
mscz2pdf_Eb: $(PDFS_Eb)

imports_C:
	cp import_rb/*.C.pdf pdf/
imports_Bb:
	cp import_rb/*.Bb.pdf pdf/
imports_Eb:
	cp import_rb/*.Eb.pdf pdf/

pdf/%.C.pdf:
	mscore "$(subst pdf,mscz,$@)" -o "$@"
	if [ -z "$(strip $(filter $(subst .C.,.Bb.,$@),$(PDFS_Bb)))" ]; then mscore "$(subst pdf,mscz,$@)" -p transpose.Bb.qml -o "$(subst .C.,.Bb.,$@)"; fi
	if [ -z "$(strip $(filter $(subst .C.,.Eb.,$@),$(PDFS_Eb)))" ]; then mscore "$(subst pdf,mscz,$@)" -p transpose.Eb.qml -o "$(subst .C.,.Eb.,$@)"; fi

pdf/%.Bb.pdf:
	mscore "$(subst pdf,mscz,$@)" -o "$@"

pdf/%.Eb.pdf:
	mscore "$(subst pdf,mscz,$@)" -o "$@"

dl:
	python3 build_dl.py

clean:
	rm -f pdf/*.pdf books/*.pdf
	rm -f dl.md
