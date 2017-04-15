SRCS=$(shell find *.mscz | sed 's: :\\ :g')
TGTS=$(subst mscz,pdf,$(SRCS))
opening_par := (
closing_par := )
TGTS_ESC_TMP1=$(subst $(opening_par),\$(opening_par),$(TGTS))
TGTS_ESC=$(subst $(closing_par),\$(closing_par),$(TGTS_ESC_TMP1))

book: mscz2pdf
	convert $(TGTS_ESC) book.pdf

mscz2pdf: $(TGTS)

$(TGTS):
	mscore "$(subst .pdf,.mscz,$@)" -o "$@"

clean:
	rm -f *.pdf
