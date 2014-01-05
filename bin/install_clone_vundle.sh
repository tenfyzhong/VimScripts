#!/bin/sh

# 克隆vundle版本库
if ! [ -e ~/.vim/bundle/vundle/.git ]; then
	if [ -e ~/.vim/bundle/vundle ]; then
		rm -rf ~/.vim/bundle/vundle
	fi

	echo "克隆vundle"
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle 

else
	cd ~/.vim/bundle/vundle/
	echo "拉回vundle"
	git pull
	cd -
fi

