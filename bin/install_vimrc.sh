#!/bin/sh

# create .vimrc
if  ! [ -L ~/.vimrc ] || ! [ ~/.vimrc -ef ~/.vim/.vimrc ] ; then
	echo "创建.vimrc"
	rm -rf ~/.vimrc
	ln -s ~/.vim/.vimrc ~/.vimrc
fi
