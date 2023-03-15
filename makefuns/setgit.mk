gitadd:
	git add -f Makefile $(Sources)

gitignore:
	echo ".gitignore" > .gitignore
	echo "*.pdf" >> .gitignore
	echo "*.html" >> .gitignore
	echo ".*.swp" >> .gitignore
	echo "*.Rout*" >> .gitignore
	echo "*.Pyout*" >> .gitignore
	echo "target.mk" >> .gitignore
	echo "__pycache__/*" >> .gitignore
	echo ".ipynb_checkpoints/*" >> .gitignore
	echo $(Ignore) >> .gitignore

gitcommit:
	git commit -m "Auto commited" && git commit --amend

gitsync:
	git pull
	make -s gitignore
	make gitadd && make gitcommit
	git push
