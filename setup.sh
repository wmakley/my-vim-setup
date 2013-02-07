#!/bin/bash
set -eu
git submodule update --init
cd bundle/command-t
rake make
pushd $HOME
ln -nsfv .vim/vimrc .vimrc
ln -nsfv .vim/gvimrc .gvimrc
popd
