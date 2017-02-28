"==============================================================
"    file: vim-surround.vimrc
"   brief: 操作括号
"
" TARGETS:
"       () b
"       {} B
"       [] r
"       <>
"       '
"       "
"       `
"       w
"       W
"       s
"       p
"
"
"    nmap:  ds 删除surroundings
"           cs 修改surroundings
"           ys 增加surroundings
"           yss 整行增加surroundings
"           yS 换行surroundings
"           ySS 换行surroundings整行
"    vmap:  S 对选中的进行surroundings
"    imap:  <C-G>s
"           <C-S>
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-08-28 12:47:36
"==============================================================
PluginAdd 'tpope/vim-surround'
