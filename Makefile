
curent: target
-include target.mk

######################################################################

Sources += $(wildcard *.md *.py *.R)
Sources += README.md

######################################################################

test.Rout.pdf: test.R

######################################################################

## make stuff for automation
.DELETE_ON_ERROR:

Sources += makefuns/*

-include makefuns/setup.mk
-include makefuns/setgit.mk
-include makefuns/setpy.mk
-include makefuns/setR.mk
