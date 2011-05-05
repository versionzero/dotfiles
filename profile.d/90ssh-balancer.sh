##
# balance.sh
##

## The purpose of this script is to configure load balancing across
## the 3 linux machines the school has to offer.  We do this becase
## there are times when one is down, or otherwise unreachable and we'd
## rather not have to keep changing all my git repos and ssh host
## config settings to reflect all the possible host name changes.
##
## For more details visit: http://www.inlab.de/balance.html

# Define the ports we are dealing with.  We choose to use ports >1000
# so that we do not need to do this as a super user (there would be no
# benefit, and it would require additional security considerations
# that I don't care to think about).
#
# For conviniece I've configured my ssh_config file to use port 2222
# for every connection.  If we change the port here, we need to
# remember to change it in .ssh/config as well.
LOCAL=2222
REMOTE=22

# Build a list of all the destination servers we will "load balance"
# over.  Basically we will just round-robin over them, and if one is
# down, we will just move on to the next.  This makes it dead simple
# for writing scripts that depend on a host name. Put simply, we do
# not ever need to write fail-over code.
function build_server_list {
    SERVERS=
    for NAME in `cat ${SSH_HOSTS}`; do
	SERVERS="${NAME}:${REMOTE} ${SERVERS}"
    done
}

# Before we try to start the load balancer, we should check if it is
# already running.  This can happen, if we re-source our configuration
# files.  Also, we check that it is *our* copy of the load balancer
# that is running.  This is not fool-proof, as we might be running
# other instances of the load balancer for other purposes, but we'll
# deal with that when it comes up :)
#
# We also check if balance is actually installed, if it is not, then
# we just issue a polite warning.
function run_load_balancer {
    if [ $(exists balance) ]; then
	if [ $(not running balance) ]; then
	    balance ${LOCAL} ${SERVERS}
	fi
    else
	echo "NOTE: Balance is NOT installed. SSH load-balancing will be"
	echo "disabled for this session. (http://www.inlab.de/balance.html)"
    fi
}

# **********************************************************************
# NOTE: There are some major security considerations with this
# approach that I have still not found a sutable remedy to it.  If you
# are interested in this problem, please refer to the .ssh/config file
# for more details.
# **********************************************************************

# Since we are running this script on various different machines, it
# makes sence to have a per-machine list of remove ssh host to draw
# from. This way my laptop can use load-balance over differnt hosts
# than my desktop at work does.
SSH_HOSTS="${HOME}/.ssh-hosts.`hostname -s`"
if [ -f ${SSH_HOSTS} ]; then
    build_server_list
    run_load_balancer
else
    echo "Unable to find SSH hosts file: ${SSH_HOSTS}"
fi
