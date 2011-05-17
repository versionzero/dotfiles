##
# ls.sh
##

# On Linux we need to tell 'ls' explicitly to use colours, even
# through we have defined the environment correctly.
LS='/bin/ls -pbF'
if [ "`uname`" == "Linux" ]; then
    LS="${LS} --group-directories-first --color=auto"
fi

##
# ls aliases
##

function ls { ${LS} -h "$@" ; }
function  l { ${LS} -hl "$@" ; }
function ll { l "$@" ; }
function la { ${LS} -Ahl "$@" ; }
function lr { ${LS} -Ahl "$@" ; }
function l. { ${LS} -dhl "$@".[a-zA-Z]* 2>/dev/null ; }

##
# Common ls typos
##

alias sl='ls'

##
# EOF
##

