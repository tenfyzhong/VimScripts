#!/bin/bash - 
#===============================================================================
#
#          FILE: build_ycm.sh
# 
#         USAGE: ./build_ycm.sh [path] [path]
# 
#   DESCRIPTION: 查找目录下的.h文件，将它导入对应的ycm配置中
# 
#       OPTIONS: 要构建的路径
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: tenfy
#  ORGANIZATION: 
#       CREATED: 2014年11月09日 18:49
#      REVISION:  1.1
#===============================================================================

set -o nounset                              # Treat unset variables as an error

if [ $# -lt 1 ]; then
    echo "用法: build_ycm [path] [path]"
    exit 1
fi

cwd=`pwd`

cp ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py $cwd

sed -i "s/final_flags\.remove.*stdlib=libc.*/pass/" $cwd/.ycm_extra_conf.py
sed -i "/'-fexceptions',/a '-Wno-unused-parameter'," $cwd/.ycm_extra_conf.py

for c in "$@"; do
    dir=$(readlink -f $c)
    if [ ! -d $dir ]; then
        echo "$dir is not a valid path"
        continue;
    fi

    INCFILES=$(find $dir -name "*.h" | tr "\n" " ")

    if [ "$INCFILES" ]; then
        INCLUDE=$(echo $INCFILES | xargs -n1 dirname | sort | uniq)
        for item in ${INCLUDE[@]}; do
            sed -i "/'\.\/ClangCompleter',/a '-I',\n'$item'," $cwd/.ycm_extra_conf.py
            echo "building [$item]"
        done
    fi
done

echo -e "\033[32;49;1m build .ycm_extra_conf.py on path [$cwd] success\033[0m"
