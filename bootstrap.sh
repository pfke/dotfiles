# !/bin/sh

# i3 zeuch
if [[ ! -d ${HOME}/.config/i3 ]]; then
    mkdir -p ${HOME}/.config/i3
elif [[ -e ${HOME}/.config/i3/config ]]; then 
    mv ${HOME}/.config/i3/config ${HOME}/.config/i3/config.save
fi
cp $(pwd)/i3/i3.config ${HOME}/.config/i3/config

# zsh zeuch
mv ${HOME}/.zshrc ${HOME}/.zshrc.save
ln -s $(pwd)/zsh/zshrc.config ${HOME}/.zshrc

