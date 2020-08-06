alias ff="find . -name "
alias rs="rsync -a --info=progress2 "
alias ytm="youtube-dl -f 251 "

alias v="$VISUAL"

# Colorize output, add file type indicator, and put sizes in human readable format
alias ls='ls -aGFh --color=always'
# Same as above, but in long listing format
alias ll='ls -aGFhl --color=always'
# List only directories
alias ld="ls -lF ${colorflag} | grep --color=never '^d'"
# List only files
alias lf="ls -lF ${colorflag} | grep --color=never -v '^d'"

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Get week number
alias week='date +%V'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# alias f. plugin copydir + copyfile
alias cpd='copydir '
alias cpf='copyfile '
