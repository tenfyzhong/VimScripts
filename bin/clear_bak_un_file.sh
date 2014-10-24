#!/bin/bash - 
#===============================================================================
#
#          FILE: clear_bak_un_file.sh
# 
#         USAGE: ./clear_bak_un_file.sh 
# 
#   DESCRIPTION: 定期删除backupdir和undodir的文件
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: tenfyzhong (tenfy), 364755805@qq.com
#  ORGANIZATION: 
#       CREATED: 2014年06月27日 00:52
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

find ~/.vim/.backupfile -mtime +10 -name "*~" -exec rm -rf {} \;
find ~/.vim/.undofile -mtime +10 -name "%*" -exec rm -rf {} \;
