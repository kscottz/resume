all: resumeSmall small sanitize

resume: 
	pdflatex --shell-escape KatherineScottResume.tex

resumeSmall: resume
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=KatherineScottResumeSmall.pdf KatherineScottResume.pdf

big: # make the pdf
	# Latex needs to run twice to generate page nums
	pdflatex --shell-escape KatherineScottCV.tex
	pdflatex --shell-escape KatherineScottCV.tex

sanitize: # clean up the latex garbage
	rm -rf *.toc *.out *.vrb *.nav *.snm *.log *flymake.* *.py~ *.aux *.dvi *.tex~

small: big # shrink everything - do this before commit
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=KatherineScottCVSmall.pdf KatherineScottCV.pdf

clean: #like it should be
	rm -rf *.toc *.out *.vrb *.nav  *.snm *.log *flymake.* *.py~ *.pdf *.tex~ *.dvi *.aux
