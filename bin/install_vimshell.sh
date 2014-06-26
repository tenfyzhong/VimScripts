#!/bin/bash

cd ~/.vim/bundle/vimproc.vim
declare -u os
os=`uname -o`
if [ "$os" == "CYGWIN" ]; then
    make -f make_cygwin.mak
else
    make
fi

