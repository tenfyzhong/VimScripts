#!/bin/bash

# 为generate_clang_complete.sh添加执行权限
GenerateClangComplete=~/.vim/bin/generate_clang_complete.sh
if [ -f $GenerateClangComplete ]; then
	if ! [ -x $GenerateClangComplete ]; then
		echo "为generate_clang_complete.sh添加执行权限"
		chmod +x $GenerateClangComplete 
	fi
fi

