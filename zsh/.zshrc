#######################################################################
setopt appendhistory autocd extendedglob nomatch
unsetopt beep notify
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename "${HOME}/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# bootstrap zinit
if [ ! -d $HOME/.zinit ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
fi
source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of zinit installer's chunk

source "${ZDOTDIR}/aliases.zsh"
source "${ZDOTDIR}/bindkeys.zsh"
source "${ZDOTDIR}/history.zsh"

source "${ZDOTDIR}/settings.zsh"
source "${ZDOTDIR}/plugins.zsh"
if [ -e ${HOME}/.zshrc_custom ]; then
    source "${HOME}/.zshrc_custom"
fi

# If running trom tty1 startx
if [ $(tty) = "/dev/tty1" ]; then
    ssh-add

    startx
    exit 0
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### End of Zinit's installer chunk
### End of Zinit's installer chunk
### End of Zinit's installer chunk
### End of Zinit's installer chunk
### End of Zinit's installer chunk
### End of Zinit's installer chunk
### End of Zinit's installer chunk
