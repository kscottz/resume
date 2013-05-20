all: big sanitize

big: # make the pdf
	pdflatex --shell-escape KatherineScottCV.tex

sanitize: # clean up the latex garbage
	rm -rf *.toc *.out *.vrb *.nav *.aux *.snm *.log *flymake.* *.py~ 

small: big sanitize # shrink everything - do this before commit
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=KatherineScottCVSmall.pdf KatherineScottCV.pdf

clean: #like it should be
	rm -rf *.toc *.out *.vrb *.nav *.aux *.snm *.log *flymake.* *.py~ *.pdf
