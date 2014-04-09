#!/bin/bash

# create .vimrc
BASEVIMRC=~/.vim/.vimrc
VIMRC=~/.vimrc
if  ! [ -L $VIMRC ] || ! [ $VIMRC -ef $BASEVIMRC ] ; then
	echo "创建.vimrc"
	rm -f $VIMRC
	ln -s $BASEVIMRC $VIMRC
fi
