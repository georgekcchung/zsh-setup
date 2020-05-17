#!/bin/bash

if [ ! -f /usr/bin/git ]
then
    echo "cannot find git, please install git before running this script"
    exit 1
fi

if [ ! -f /usr/bin/curl ]
then
    echo "cannot find curl, please install curl before running this script"
    exit 1
fi

if [ ! -f /usr/bin/mkdir ] && [ ! -f /bin/mkdir ]
then
    echo "cannot find mkdir, please install mkdir before running this script"
    exit 1
fi

if [ ! -f /usr/bin/zsh ] && [ ! -f /bin/zsh ]
then
    echo "cannot find zsh, please install zsh before running this script"
    exit 1
fi

if [ ! -f /usr/bin/fc-cache ]
then
    echo "cannot find fc-cache, please install fc-cache before running this script"
    exit 1
fi

echo "Installing oh-myz-zsh..."
sh ./ohmyzsh-install.sh
echo "done installing oh-my-zsh"
cp -f ./zshrc ~/.zshrc

echo 
echo "installing powerlevel9k theme..."
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
echo "done installing powerlevel9k theme..."

echo
echo "installing powerlines fonts..."
mkdir -p ~/.local/share/fonts/
cd ~/.local/share/fonts/
curl -fsSL https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf -o ~/.local/share/fonts/PowerlineSymbols.otf
fc-cache -vf ~/.local/share/fonts/
mkdir -p ~/.config/fontconfig/conf.d/
cd ~/.config/fontconfig/conf.d/
curl -fsSL https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf -o ~/.config/fontconfig/conf.d/10-powerline-symbols.conf 
echo "done installing powerlines fonts"
cd ~

echo
echo "installing zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
echo "done installing zsh-autosuggestions"
echo

echo
echo "installing zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
echo "done installing zsh-syntax-highlighting..."
echo

echo
echo "installing zsh-history-substring-search..."
git clone https://github.com/zsh-users/zsh-history-substring-search ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search
echo "done installing zsh-history-substring-search"
echo

exec zsh -l
