"==============================================================
"    file: vim-yankstack.vim
"   brief: yank栈
"
"  
" command: Yanks 显示当前的yank栈
"
"    nmap: <leader>p 选择更旧的进行paste
"          <leader>P 选择更新的进行paste
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfyzhong@qq.com
" created: 2017-04-04 17:35:55
"==============================================================
PluginAdd 'tenfyzhong/vim-yankstack'

nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
