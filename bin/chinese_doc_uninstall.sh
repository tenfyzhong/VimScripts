#!/bin/bash - 
#===============================================================================
#
#          FILE: chinese_doc.sh
# 
#         USAGE: ./chinese_doc.sh 
# 
#   DESCRIPTION: 制裁中文文档
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: tenfyzhong (tenfy), 364755805@qq.com
#  ORGANIZATION: 
#       CREATED: 2014年06月27日 11:15
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

cd ~/.vim
if ! [ -d ~/.vim/vimcdoc-1.9.0 ]; then
    wget http://cznic.dl.sourceforge.net/project/vimcdoc/vimcdoc/vimcdoc-1.9.0.tar.gz
    tar -zxf vimcdoc-1.9.0.tar.gz 
    rm -rf vimcdoc-1.9.0.tar.gz
fi

cd vimcdoc-1.9.0
sudo ./vimcdoc.sh -u > /dev/null 2>&1
