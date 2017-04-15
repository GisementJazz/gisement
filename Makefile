SRCS=$(shell find *.mscz | sed 's: :\\ :g')
TGTS=$(subst mscz,pdf,$(SRCS))

mscz2pdf: $(TGTS)

$(TGTS):
	mscore "$(subst .pdf,.mscz,$@)" -o "$@"

clean:
	rm -f *.pdf
