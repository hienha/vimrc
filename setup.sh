#!/bin/bash

home="$(cd ~; pwd)"

# check directory
[ -d ${home}/.vim/bundle ] || mkdir -p ${home}/.vim/bundle

# clone vundle
vundle_git_repo_dir="${home}/.vim/bundle/Vundle.vim"
[ -d $vundle_git_repo_dir ] || git clone https://github.com/VundleVim/Vundle.vim.git $vundle_git_repo_dir

# back vimrc file
[ -f ~/.vimrc ] && cp ~/.vimrc ~/.vimrc_$(date +%Y%m%d_%H%M%S)
rm -f ~/.vimrc ~/.vim/vimrc
cp vimrc ~/.vim/vimrc && ln -s ~/.vim/vimrc ~/.vimrc

# py head file check
header_temp="${home}/.vim/vim_template/vim_header_for_python"
par_dir=$(dirname ${header_temp})
[ -d ${par_dir} ] || mkdir -p ${par_dir}

python_temp_file="${par_dir}/vim_header_for_python"
cat << EOF > $python_temp_file
#!/usr/bin/python
# -*- coding: utf-8 -*-
#########################################################################
# File Name:
# Author: vincent
# mail: esunward@live.com
# Created Time:
#########################################################################

EOF

sh_temp_file="${par_dir}/vim_header_for_sh"
cat << EOF > $sh_temp_file
#########################################################################
# File Name:
# Author: changfeng
# mail: changfeng@hienha.org
# Created Time:
#########################################################################
#!/bin/bash
EOF


# install third packages
[ -f ./requirements.txt ] && sudo pip install -r ./requirements.txt

# install plugin
vim +PluginInstall +qall

# install YouCompleteMe
echo -e '\033[32;1mCloning repository to locale\033[0m'
git clone git@github.com:hienha/YouCompleteMe ~/.vim/bundle/YouCompleteMe \
    && cd ~/.vim/bundle/YouCompleteMe \
    && ./install.py --all
echo -e '\033[32;1mInstall YouCompleteMe done.\033[0m'

echo "\n\n\033[32;1mdont forget to install / update YoucompleteMe\033[0m"
echo "\033[32;1mhttps://github.com/j1z0/dotfiles.git\033[0m"
