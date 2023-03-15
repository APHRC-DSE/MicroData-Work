## pdf output for several figures
## something line Rplots.pdf
define pysavepdf
from matplotlib.backends.backend_pdf import PdfPages
def pysavepdf(filename, plt):
	# PdfPages is a wrapper around pdf
	# file so there is no clash and create
	# files with no error.
	p = PdfPages(filename)

	# get_fignums Return list of existing
	# figure numbers
	fig_nums = plt.get_fignums()
	figs = [plt.figure(n) for n in fig_nums]

	# iterating over the numbers in list
	for fig in figs:

		# and saving the files
		fig.savefig(p, format='pdf')

	# close the object
	p.close()

pysavepdf(filename, plt)
endef

export pysavepdf

%.pdf: %.py
	python -c "from $* import *; filename=\"$@\"; plt=plt; $$pysavepdf" > $*.Pyout

## Run python script
%.Pyout: %.py
	python -u $(filter %.py, $^) > $@

## Jupyter notebook conversion

### to html
%.html: %.ipynb
	jupyter nbconvert --to html $<

### to pdf
%.pdf: %.ipynb
	jupyter nbconvert --to pdf $<
