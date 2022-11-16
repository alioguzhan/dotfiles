# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

# https://github.com/facebook/create-react-app/issues/7251
# export PATH=$PATH:/mnt/c/Windows/System32

#Path to your oh-my-zsh installation.
export ZSH="/home/ali/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# custom completions
fpath+=~/.zfunc

plugins=(git node zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# make sure the lang is utf8
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='vim'
fi

# get rid of user@host in prompt
DEFAULT_USER=$USER

# mimic MacOS
alias open='xdg-open &>/dev/null'

# fnm
# export PATH=/home/ali/.fnm:$PATH
# eval "$(fnm env)"

[ -f "/home/ali/.ghcup/env" ] && source "/home/ali/.ghcup/env" # ghcup-env

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/usr/local/go/bin
export PATH=~/.npm-global/bin:$PATH

alias emacs="emacs -nw"

export REACT_APP_EDITOR=code

#if [ $TILIX_ID ] || [ $VTE_VERSION ]; then # for Tilix Terminal 
#  source /etc/profile.d/vte.sh
#fi

# this is for my secret env variables. do not keep those in this file
# since this is on Github
source ~/.env.local

alias python=python3
alias p="cd ~/projects"
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/ali/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
