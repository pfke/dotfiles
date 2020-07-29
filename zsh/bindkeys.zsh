#bindkey "^R"      history-incremental-search-backward  # ctrl-r
#bindkey "[B"      history-search-forward               # down arrow
#bindkey "[A"      history-search-backward              # up arrow
#
#bindkey "^DELETE"      kill-whole-line                      # ctrl-d
#bindkey "^x"      delete-char                          # ctrl-d
#
#bindkey "^J"      beginning-of-line                    # ctrl-j
#bindkey "^K"      end-of-line                          # ctrl-k
#bindkey "^h"      forward-char                         # ctrl-f
#bindkey "^l"      backward-char                        # ctrl-b
bindkey -e   # Default to standard emacs bindings, regardless of editor string
