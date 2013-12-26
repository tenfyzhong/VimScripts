#!/bin/sh

# 克隆vundle版本库
echo "克隆vundle"
if [ -e ~/.vim/bundle/vundle ]; then
	rm -rf ~/.vim/bundle/vundle
fi
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle > /dev/null

echo "创建.vimrc"
if [ -e ~/.vimrc ]; then
	rm -rf ~/.vimrc
fi
ln -s ~/.vim/.vimrc ~/.vimrc

GenerateClangComplete=~/.vim/bin/generate_clang_complete.sh
if [ -f $GenerateClangComplete ]; then
	if ! [ -x $GenerateClangComplete ]; then
		chmod +x $GenerateClangComplete 
	fi
fi

echo "加载插件"
# 运行BundleInstall加载插件
vim -c BundleInstall
