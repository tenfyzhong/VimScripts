#!/bin/bash - 
#===============================================================================
#
#          FILE: cscope.sh
# 
#         USAGE: ./cscope.sh 
# 
#   DESCRIPTION: 调用cscope来生成cscope.out
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: tenfyzhong (tenfy), 
#  ORGANIZATION: 
#       CREATED: 2016年04月09日 23:12
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

find . -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.cc" -o -name "*.java" -o -name "*.cs" > cscope.files
cscope -bkq -i cscope.files
