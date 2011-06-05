##
# latex.sh
##

##
# LaTeX
##

function makepdf { 
    NAME=${1%\.*}
    TOOL=${2:-pdflatex}
    if [[ -f ${NAME}.bib ]]; then
	rm -f ${NAME}.bbl
	${TOOL} ${NAME}
	bibtex ${NAME}
	${TOOL} ${NAME}
    fi
    ${TOOL} ${NAME}
    if [ "${TOOL}" == "latex" ]; then
	if ${TOOL} ${NAME}; then
	    dvipdf ${NAME}
	fi
    fi
}

function openpdf {
    NAME=${1%\.*}    
    if makepdf ${NAME}; then
	if [[ -f ${NAME}.pdf ]]; then
	    open ${NAME}.pdf
	fi
    fi
}

##
# EOF
##
