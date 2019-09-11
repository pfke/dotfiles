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

# bindkey
bindkey "^[u"   undo                        # undo last dingens

# ctrl+<- | ctrl+->
bindkey "^[[1;5D"   backward-word           # <C-<>
bindkey "^[[1;5C"   forward-word            # <C->>

bindkey "^[[3~"     delete-char             # <Del>
bindkey "^[[3;5~"   delete-word             # <C-Del>
bindkey "^?"        backward-delete-char    # <Back>
bindkey "^H"        backward-delete-word    # <C-Back>

bindkey "^[[H"      beginning-of-line       # home
bindkey "^[[F"      end-of-line             # end

# The following lines were added by compinstall
zstyle :compinstall filename "${HOME}/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall
kitty + complete setup zsh | source /dev/stdin

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

