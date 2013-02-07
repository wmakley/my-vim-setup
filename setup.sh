#!/bin/bash
set -eu
git submodule update --init
cd bundle/command-t
rake make
pushd $HOME
ln -sfv .vim/vimrc .vimrc 
ln -sfv .vim/gvimrc .gvimrc
popd
