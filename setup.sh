#!/bin/bash
set -eu
cd "$(dirname "$0")"

rm -rfv bundle/*
rm -rfv vim-pathogen

# check out plugins
git submodule update --init

# sym link rc files
ln -nsfv .vim/vimrc $HOME/.vimrc
ln -nsfv .vim/gvimrc $HOME/.gvimrc

vim +PluginInstall +qall
