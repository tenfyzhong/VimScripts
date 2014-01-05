#!/bin/sh

# 克隆vundle版本库
sh ~/.vim/bin/install_clone_vundle.sh

# 链接.vimrc
sh ~/.vim/bin/install_vimrc.sh

# 给generate_clang_complete.sh加执行权限
sh ~/.vim/bin/install_generate_clang_complete.sh

# 运行BundleInstall加载插件
sh ~/.vim/bin/install_load_plugin.sh

# 加载模板
sh ~/.vim/bin/install_csupport_templates.sh
