%.Rout.pdf: %.R
	R --vanilla < $< >$*.Rout && mv Rplots.pdf $@
