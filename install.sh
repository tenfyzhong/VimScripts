#!/bin/sh

# 克隆vundle版本库
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

ln -s ~/.vim/.vimrc ~/.vimrc

# 运行BundleInstall加载插件
vim -c BundleInstall
