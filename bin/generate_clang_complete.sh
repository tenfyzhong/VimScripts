#!/bin/sh
# 定义DEBUG的宏
echo "-DDEBUG" > .clang_complete

# 引入gcc的所有include路径
echo | g++ -v -x c++ -E - 2>&1 | \
sed -e '1,/#include </d' | \
sed -n '/^ \/usr/p' | \
sed -e 's/^ /-I/' >> .clang_complete
