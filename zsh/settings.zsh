# Only load Liquid Prompt in interactive shells, not from a script or from scp
if [[ ! -d ${HOME}/.config/liquidprompt ]]; then
    git -C ${HOME}/.config clone https://github.com/nojhan/liquidprompt.git
fi
if [[ ! -e ${HOME}/.config/liquidpromptrc ]]; then
    ln -s ${PATH_TO_DOTFILES_REPO}/zsh/liquidpromptrc ${HOME}/.config/liquidpromptrc
fi
[[ $- = *i* ]] && source ${HOME}/.config/liquidprompt/liquidprompt

export EDITOR="nvim"
export VISUAL=$EDITOR

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep notify
bindkey -e

# The following lines were added by compinstall
zstyle :compinstall filename "${HOME}/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall
