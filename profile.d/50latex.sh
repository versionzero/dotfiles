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

function mypdflatex {
    pdflatex --file-line-error --shell-escape --synctex=1 $*
}

function makepdf { 
    NAME=${1%\.*}
    mypdflatex ${NAME}.tex
    if [ -f ${NAME}-*.asy ]; then
	asy ${NAME}-*.asy
    fi
    if [ -f ${NAME}.aux -a -f ${NAME}.bib ]; then
	bibtex ${NAME}.aux
	mypdflatex ${NAME}.tex
    fi
    mypdflatex ${NAME}.tex
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
