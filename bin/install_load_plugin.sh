#!/bin/bash

# 运行BundleInstall加载插件
echo "加载插件"
vim -c BundleClean -c BundleInstall -c qa!

