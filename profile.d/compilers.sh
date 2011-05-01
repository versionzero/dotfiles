##
# compilers.sh
##

##
# indent quick format
##

#alias cformat='indent -i2 -bl -bad -nbap -sob -ncdb -di20 -nbc -lp -nce -npcs -sc -ncs -l80'
alias cformat='indent -i2 -bl -bad -nbap -sob -ncdb -di20 -nbc -lp -nce -npcs -sc -l80'

##
# compiling aliases
##

alias  dc='export CC="distcc gcc"'
alias dcc='export CC="ccache distcc gcc"'
alias  dh='export DISTCC_HOSTS="`cat ~/.distcc_hosts`"'

##
# EOF
##

