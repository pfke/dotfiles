# Only load Liquid Prompt in interactive shells, not from a script or from scp
if [[ ! -d ~/.config/liquidprompt  ]]; then
    git -C ~/.config clone https://github.com/nojhan/liquidprompt.git
fi
[[ $- = *i* ]] && source ~/.config/liquidprompt/liquidprompt

export EDITOR="nvim"
export VISUAL=$EDITOR

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep notify
bindkey -e

