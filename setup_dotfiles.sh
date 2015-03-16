#!/bin/bash

DOTFILE_DIR=$1

rm -rf ~/.vim
for DOTFILE in .*; do
	ln -f -s $DOTFILE_DIR/$DOTFILE ~/
done

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

OLD_WD=`pwd`
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
cd $OLD_WD
