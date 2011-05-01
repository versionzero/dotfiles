##
# ssh-agent.sh
##

### Based on a work by Joseph M. Reagle by way of Daniel Starin.
###
### Source: http://mah.everybody.org/docs/ssh

SSH_ENV="${HOME}/.private/environment"

function start_agent {
    trap "kill $SSH_AGENT_PID; /bin/rm -f \"${SSH_ENV}\"" 0
    echo "Initialising new SSH agent... "
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' >"${SSH_ENV}"
    echo "done."
    /bin/chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" >/dev/null
    /usr/bin/ssh-add    
}

if [ $(os Linux) ]; then
    if [ -f "${SSH_ENV}" ]; then
	. "${SSH_ENV}" >/dev/null
	if [ $(not running ssh-agent) ]; then
            start_agent
	fi
    else
	start_agent
    fi
fi