
# Look for local binaries, then brew, then stock.  The -U stands for
# unique, tells the shell that it should not add anything to $path if
# it's there already. To be precise, it keeps only the left-most
# occurrence.
typeset -U path
path=(~/bin /usr/local/bin /usr/local/opt/ruby/bin $path)

# Add auto-completions to zsh
fpath=(/usr/local/share/zsh-completions $fpath)

# Save some history
export HISTCONTROL=ignoredups
export HISTIGNORE="\&:bg:fg:exit:rmtmp:rmtmptex:*~:.*~:*#:.*#"
export IGNORE=$HISTIGNORE
export HISTSIZE=2000
export SAVEHIST=$HISTSIZE
export HISTFILE="$HOME/.zhistory"

# We treat TEXINPUTS in a special way. The -T (for tie) is the key to
# that; I've used `export' even though the basic variable declaration
# command is `typeset' because you nearly always want to get the
# colon-separated version ($TEXINPUTS here) visible to the
# environment, and I've set -U as described above for $path because
# it's a neat feature anyway.
export -TU TEXINPUTS texinputs

# Set default file protection mask
##
# 077 = rwx ___ ___ (no access at all for group & others)
# 022 = rwx r_x r_x (no write access  for group & others)
##
umask ${UMASK:=022}
export UMASK

# Use emacs as our default editor
export EDITOR=emacs

# GNU Plot
if [ -e /Applications/AquaTerm.app ]; then
    GNUTERMAPP=/Applications/AquaTerm.app
    GNUTERM=aqua
elif [ -e /Applications/ ]; then
    GNUTERMAPP=/Applications/Utilities/X11.appp
    GNUTERM=x11
fi
export GNUTERMAPP GNUTERM

# Pager
export LESS='-R'
export LESSOPEN='|~/bin/lessfilter %s'
