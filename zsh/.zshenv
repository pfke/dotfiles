# path to our zsh configs
ZDOTDIR="${${(%):-%x}:P:h}"
#        ${            :h}   Remove trailing pathname component (man zshexpn)
#        ${          :P  }   Get realpath (man zshexpn)
#          ${(%):-  }        Enable prompt expansion (man zshexpn zshmisc)
#          ${     %x}        Name of file containing this line (man zshmisc)

LC_ALL=de_DE.UTF-8
LC_MESSAGES=POSIX

PAGER=less

VISUAL=nvim
EDITOR="$VISUAL"

TERM="xterm-256color"

LESS_TERMCAP_md=$'\e[1;36m'
LESS_TERMCAP_me=$'\e[0m'
LESS_TERMCAP_se=$'\e[0m'
LESS_TERMCAP_so=$'\e[1;33m'
LESS_TERMCAP_ue=$'\e[0m'
LESS_TERMCAP_us=$'\e[1;4;31m'

RANGER_LOAD_DEFAULT_RC=FALSE

MAKE_J_OPTION=$(nproc)
MAKEFLAGS='-j $MAKE_J_OPTION'

eval $(systemctl --user show-environment | grep SSH_AUTH_SOCK)
export SSH_AUTH_SOCK

XKB_DEFAULT_LAYOUT=de
XKB_DEFAULT_MODEL=pc105
XKB_DEFAULT_VARIANT=nodeadkeys
WLC_REPEAT_DELAY=220
WLC_REPEAT_RATE=25

_JAVA_AWT_WM_NONREPARENTING=1

# settings for colorize plugin
ZSH_COLORIZE_TOOL=pygmentize
ZSH_COLORIZE_STYLE="native"
