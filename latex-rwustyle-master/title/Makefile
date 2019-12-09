XELATEX?=xelatex
KPSEWHICH?=kpsewhich
MKTEXLSR?=mktexlsr
INSTALL?=install
PDFVIEWER?=xdg-open

EXAMPLES=examples/title.pdf
#examples/article.pdf\
#	 examples/report-twoside.pdf\
#	 examples/book.pdf\
#	 examples/test-quote.pdf\
#	 examples/test-csquotes.pdf\
	 
	 
RWUSTYLEFILES=rwustyle/rwubase.sty\
	      rwustyle/rwudefs.sty\
	      rwustyle/rwufont.sty\
	      rwustyle/rwukoma.sty\
	      rwustyle/rwulogo.eps

# If this is changed, also update the cleanup part of the examples/%.pdf rule!
CLEANFILES=examples/*.aux \
	   examples/*.lof \
	   examples/*.log \
	   examples/*.lot \
	   examples/*.nav \
	   examples/*.out \
	   examples/*.snm \
	   examples/*.toc \
	   examples/*.vrb

.PHONY: examples
examples: $(EXAMPLES)

.PHONY: .doinstall
.doinstall:
	@if [ -z $(TEXMFDIR) ]; then \
			echo "Could not determine installation directory." >&2 ; \
			echo "Please specify TEXMFDIR when invoking make, e.g.:" >&2 ; \
			echo "  make install TEXMFDIR=\"$$HOME/texmf\"" >&2 ; \
			exit 1 ; \
		fi
	for i in $(RWUSTYLEFILES); do \
		$(INSTALL) -m 644 -D -t "$(TEXMFDIR)/tex/latex/rwustyle" "$$i" ; \
		done

.PHONY: install-home
install-home: TEXMFDIR?=$(shell $(KPSEWHICH) -var-value=TEXMFHOME)
install-home: .doinstall

.PHONY: install
install: TEXMFDIR?=$(shell $(KPSEWHICH) -var-value=TEXMFLOCAL)
install: .doinstall
	$(MKTEXLSR) $(TEXMFDIR)

.PHONY: .douninstall
.douninstall:
	@if [ -z $(TEXMFDIR) ]; then \
			echo "Could not determine installation directory." >&2 ; \
			echo "Please specify TEXMFDIR when invoking make, e.g.:" >&2 ; \
			echo "  make uninstall TEXMFDIR=\"$$HOME/texmf\"" >&2 ; \
			exit 1 ; \
		fi
	for i in $(RWUSTYLEFILES); do \
		rm -f "$(TEXMFDIR)/tex/latex/$$i" ; \
		done

.PHONY: uninstall-home
uninstall-home: TEXMFDIR?=$(shell $(KPSEWHICH) -var-value=TEXMFHOME)
uninstall-home: .douninstall

.PHONY: uninstall
uninstall: TEXMFDIR?=$(shell $(KPSEWHICH) -var-value=TEXMFLOCAL)
uninstall: .douninstall
	$(MKTEXLSR) $(TEXMFDIR)

.PHONY: clean
clean:
	for i in $(CLEANFILES); do [ -f "$$i" ] && rm -f "$$i"; done; exit 0

.PHONY: mrproper
mrproper: clean
	for i in $(EXAMPLES); do [ -f "$$i" ] && rm -f "$$i"; done; exit 0

# FIXME: Find a way that is less clumsy than repeating all the file extensions
# from CLEANFILES!
examples/%.pdf: examples/%.tex $(RWUSTYLEFILES)
	@echo "Cleaning up first ..."
	rm -f "$(patsubst %.tex,%.aux,$<)"
	rm -f "$(patsubst %.tex,%.lof,$<)"
	rm -f "$(patsubst %.tex,%.log,$<)"
	rm -f "$(patsubst %.tex,%.lot,$<)"
	rm -f "$(patsubst %.tex,%.nav,$<)"
	rm -f "$(patsubst %.tex,%.out,$<)"
	rm -f "$(patsubst %.tex,%.snm,$<)"
	rm -f "$(patsubst %.tex,%.snm,$<)"
	rm -f "$(patsubst %.tex,%.toc,$<)"
	rm -f "$(patsubst %.tex,%.vrb,$<)"
	@echo "Running $(XELATEX) three times for $< ..."
	cd examples && env TEXINPUTS=../rwustyle:: $(XELATEX) -interaction nonstopmode -halt-on-error $(notdir $<)
	cd examples && env TEXINPUTS=../rwustyle:: $(XELATEX) -interaction nonstopmode -halt-on-error $(notdir $<)
	cd examples && env TEXINPUTS=../rwustyle:: $(XELATEX) -interaction nonstopmode -halt-on-error $(notdir $<)
