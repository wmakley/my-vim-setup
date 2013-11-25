#!/bin/bash
set -eu
cd $(dirname "$0")
git submodule update --init
cd bundle/command-t/ruby/command-t
/usr/bin/ruby extconf.rb
make
pushd $HOME
ln -nsfv .vim/vimrc .vimrc
ln -nsfv .vim/gvimrc .gvimrc
popd
