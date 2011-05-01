##
# functions.sh
##

# At times we would like to determine if an executable exists in the
# path, the 'which' command will tell us this, but calling it for this
# purpose is rather an obscure trick.  Thus, to clarify our
# intentions, we define an alias that hits more clearly at our
# intended action.
alias exists=which

# The Linux and Max OS X versions of the pidof tool are too different
# to try and properly accomodate for.  Instead of clutering the code
# below with some horid set of if statements, we abstract away the
# differences here.
function running {
    local PID=0
    if [ `uname` == "Darwin" ]; then
	X=`pidof | grep ${USER} | grep balance | awk '{ printf $2 }'`
	if [ "${X}x" != "x" ]; then
	    PID=${X}
	fi
    else
	PID=`pidof "$@"`
    fi
    echo ${PID}
}

##
# EOF
##
