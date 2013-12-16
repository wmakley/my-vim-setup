#!/bin/bash
set -eu
cd "$(dirname "$0")"
git submodule update --init
# remove defunct submodules
[ -d bundle/command-t ] && rm -rfv bundle/command-t
[ -d bundle/snipmate-snippets ] && rm -rfv bundle/snipmate-snippets
pushd $HOME
ln -nsfv .vim/vimrc .vimrc
ln -nsfv .vim/gvimrc .gvimrc
popd
