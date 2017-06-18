#!/bin/bash -
#################################################################
#
#    file: nvim.sh
#   usage: ./nvim.sh
#   brief:  
#  author: tenfyzhong
#   email: tenfyzhong@qq.com
# created: 2017-06-18 11:35:44
#
#################################################################

set -o nounset                              # Treat unset variables as an error


mkdir -p ~/.config/nvim
ln -sf ~/.vim/vimrc ~/.config/nvim/init.vim
