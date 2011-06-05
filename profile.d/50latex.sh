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
	${TOOL} ${NAME}
	rm -f ${NAME}.bbl
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
	open ${NAME}.pdf
    fi
}

##
# EOF
##
