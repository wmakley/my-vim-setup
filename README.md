# To install read-only:

    $ cd ~
    $ git clone git://github.com/wmakley/my-vim-setup.git .vim
    $ cd .vim
    $ git submodule init
    $ git submodule update
    $ cd bundle/command-t
    $ rake make
    $ cd ~
    $ ln -sv .vimrc .vim/vimrc
    $ ln -sv .gvimrc .vim/gvimrc
