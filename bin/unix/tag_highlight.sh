#!/bin/bash - 
#===============================================================================
#
#          FILE: tag_highlight.sh
# 
#         USAGE: ./tag_highlight.sh 
# 
#   DESCRIPTION: 生成TagHighlight的tag文件
# 
#       OPTIONS: [path]
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: tenfyzhong (tenfy), 
#  ORGANIZATION: 
#       CREATED: 2016年04月14日 23:18
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

path=$(pwd)
old_path=$path

if [ $# -gt 0 ] && [ -d $1 ]; then
    path=$1
fi

cd $path
vim -c UpdateTypesFile -c qa
cd $old_path
