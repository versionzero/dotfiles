##
# latex.sh
##

##
# LaTeX
##

function cleanpdf { 
    NAME=${1%\.*}
    rubber --clean ${NAME}
    rm -f ${NAME}.pdf
}

function makepdf { 
    NAME=${1%\.*}
    pdflatex ${NAME}.tex
    if [ -f ${NAME}.aux -a -f ${NAME}.bib ]; then
	bibtex ${NAME}.aux
	pdflatex ${NAME}.tex
    fi
    pdflatex ${NAME}.tex
}

function openpdf {
    NAME=${1%\.*}
    makepdf ${NAME}
    if [[ -f ${NAME}.pdf ]]; then
	open ${NAME}.pdf
    fi
}

alias clp=cleanpdf
alias mp=makepdf
alias op=openpdf

##
# EOF
##
