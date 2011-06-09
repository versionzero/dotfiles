##
# latex.sh
##

##
# LaTeX
##

function makepdf { 
    NAME=${1%\.*}
    rubber --pdf ${NAME}
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
