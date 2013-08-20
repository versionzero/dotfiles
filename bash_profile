##
# .bash_profile
##

##
# Standard Environment
## 

# Source user specific environment customizations. 
if [ -e ~/.bashrc ]; then
    . ~/.bashrc
fi

##
# Path
##

# We need to configure our local binary directory first, since we need
# some of the tools in it for the basic configuration that follows.
MY_LOCAL_PATH="$HOME/.local"
MY_BIN_PATH="$MY_LOCAL_PATH/bin"
export PATH=${MY_BIN_PATH}:/usr/bin:/usr/sbin:$PATH

# Local srilm binaries
SRILM_PATH="~/.local/srilm/bin"
if [ -d ${SRILM_PATH} ]; then
    echo `uname -s`
    PATH=${SRILM_PATH}:${SRILM_PATH}/macosx:${SRILM_PATH}/macosx_l:$PATH
fi

##
# Profiles
##

# Cache the system's name
SYSTEM_NAME=`uname -s`

# Operating system specific environment and customizations.
SYSTEM_PROFILE="${HOME}/.bash_profile.${SYSTEM_NAME}"
if [ -f "${SYSTEM_PROFILE}" ] ; then 
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
# Paths
##

## Binaries

# Add some of the basics
PATH="/bin:/sbin:$PATH"

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
# Condor
##

## Set the root directory for all of our binaries
BINARIES_ROOT=/home/condor/binaries
BINARIES_SYSTEM=`uname`-`uname -p`

## Add the Condor binaries to the path
CONDOR_BINARIES=$BINARIES_ROOT/condor/$BINARIES_SYSTEM
PATH="$CONDOR_BINARIES/bin:$CONDOR_BINARIES/sbin:$PATH"

## Add CCTOOLS to the path.  This includes niceties like
## makeflow, wavefront, allpairs, parrot, etc.
CCTOOLS_HOME=$BINARIES_ROOT/cctools/$BINARIES_SYSTEM
PATH="$CCTOOLS_HOME/bin:$PATH"

## Add Python to the path
PYTHON_HOME=$BINARIES_ROOT/python/$BINARIES_SYSTEM
PATH="$PYTHON_HOME/bin:$PATH"

## Add CPLEX to the path and it's license
CPLEX_HOME=$BINARIES_ROOT/cplex/$BINARIES_SYSTEM
PATH="$CPLEX_HOME/cplex121/bin/x86_debian4.0_4.1:$PATH"
ILOG_LICENSE_FILE=$CPLEX_HOME/license/access.ilm
export ILOG_LICENSE_FILE

## Add MPICH2 to the path
MPICH2_BINARIES=$BINARIES_ROOT/mpich2/$BINARIES_SYSTEM
PATH="$MPICH2_BINARIES/bin:$MPICH2_BINARIES/sbin:$PATH"

##
# Python
##

PATH="${PATH}:/usr/local/share/python"

## Export the new path
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
	PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u\[\e[33m\]@\[\e[32m\]\h\[\e[0m\]:\[\e[33m\]\w\[\033[0;31m\]`__git_ps1`\[\e[0m\]\n\$ '
	;;
    *)
	PS1="[\u@\h`__git_ps1` \W]\n\$ "
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
export HISTIGNORE="&:[bf]g:exit:rmtmp[tex]"

# Have less do things more conscientiously
export LESS="-R"
export PAGER="less"

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

