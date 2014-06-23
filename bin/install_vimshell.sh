#!/bin/bash

cd ~/.vim/bundle/vimproc.vim
make

BASEVIMSHRC=~/.vim/resource/vimshrc
VIMSHRC=~/.vimshrc
if ! [ -L $VIMSHRC ] || ! [ $VIMSHRC -ef $BASEVIMSHRC ] ; then
    echo "创建.vimshrc"
    rm -f $VIMSHRC
    ln -s $BASEVIMSHRC $VIMSHRC
fi
