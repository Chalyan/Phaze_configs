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

#C++
alias CC='g++ -Wno-write-strings'

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
alias rmorig='find . -name '"'"'*.orig'"'"' -delete'

source ~/.git-prompt.sh
RPROMPT="[%{$fg_no_bold[yellow]%}%?%{$reset_color%}]"
setopt PROMPT_SUBST
export GIT_PS1_SHOWSTASHSTATE="yes"
export GIT_PS1_DESCRIBE_STYLE="contains"
PS1='%{$fg_no_bold[green]%}%5~%{$fg_bold[red]%} $(__git_ps1 "[%s] ")%{$reset_color%}
ƒ ' >>~/.zshrc
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR=vim
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/$USER/.sdkman"
[[ -s "/home/$USER/.sdkman/bin/sdkman-init.sh" ]] && source "/home/$USER/.sdkman/bin/sdkman-init.sh"

#brew
export PATH=/opt/homebrew/bin:/Library/Frameworks/Python.framework/Versions/3.10/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
alias brew-update='brew update && brew upgrade && brew cleanup'

export PATH="/usr/local/texlive/2025/bin/universal-darwin:$PATH"
