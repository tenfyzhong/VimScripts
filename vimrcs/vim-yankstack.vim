"==============================================================
"    file: vim-yankstack.vim
"   brief: yank栈
"
"  
" command: Yanks 显示当前的yank栈
"
"    nmap: <m-p> 选择更旧的进行paste
"          <m-n> 选择更新的进行paste
"    xmap: <m-p> 选择更旧的进行paste
"          <m-n> 选择更新的进行paste
"    imap: <m-p> 选择更旧的进行paste
"          <m-n> 选择更新的进行paste
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfyzhong@qq.com
" created: 2017-04-04 17:35:55
"==============================================================
PluginAdd 'tenfyzhong/vim-yankstack'

let g:yankstack_map_keys = 0
nmap <m-p> <Plug>yankstack_substitute_older_paste
xmap <m-p> <Plug>yankstack_substitute_older_paste
imap <m-p> <Plug>yankstack_substitute_older_paste
nmap <m-n> <Plug>yankstack_substitute_newer_paste
xmap <m-n> <Plug>yankstack_substitute_newer_paste
imap <m-n> <Plug>yankstack_substitute_newer_paste
