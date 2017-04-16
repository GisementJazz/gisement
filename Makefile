SRCS=$(shell find mscz/* | sed 's: :\\ :g')
TGTS_PDF=$(subst mscz,pdf,$(SRCS))
opening_par := (
closing_par := )
escape_parens = $(subst $(closing_par),\$(closing_par),$(subst $(opening_par),\$(opening_par),$1))
ESCAPED=$(call escape_parens,$(TGTS_PDF))

book: mscz2pdf
	convert $(ESCAPED) books/book.pdf

mscz2pdf: $(TGTS_PDF)

$(TGTS_PDF):
	mscore "$(subst pdf,mscz,$@)" -o "$@"

clean:
	rm -f pdf/*.pdf books/*.pdf
