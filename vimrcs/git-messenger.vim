"==============================================================
"    file: git-messenger.vim
"   brief: 查看当前行的提交历史
"
"  command: 
"          GitMessenger 查看提交记录
"          GitMessengerClose 关闭查看窗口
"
"    nmap: <leader>gm GitMessenger
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2019-03-14 13:05:53
"==============================================================
Plug 'rhysd/git-messenger.vim'

let g:git_messenger_close_on_cursor_moved = v:true
