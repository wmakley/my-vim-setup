#!/bin/bash
set -eu
cd "$(dirname "$0")"

# check out plugins
git submodule update --init

# remove defunct plugins
[ -d bundle/command-t ] && rm -rfv bundle/command-t
[ -d bundle/snipmate-snippets ] && rm -rfv bundle/snipmate-snippets

# sym link rc files
ln -nsfv .vim/vimrc $HOME/.vimrc
ln -nsfv .vim/gvimrc $HOME/.gvimrc
