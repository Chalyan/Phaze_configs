USER=$(whoami)

# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename "/home/$USER/.zshrc"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$("$BASE16_SHELL/profile_helper.sh")"

# misc
alias ll='ls -al'
alias lS='ls -1FSsh'
alias ...='../..'
alias ....='../../..'
alias mkdirp='mkdir -p'
alias update-upgrade='sudo apt-get update && sudo apt-get upgrade'

# Pyhton
alias ipy='/usr/bin/ipython3'
alias py='/usr/bin/python3.8'
alias python='python3'

# git
alias gs='git status'
alias gss='git status -s'
alias gc='git commit'
alias gl='git log'
alias glo='git log --pretty=oneline'
alias gmt='git mergetool'
alias gp='git push'
alias mux="tmuxinator"
alias rmorig='find . -name '"'"'*.orig'"'"' -delete'

# Please, add your own generated ssh-key here
# {
#   eval "$(ssh-agent -s)"
#   ssh-add ~/.ssh/id_rsa
# }>/dev/null 2>&1

# mux/tmux
alias tmux='stty stop "" -ixoff; tmux'
alias muxv='mux start v ~'
alias muxvh='mux start vh ~'
alias muxhv='mux start hv ~'
alias muxhvh='mux start hvh ~'
alias txks='tmux kill-server'
alias txls='tmux ls'
alias rgr='ranger'

start_tmux() {
  local DEFAULT_LAYOUT="v"
  local DEFAULT_PATH=$(pwd)
  local DEFAULT_NAME="Default"
}

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Coloring and transparency setings

[ -n "$XTERM_VERSION" ] && transset-df -a >/dev/null

autoload -U colors && colors

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

setopt autocd extendedglob
unsetopt beep

source ~/.git-prompt.sh
RPROMPT="[%{$fg_no_bold[yellow]%}%?%{$reset_color%}]"
setopt PROMPT_SUBST
export GIT_PS1_SHOWSTASHSTATE="yes"
export GIT_PS1_DESCRIBE_STYLE="contains"
PS1='%{$fg_no_bold[green]%}%5~%{$fg_bold[red]%} $(__git_ps1 "[%s] ")%{$reset_color%}
ƒ ' >>~/.zshrc
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# enables cowsay and fortune.
if [ -x /usr/games/cowsay -a -x /usr/games/fortune ]; then
  fortune | cowsay -f $(ls /usr/share/cowsay/cows/ | shuf -n1) | lolcat
fi

export EDITOR=vim
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/$USER/.sdkman"
[[ -s "/home/$USER/.sdkman/bin/sdkman-init.sh" ]] && source "/home/$USER/.sdkman/bin/sdkman-init.sh"

DOTTY_HOME="/home/$USER/devel/dotty-0.20.0"

export PATH=$HOME/.local/bin:$DOTTY_HOME/bin:$PATH

export RANGER_LOAD_DEFAULT_RC=FALSE

plugins=(git colored-man-pages colorize)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
