#!/bin/bash
set -eu
cd "$(dirname "$0")"
git submodule update --init
pushd $HOME
ln -nsfv .vim/vimrc .vimrc
ln -nsfv .vim/gvimrc .gvimrc
popd
