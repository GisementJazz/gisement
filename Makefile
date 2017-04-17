SRCS_C=$(shell find mscz/*.C.mscz | sed 's: :\\ :g')
SRCS_Bb=$(shell find mscz/*.Bb.mscz | sed 's: :\\ :g')
SRCS_Eb=$(shell find mscz/*.Eb.mscz | sed 's: :\\ :g')

PDFS_C=$(subst mscz,pdf,$(SRCS_C))
PDFS_Bb=$(subst mscz,pdf,$(SRCS_Bb))
PDFS_Eb=$(subst mscz,pdf,$(SRCS_Eb))
PDFS=$(PDFS_C) $(PDFS_Bb) $(PDFS_Eb)

opening_par := (
closing_par := )
escape_parens = $(subst $(closing_par),\$(closing_par),$(subst $(opening_par),\$(opening_par),$1))
ESCAPED_C=$(call escape_parens,$(PDFS_C))
ESCAPED_Bb=$(call escape_parens,$(PDFS_Bb))
ESCAPED_Eb=$(call escape_parens,$(PDFS_Eb))

books: book_C book_Bb book_Eb

book_C: mscz2pdf_C
	convert $(ESCAPED_C) books/book.C.pdf

book_Bb: mscz2pdf_C mscz2pdf_Bb
	convert $(ESCAPED_Bb) books/book.Bb.pdf

book_Eb: mscz2pdf_C mscz2pdf_Eb
	convert $(ESCAPED_Eb) books/book.Eb.pdf

mscz2pdf_C: $(PDFS_C)

mscz2pdf_Bb: $(PDFS_Bb)

mscz2pdf_Eb: $(PDFS_Eb)

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
