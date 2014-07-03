#!/bin/bash

# 克隆vundle版本库
VUNDLE=~/.vim/bundle/vundle
if ! [ -e $VUNDLE/.git ]; then
	if [ -e $VUNDLE ]; then
		rm -rf $VUNDLE
	fi

	echo "克隆vundle"
	git clone https://github.com/gmarik/vundle.git $VUNDLE

# else
# 	cd $VUNDLE
# 	echo "拉回vundle"
# 	git pull
# 	cd -
fi

