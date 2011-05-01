##
# ls.sh
##

# On Linux we need to tell 'ls' explicitly to use colours, even
# through we have defined the environment correctly.
LS='ls'
if [ `uname` == "Linux" ]; then
    COLOUR='ls --color'
fi

##
# ls aliases
##

function ls { ${LS} -Fh "$@" ; }
function  l { ${LS} -Fhl "$@" ; }
function ll { l "$@" ; }
function la { ${LS} -AFhl "$@" ; }
function lr { ${LS} -AFRhl "$@" ; }
function l. { ${LS} -Fdhl "$@".[a-zA-Z]* 2>/dev/null ; }

##
# EOF
##

