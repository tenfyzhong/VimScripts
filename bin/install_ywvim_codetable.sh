#!/bin/sh

if [ -d ~/.vim/bundle/ywvim ]; then
	if [ -d ~/.vim/templates/ywvim ]; then
		if ! [ -L ~/.vim/bundle/ywvim/keymap/ywvim ] || ! [ ~/.vim/templates/ywvim -ef ~/.vim/bundle/ywvim/keymap/ywvim ]; then
			rm -rf ~/.vim/bundle/ywvim/keymap/ywvim
			echo "注册ywvim码表"
			ln -s ~/.vim/templates/ywvim ~/.vim/bundle/ywvim/keymap/ywvim
		fi
	fi
fi
