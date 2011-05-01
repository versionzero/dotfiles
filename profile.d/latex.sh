##
# latex.sh
##

##
# LaTeX
##

function makepdf { 
    NAME=${1%\.*}
    if [[ ! -f ${NAME}.aux ]]; then
	latex ${NAME}
    fi
    if [[ -f ${NAME}.bib ]]; then
	rm -f ${NAME}.bbl
	while [[ ! -e ${NAME}.bbl ]]; do
	    bibtex ${NAME}
	done
	latex ${NAME}
    fi
    if latex ${NAME}; then
	dvipdf ${NAME}
    fi
}

function openpdf {
    NAME=${1%\.*}    
    if makepdf ${NAME}; then
	open ${NAME}.pdf
    fi
}

##
# EOF
##
