##
# alias.sh
##

##
# Internet apps
##

# Quick and dirty downloader (the option is *not* a zero)
# How it works: copy a url in to the clipboard and type getit at the comman
alias getit='curl -O `pbpaste`'

##
# Aquamacs stuff
##

function e { 
    for f in "$@" ; do
 	test -e $f || touch $f
    done
    open -a "Aquamacs" "$@" ; 
}

##
# Man Pages
##

function pman {
    man -t "${1}" | open -f -a /Applications/Preview.app
}

##
# EOF
##

