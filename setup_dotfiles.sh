#!/bin/bash

DOTFILE_DIR=$1

ln -s -f $DOTFILE_DIR/.gitconfig ~/
ln -s -f $DOTFILE_DIR/.gitignore_global ~/

mkdir -p ~/.ssh
ln -s -f $DOTFILE_DIR/.ssh/config ~/.ssh/config

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
