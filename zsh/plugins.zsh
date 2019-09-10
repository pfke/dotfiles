## examples 
# zplugin snippet 'https://github.com/robbyrussell/oh-my-zsh/raw/master/plugins/git/git.plugin.zsh'
# zplugin snippet 'https://github.com/sorin-ionescu/prezto/blob/master/modules/helper/init.zsh'
# zplugin snippet OMZ::plugins/git/git.plugin.zsh
# zplugin snippet PZT::modules/helper/init.zsh

## theme
# Most themes use this option.
setopt promptsubst

# install helper
zplugin ice wait lucid
zplugin snippet PZT::modules/helper/init.zsh

# OMZ themes use this library.
zplugin ice wait lucid
zplugin snippet OMZ::lib/clipboard.zsh
zplugin snippet OMZ::lib/functions.zsh
zplugin snippet OMZ::lib/git.zsh

# some plugins
zplugin ice wait lucid
# add colors to manpages
zplugin snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
# cat w/ syntax highlight support (install python-pygments, pygmentize)
zplugin snippet OMZ::plugins/colorize/colorize.plugin.zsh
# suggests package name with relevant command
zplugin snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh
# reformats completion http://github.com/mbrubeck/compleat (example: top <tab> <tab> ...)
zplugin snippet OMZ::plugins/compleat/compleat.plugin.zsh
# copy dir name to clipboard
zplugin snippet OMZ::plugins/copydir/copydir.plugin.zsh
# copy file content to clipboard
zplugin snippet OMZ::plugins/copyfile/copyfile.plugin.zsh
# rsync aliases
zplugin snippet OMZ::plugins/rsync/rsync.plugin.zsh
# screen enhancements
zplugin snippet OMZ::plugins/screen/screen.plugin.zsh
# autocompletion for taskwarrior
zplugin snippet OMZ::plugins/taskwarrior/taskwarrior.plugin.zsh
# google from CLI
zplugin snippet OMZ::plugins/web-search/web-search.plugin.zsh

zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin snippet OMZ::plugins/git-extras/git-extras.plugin.zsh

# Load Docker completion.
zplugin ice wait as"completion" lucid
zplugin snippet OMZ::plugins/docker/_docker

# Normal plugin (syntax-highlighting, at the end, like it is suggested by the plugin's README).
zplugin ice wait atinit"zpcompinit" lucid
zplugin light zdharma/fast-syntax-highlighting

zplugin light ytet5uy4/fzf-widgets
  # Map widgets to key
  bindkey '^f^a' fzf-select-widget
  bindkey '^f^e' fzf-edit-files
  bindkey '^f^k' fzf-kill-processes
  bindkey '^f^s' fzf-exec-ssh
  bindkey '^\'   fzf-change-recent-directory
  bindkey '^f^f' fzf-insert-files
  bindkey '^f^g' fzf-insert-directory

zplugin light zsh-users/zsh-history-substring-search
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down

  # Enable Exact-match by fzf-insert-history
  FZF_WIDGET_OPTS[insert-history]='--exact'

  # Start fzf in a tmux pane
  FZF_WIDGET_TMUX=1
