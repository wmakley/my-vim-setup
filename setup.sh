#!/bin/bash
set -eu
git submodule init && git submodule update
cd bundle/command-t
rake make
pushd $HOME
ln -sfv .vim/vimrc .vimrc 
ln -sfv .vim/gvimrc .gvimrc
popd
