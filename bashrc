##
# .bashrc - User bashrc file
##

# Source global bashrc
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Are we interactive?
if [[ $- != *i* ]]; then
    return 0
fi

# Set which file configures the interactive input settings 
if [ -f ~/.inputrc ]; then
    export INPUTRC=~/.inputrc
fi

#  Local Variables:
#  mode: sh
#  End:

##
# EOF
##

