##
# Destroy credentials
##

if [ -z "${TERM_PROGRAM}" ]; then
  # Don't run these commands if the shell is launched by Terminal,
  # even if it's a login shell.
  if klist -s >/dev/null 2>&1; then kdestroy >/dev/null 2>&1; fi
fi

# Local Variables:
# mode:shell-script
# sh-shell:bash
# End:
