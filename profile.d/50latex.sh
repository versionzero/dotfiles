##
# latex.sh
##

##
# LaTeX
##

function makepdf { 
    NAME=${1%\.*}
    rm -f ${NAME}.pdf
    rubber --pdf ${NAME}
}

function openpdf {
    NAME=${1%\.*}
    makepdf ${NAME}
    if [[ -f ${NAME}.pdf ]]; then
	open ${NAME}.pdf
    fi
}

##
# EOF
##
