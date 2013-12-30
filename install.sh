#!/bin/sh

# 克隆vundle版本库
if ! [ -e ~/.vim/bundle/vundle/.git ]; then
	if [ -e ~/.vim/bundle/vundle ]; then
		rm -rf ~/.vim/bundle/vundle
	fi

	echo "克隆vundle"
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle 
fi

if  ! [ -L ~/.vimrc ] || ! [ ~/.vimrc -ef ~/.vim/.vimrc ] ; then
	echo "创建.vimrc"
	rm -rf ~/.vimrc
	ln -s ~/.vim/.vimrc ~/.vimrc
fi

GenerateClangComplete=~/.vim/bin/generate_clang_complete.sh
if [ -f $GenerateClangComplete ]; then
	if ! [ -x $GenerateClangComplete ]; then
		echo "为generate_clang_complete.sh添加执行权限"
		chmod +x $GenerateClangComplete 
	fi
fi

echo "加载插件"
# 运行BundleInstall加载插件
vim -c BundleInstall -c qa!
