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
zplugin snippet OMZ::lib/git.zsh

# Some OMZ themes use this plugin. It provides many aliases – atload'' shows how to disable some of them (to use program rgburke/grv).
zplugin ice wait atload"unalias grv" lucid
zplugin snippet OMZ::plugins/git/git.plugin.zsh

# some plugins
zplugin ice wait lucid
zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin snippet OMZ::plugins/git-extras/git-extras.plugin.zsh
zplugin snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

# Load Docker completion.
zplugin ice wait as"completion" lucid
zplugin snippet OMZ::plugins/docker/_docker

# Normal plugin (syntax-highlighting, at the end, like it is suggested by the plugin's README).
zplugin ice wait atinit"zpcompinit" lucid
zplugin light zdharma/fast-syntax-highlighting

