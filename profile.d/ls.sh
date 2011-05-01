##
# ls.sh
##

##
# ls aliases
##

function ls { /bin/ls -Fh "$@" ; }
function  l { /bin/ls -Fhl "$@" ; }
function ll { l "$@" ; }
function la { /bin/ls -AFhl "$@" ; }
function lr { /bin/ls -AFRhl "$@" ; }
function l. { /bin/ls -Fdhl "$@".[a-zA-Z]* 2>/dev/null ; }

##
# EOF
##

