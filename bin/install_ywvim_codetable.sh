#!/bin/bash

YWVIMROOT=~/.vim/bundle/ywvim
BASEYWVIMMAP=~/.vim/templates/ywvim
TARGETYWVIMMAP=$YWVIMROOT/keymap/ywvim
if [ -d $YWVIMROOT ]; then
	if [ -d $BASEYWVIMMAP ]; then
		if ! [ -L $TARGETYWVIMMAP ] || ! [ $BASEYWVIMMAP -ef $TARGETYWVIMMAP ]; then
			rm -rf $TARGETYWVIMMAP
			echo "注册ywvim码表"
			ln -s $BASEYWVIMMAP $TARGETYWVIMMAP
		fi
	fi
fi
