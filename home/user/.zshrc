# Path to your oh-my-zsh installation.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/eozd/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

export ZSH=/home/eozd/.oh-my-zsh
export TERM=xterm-256color

bindkey -v
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="fino"

# setopt NO_HUP

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

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
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode zsh-autosuggestions)
autoload -Uz compinit
compinit


# User configuration


# added by Anaconda3 4.4.0 installer
PATH="$HOME/.cargo/bin:$HOME/bin:$HOME/.local/bin:/bin:/usr/local/sbin:/usr/local/bin:/usr/bin"

LD_LIBRARY_PATH="$HOME/lib:/usr/local/lib:/usr/lib:/lib"

DISABLE_AUTO_UPDATE=true
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export VISUAL='/usr/bin/nvim'
export EDITOR="$VISUAL"

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"


HISTSIZE=5000
HISTFILESIZE=20000
HISTFILE=~/.histfile

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

function cl
{
	cd $1 && ll
}

function m
{
	man "$@" | nvim -c 'set ft=man' -
}

function deb() {
    local id="$(tmux split-pane -hPF "#D" "tail -f /dev/null")"
    tmux last-pane
    local tty="$(tmux display-message -p -t "$id" '#{pane_tty}')"
    rust-gdb -ex "dashboard -output $tty" "$@"
    tmux kill-pane -t "$id"
}

export cl
export m

source ~/.zshenv
stty -ixon

bindkey '^I' complete-word
bindkey '^[[Z' autosuggest-accept
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3,bold,underline'
ZSH_AUTOSUGGEST_USE_ASYNC=true
# ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=()
#
#
export FZF_DEFAULT_COMMAND='rg --files --smart-case'
