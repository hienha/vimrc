#!/bin/bash


# check directory
[ -d ~/.vim/bundle ] || mkdir -p ~/.vim/bundle

# clone vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# back vimrc file
[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.origin
cp ./vimrc ~/.vim/vimrc
ln ~/.vimrc ~/.vim/vimrc

# py head file check
home="$(cd ~; pwd)"
header_temp="${home}/.vim/vim_template/vim_header_for_python"
par_dir=$(dirname ${header_temp})
[ -d ${par_dir} ] || mkdir -p ${par_dir}
temp_file=${par_dir}/vim_header_for_python

cat << EOF > %temp_file

EOF

# install third packages
[ -f ./requirements.txt ] && pip install -r ./requirements.txt

# install plugin
vim +PluginInstall +qall

echo "dont forget to install / update YoucompleteMe"
echo "https://github.com/j1z0/dotfiles.git"
