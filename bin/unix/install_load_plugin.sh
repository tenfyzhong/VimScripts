#!/bin/bash

# 运行BundleInstall加载插件
echo "加载插件"
# 加载插件时不进行任何警告
export NOVIMWARNING=1
vim -c BundleClean -c BundleInstall -c qa!

