#!/bin/bash

DOTFILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s -f $DOTFILE_DIR/.gitconfig ~/
ln -s -f $DOTFILE_DIR/.gitignore_global ~/

mkdir -p ~/.ssh/tmp
ln -s -f $DOTFILE_DIR/.ssh/config ~/.ssh/config

# Powerline
git submodule init
git submodule update
$DOTFILE_DIR/submodules/fonts/install.sh
fc-cache -vf ~/.fonts/

ln -s -f $DOTFILE_DIR/.terminalrc ~/.config/xfce4/terminal/terminalrc
ln -s -f $DOTFILE_DIR/.tmux.conf ~/
ln -s -f $DOTFILE_DIR/.zshrc ~/
ln -s -f $DOTFILE_DIR/.xsession ~/

mkdir -p ~/.vim/ftplugin
ln -s -f $DOTFILE_DIR/.vim/ftplugin/* ~/.vim/ftplugin
ln -s -f $DOTFILE_DIR/.vimrc ~/

ln -s -f $DOTFILE_DIR/.ycm_extra_conf.py ~/

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

OLD_WD=`pwd`
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
cd $OLD_WD
