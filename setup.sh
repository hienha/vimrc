#!/bin/bash


# check directory
[ -d ~/.vim/bundle ] || mkdir -p ~/.vim/bundle

# clone vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# back vimrc file
mv ~/.vimrc ~/.vimrc.origin
cp ./vimrc ~/.vim/vimrc
ln ~/.vimrc ~/.vim/vimrc

# install third packages

[ -f ./requirements.txt ] && pip install -r ./requirements.txt

# install plugin
vim +PluginInstall +qall

echo "dont forget to install / update YoucompleteMe"
echo "https://github.com/j1z0/dotfiles.git"
