##
# general.sh
##

# monitor the growth of a file that is being written by some other process
alias follow='tail -f' 

# lazy history list
alias h='fc -lr'

# simple clear screen (ala MS-DOS)
alias cls='clear'

# use ack instead of grep
#alias grep='ack'

# get my external IP
alias myip='curl ifconfig.me'

# re-evaluate the bash profile scripts
function source {
    local OPTIONS="$@"
    . ${OPTIONS:=~/.bash_profile}
}

# short version of make
alias m='make'

# short version of git
alias g='git'

# Autocomplete for 'g' as well
complete -o default -o nospace -F _git g

## ssh helper: the school computers don't understand the xterm-color termcap
## so we just change it when we use ssh
function ssh { 
    local SSH="/usr/bin/ssh"
    TERM=xterm ${SSH} -Y "$@"
}

##
# EOF
##

