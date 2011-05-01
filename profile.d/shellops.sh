##
# shellops.sh - shell options
##

##
# Shell options
##
	
#set -o history                 ## Enable the command history
set -o ignoreeof               ## Ignore Ctrl+D as logout
set -o noclobber               ## Don't overwrite files with >, use >|  
set -o nolog                   ## Don't store function defs in history
set -o emacs                   ## Set line editing mode to that of emacs.

##
# More shell options
##
	
shopt -sq cdspell              ## Spell check cd commands.
shopt -sq checkwinsize         ## Update LINES and COLUMNS vars if required.
shopt -sq cmdhist              ## Cause multi-line commands to be appended as 
                               ##  single-line commands.
shopt -sq dotglob              ## Include dot files in pathname expansion.
shopt -sq extglob              ## Allow for ksh-88 egrep pattern matching.
shopt -sq nocaseglob           ## Case insensitive pathname expansion.
	
##
# Readline variables
##
	
set completion-ignore-case on  ## Make command line completion ignore case.
set mark-directories on        ## Mark compleated directories by appending a
                               ##  slash.
set match-hidden-files on      ## Allow hidden files to be matched when doing 
                               ##  compleation.
set show-all-if-ambiguous on   ## Display compleation ambiguities.

##
# EOF
##
