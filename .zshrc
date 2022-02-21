USER=$(whoami)

# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename "/home/$USER/.zshrc"

# zsh
setopt auto_cd
alias ll='ls -al'
alias lS='ls -1FSsh'
alias ...='../..'
alias ....='../../..'
alias mkdirp='mkdir -p'
alias rf='rm -rf'

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

#chicken-scheme
alias chickens='chicken-status'
alias chickeni='chicken-install'
alias chickenu='chicken-uninstall'
alias chickenrun='chicken-run'
alias chickenruntests='export CSI=csi; make all_tests'

# python
alias python='python3'
alias py='python3'
alias pip='pip3'

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

# Please, add your own generated ssh-keys here
# {
#     eval "$(ssh-agent -s)"
#     ssh-add ~/.ssh/id_qtlab
# } &> /dev/null

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
if [ -x /opt/homebrew/bin/cowsay -a -x /opt/homebrew/bin/fortune ]; then
  fortune | cowsay -f $(ls /opt/homebrew/Cellar/cowsay/3.04_1/share/cows | gshuf -n1) | lolcat
fi

export EDITOR=vim
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/$USER/.sdkman"
[[ -s "/home/$USER/.sdkman/bin/sdkman-init.sh" ]] && source "/home/$USER/.sdkman/bin/sdkman-init.sh"

#brew
export PATH=/opt/homebrew/bin:/Library/Frameworks/Python.framework/Versions/3.10/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
alias brew-update='brew update && brew upgrade && brew cleanup'
