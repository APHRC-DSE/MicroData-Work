## convert .md to .docx .pdf etc

%.pdf: %.md
	pandoc $< -o $@

%.docx: %.md
	pandoc $< -o $@

## open files
%.go:
	make -s $* && xdg-open $* &

%.gov:
	make -s $* && vi $*
ngtarget: 
	$(MAKE) $<.png
	$(MAKE) $<.png.go

pdftarget:
	$(MAKE) $<
	($(MAKE) $<.pdf && ls $<.pdf && $(MAKE) $<.pdf.go) || $(MAKE) $<.go

vtarget:
	$(MAKE) $<.go

acrtarget:
	$(MAKE) $<.acr

gptarget:
	$(MAKE) $<.op

optarget:
	$(MAKE) $(target:%=%.pdf.op) || $(MAKE) $(target:%=%.op)

pushtarget:
	$(MAKE) $<.pd

rmtarget:
	- $(call hide,  $(target))
	$(MAKE) $(target)

target.mk:
	cp makefuns/newtarget.mk $@
Ignore = target.mk



