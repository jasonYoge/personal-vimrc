#!/bin/sh

set -e

base_path=$(cd `dirname $0`;pwd)
dist_path="~/.vimrc"
temp_dist_path="~/.vimrc-temp"

echo "Installing vim-plug: \n"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing fzf: \n"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "Installing silver search: \n"
brew install the_silver_searcher

if [-f dist_path]; then
    mv $dist_path $temp_dist_path
    mv $base_path/.vimrc $dist_path
else
    mv $base_path/.vimrc $dist_path
fi
