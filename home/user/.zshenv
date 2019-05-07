# Preferred editor for local and remote sessions
export VISUAL='/usr/bin/nvim'
export EDITOR="$VISUAL"

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# 32-bit wine
# export WINEARCH=win32
export WINEPREFIX="/home/eozd/.wine"

alias v='nvim'
alias open=xdg-open
alias dl="cd ~/Downloads"
alias pro='cd ~/projects'
alias l='ls -1 --color=auto'
alias l.='ls -dl .* --color=auto'
alias la='ls -A'
alias lla='ls -l --color=auto -a'
alias tmux="TERM=screen-256color-bce tmux"
alias ta="tmux a"
alias time='/usr/bin/time'
alias vimdiff='nvim -d'
alias shut='sudo systemctl poweroff'
alias reboot='sudo systemctl reboot'
alias suspend='sudo systemctl suspend'
alias tt='tree -L 2'
alias jnt="jupyter notebook --ip='127.0.0.1' --notebook-dir=~"
alias qs='qpdfview-session'
