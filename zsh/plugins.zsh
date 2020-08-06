## examples 
# zinit snippet 'https://github.com/robbyrussell/oh-my-zsh/raw/master/plugins/git/git.plugin.zsh'
# zinit snippet 'https://github.com/sorin-ionescu/prezto/blob/master/modules/helper/init.zsh'
# zinit snippet OMZ::plugins/git/git.plugin.zsh
# zinit snippet PZT::modules/helper/init.zsh

## theme
# Most themes use this option.
setopt promptsubst

# install helper
zinit ice wait lucid
zinit snippet PZT::modules/helper/init.zsh

zinit ice wait lucid
zinit snippet OMZ::lib/clipboard.zsh
zinit snippet OMZ::lib/functions.zsh
zinit snippet OMZ::lib/git.zsh

# some plugins
zinit ice wait lucid
# add colors to manpages
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
# cat w/ syntax highlight support (install python-pygments, pygmentize)
zinit snippet OMZ::plugins/colorize/colorize.plugin.zsh
# suggests package name with relevant command
zinit snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh
# reformats completion http://github.com/mbrubeck/compleat (example: top <tab> <tab> ...)
zinit snippet OMZ::plugins/compleat/compleat.plugin.zsh
# copy dir name to clipboard
zinit snippet OMZ::plugins/copydir/copydir.plugin.zsh
# copy file content to clipboard
zinit snippet OMZ::plugins/copyfile/copyfile.plugin.zsh
# rsync aliases
zinit snippet OMZ::plugins/rsync/rsync.plugin.zsh
# screen enhancements
zinit snippet OMZ::plugins/screen/screen.plugin.zsh
# autocompletion for taskwarrior
zinit snippet OMZ::plugins/taskwarrior/taskwarrior.plugin.zsh
# google from CLI
zinit snippet OMZ::plugins/web-search/web-search.plugin.zsh

zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/git-extras/git-extras.plugin.zsh

# Abkürzungen f. zsh
zinit light olets/zsh-abbr
abbr import-aliases --quiet

# Normal plugin (syntax-highlighting, at the end, like it is suggested by the plugin's README).
zinit ice wait atinit"zpcompinit" lucid
zinit light zdharma/fast-syntax-highlighting

zinit light ytet5uy4/fzf-widgets
  # Map widgets to key
  bindkey '^[w' fzf-select-widget
  bindkey '^[e' fzf-edit-files
  bindkey '^[k' fzf-kill-processes
  bindkey '^[v' fzf-change-recent-directory
  bindkey '^[f' fzf-insert-files
  bindkey '^[d' fzf-insert-directory
  # Enable Exact-match by fzf-insert-history
  FZF_WIDGET_OPTS[insert-history]='--exact'
  # Start fzf in a tmux pane
  FZF_WIDGET_TMUX=1

zinit light zsh-users/zsh-history-substring-search
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down

