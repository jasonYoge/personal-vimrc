#!/bin/sh

set -e

echo "Installing vim-plug: \n"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing fzf: \n"

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "Installing silver search: \n"

brew install the_silver_searcher
