##
# rm.sh
##

##
# rm aliases
##

TEX_GARBAGE="*aux *bbl *blg *dvi *log *pdf *toc *snm *nav"

alias       cp='/bin/cp -pi'
alias       mv='/bin/mv -i'     
alias       rm='/bin/rm -i'     
alias      rmf='/bin/rm -f'
alias    rmtmp='/bin/rm -f *+(~|#) 2>/dev/null'
alias rmtmptex='/bin/rm -f *+(~|#) ${TEX_GARBAGE} 2>/dev/null'

##
# EOF
##

