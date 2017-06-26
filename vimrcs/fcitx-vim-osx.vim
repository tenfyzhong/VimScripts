"==============================================================
"    file: fcitx-vim-osx.vim
"   brief: normal模式时退出中文输入法
"          依赖fcitx-remote-for-osx
" VIM Version: 8.0
"  author: zhongtenghui
"   email: zhongtenghui@gf.com.cn
" created: 2017-06-23 11:14:47
"==============================================================
if !has('macunix')
    finish
endif

PluginAdd 'CodeFalling/fcitx-vim-osx'
