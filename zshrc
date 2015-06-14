
#
# Based on the wisdom found in:
#
# * http://zsh.sourceforge.net/Guide/zshguide02.html
# * 
#

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
#ZSH_THEME="burnett"
ZSH_THEME="burnett-avit"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

plugins=(ant brew colored-man colorize osx-common-aliases docker gem
    git git-extras git-flow gitignore history history-substring-search
    node npm osx perl pip python screen systemd ruby textmate vagrant
    xcode)

# Now, load the configuration
source $ZSH/oh-my-zsh.sh

# Enable tab-completion
autoload -U compinit
compinit

# Initialize advanced prompt support, the theme will take care of the
# rest
autoload -U promptinit
promptinit

# Get rbenv compleation working
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Source custom generic commands
PROFILE_PATH="${HOME}/.profile.d"
if [[ -d "${PROFILE_PATH}" ]]; then
    #echo ${PROFILE_PATH}
    for SCRIPT in "${PROFILE_PATH}"/*.sh; do
        if [[ -x "${SCRIPT}" ]]; then
            . "${SCRIPT}"
            #echo ${SCRIPT}
        fi
    done
fi

# We're using brew for some additional commands, if they require
# something of our shell, we do it here
if [[ -r ~/.brewrc ]]; then
    . ~/.brewrc
fi

# Source our shell options
if [[ -r ~/.optrc ]]; then
    . ~/.optrc
fi

# We've got a few aliases configured, lets use them
if [[ -r ~/.aliasrc ]]; then
    . ~/.aliasrc
fi

# Enable MS code to open folders
code () {
    VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*
}
