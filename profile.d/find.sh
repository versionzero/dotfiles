##
# find.sh
##

##
# find aliases
##

function files { find ${1} -type f -print 2>/dev/null ; }
function ff    { find . -name ${1} -print 2>/dev/null ; }

##
# EOF
##

