#!/bin/sh

SCRIPTS=''

# 克隆vundle版本库
SCRIPTS=~/.vim/bin/install_clone_vundle.sh
[[ -f $SCRIPTS ]] && sh $SCRIPTS

# 链接.vimrc
SCRIPTS=~/.vim/bin/install_vimrc.sh
[[ -f $SCRIPTS ]] && sh $SCRIPTS

# 给generate_clang_complete.sh加执行权限
SCRIPTS=~/.vim/bin/install_generate_clang_complete.sh
[[ -f $SCRIPTS ]] && sh $SCRIPTS

# 运行BundleInstall加载插件
SCRIPTS=~/.vim/bin/install_load_plugin.sh
[[ -f $SCRIPTS ]] && sh $SCRIPTS

# 加载模板
SCRIPTS=~/.vim/bin/install_csupport_templates.sh
[[ -f $SCRIPTS ]] && sh $SCRIPTS

# 安装ywvim码表
SCRIPTS=~/.vim/bin/install_ywvim_codetable.sh
[[ -f $SCRIPTS ]] && sh $SCRIPTS
