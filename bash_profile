##
# .bash_profile
##

# We need to configure our local binary directory first, since we need
# some of the tools in it for the basic configuration that follows.
MY_LOCAL_PATH="$HOME/.local"
MY_BIN_PATH=$MY_LOCAL_PATH/bin
export PATH=${MY_BIN_PATH}:${PATH}

##
# Standard Environment
## 

# Source user specific environment customizations. 
if [ -e ~/.bashrc ]; then
    . ~/.bashrc
fi

# Cache the system's name
SYSTEM_NAME=`system-name`

# Operating system specific environment and customizations.
SYSTEM_PROFILE="~/.bash_profile.${SYSTEM_NAME}"
if [ -x "${SYSTEM_PROFILE}" ] ; then 
    . "${SYSTEM_PROFILE}"
fi

# Source custom generic commands
PROFILE_PATH="${HOME}/.profile.d"
if [ -d "${PROFILE_PATH}" ]; then
    for SCRIPT in "${PROFILE_PATH}"/*.sh; do
	if [ -x "${SCRIPT}" ]; then
	    . "${SCRIPT}"
	fi
    done
fi

# Source custom system specific commands
SYSTEM_PROFILE_PATH="${PROFILE_PATH}/${SYSTEM_NAME}"
if [ -d "${SYSTEM_PROFILE_PATH}" ]; then
    for SCRIPT in "${SYSTEM_PROFILE_PATH}"/*.sh; do
	if [ -x "${SCRIPT}" ]; then
	    . "${SCRIPT}"
	fi
    done
fi

##
# Compilers
##

## C/C++ related

# Include files
MY_INCLUDE_PATH="$MY_LOCAL_PATH/include"

C_INCLUDE_PATH=$MY_INCLUDE_PATH:$C_INCLUDE_PATH
export C_INCLUDE_PATH

CPLUS_INCLUDE_PATH=$MY_INCLUDE_PATH:$CPLUS_INCLUDE_PATH
export CPLUS_INCLUDE_PATH

# Library files
MY_LIB_PATH="$MY_LOCAL_PATH/lib"

LIBRARY_PATH=$MY_LIB_PATH:$LIBRARY_PATH
export LIBRARY_PATH

##
# Path
##

# Add pwd and our local bin directory to the path.
MY_BIN_PATH="$MY_LOCAL_PATH/bin"
PATH=$MY_BIN_PATH:/usr/bin:/usr/sbin:$PATH

# Export the new path
export PATH

##
# X11
##

# Local X display
if [ "$DISPLAYx" = "x" ]; then
    export DISPLAY=":0.0"
fi

##
# Bash environment
##

## Change prompts

# set a fancy prompt (non-colour, unless we know we "want" colour)
case "$TERM" in
    xterm*|screen)
	PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u\[\e[33m\]@\[\e[32m\]\h\[\e[0m\]:\[\e[33m\]\w\[\e[0m\]\n\$ '
	;;
    *)
	PS1="[\u@\h \W]\n\$ "
	;;
esac
export PS1
export PS2='Hurry up!!> '
export PS4='[$LINENO]+ '

# Some file patterns to ignore when doing completion
export FIGNORE=*~:\.*~:*\#:\.*\#

# Does what PATH does for executables
#export CDPATH=.:~:~/Documents:~/Volumes

# Give the history list a good size
export HISTSIZE=1000

# Ignore duplicates in history file
export HISTCONTROL=ignoredups
export HISTIGNORE="&:[bf]g:exit:rmtmp[tex]:source"

# Set default file protection mask
##
# 077 = rwx ___ ___ (no access at all for group & others)
# 022 = rwx r_x r_x (no write access  for group & others)
##
umask ${UMASK:=077}
export UMASK

##
# Editors
##

export EDITOR=emacs

##
# Local Variables: 
# mode: sh
# End: 
##

##
# EOF
##

