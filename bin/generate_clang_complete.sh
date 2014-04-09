#!/bin/bash

if [ -f ./.clang_complete ]; then
	sed -e '/##Generate begin/,/##WARN请/d' ./.clang_complete >> .clang_complete.tmp
fi

echo "##Generate begin##" > .clang_complete

# 定义DEBUG的宏
echo "-DDEBUG" >> .clang_complete

# 引入gcc的所有include路径
echo | g++ -v -x c++ -E - 2>&1 | \
sed -e '1,/#include </d' | \
sed -n '/^ .*\/include/p' | \
sed -e 's/^ /-I/' >> .clang_complete

echo "##Generate end##" >> .clang_complete
echo "" >> .clang_complete
echo "##WARN请勿修改本行及以上的任何内容，可在下面定义你的宏和头文件查找路径##" >> .clang_complete

if [ -f ./.clang_complete.tmp ]; then
	cat .clang_complete.tmp >> .clang_complete
	rm .clang_complete.tmp
fi
