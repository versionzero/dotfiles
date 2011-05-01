##
# functions.sh
##

# At times we would like to determine if an executable exists in the
# path, the 'which' command will tell us this, but calling it for this
# purpose is rather an obscure trick.  Thus, to clarify our
# intentions, we define an alias that hits more clearly at our
# intended action.
function exists {
    which "$@" 2>/dev/null
}

# Since bash functions 'return' cannot return a value, we use echo in
# place of a return value. This serves to emulate return values if we
# are careful how we use the functions. An example of how we might use
# this functions is:
#
# if [ $(os "Linux") ]; then
#    # do something here
# fi
#
# Where $(os "blah") is a function.  Using echo this way allows us to
# treat function as if it were executables themselves.
function return {
    if [ ${1} -ne 0 ]; then
	echo "false"
    fi
    exit
}

# From time to time we need to know is a particular OS is running.
# The following will help us cleanly determine which OS is being used.
function os {
    if [ "`uname`" != "$@" ]; then
	return 1
    fi
    return 0
}

# The Linux and Max OS X versions of the pidof tool are too different
# to try and properly accomodate for all the weird subtleties.
# Instead of clutering the code below with some horid set of if
# statements, we abstract away the differences here.
function running {
    local PID=
    if [ `uname` == "Darwin" ]; then
	PID=`pidof | grep ${USER} | grep balance | awk '{ printf $2 }'`	
    else
	PID=`pidof "$@"`
    fi
    if [ "${PID}x" == "x" ]; then
	return 1
    fi
    return 0
}

# Just negate the result of the function we are given.  Note that we
# make no attempt to determin if the function we are give actually
# exists.  It would not be hard to add this functionality, but the
# purpose of this is to be fast, not nessesarily safe.  We may revisit
# this approach later.
function not {
    local NAME=$1
    shift
    if [ $(${NAME} "$@") ]; then
	return 1
    fi
    return 0
}

##
# EOF
##
