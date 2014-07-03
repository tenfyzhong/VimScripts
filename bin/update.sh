#!/bin/bash 
#===============================================================================
#
#          FILE: update.sh
# 
#         USAGE: ./update.sh 
# 
#   DESCRIPTION: 用于更新各插件
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2014/07/ 3 星期四 17:23
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

VUNDLE=~/.vim/bundle/vundle
if ! [ -e $VUNDLE/.git ]; then
    echo "不存在vundle，请先运行install"
    exit 1
fi

cd $VUNDLE
git pull
vim -c BundleClean -c BundleUpdate -c qa!
