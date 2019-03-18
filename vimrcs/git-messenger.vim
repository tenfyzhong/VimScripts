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
"  author: zhongtenghui
"   email: zhongtenghui@gf.com.cn
" created: 2019-03-14 13:05:53
"==============================================================
PluginAdd 'rhysd/git-messenger.vim'

let g:git_messenger_close_on_cursor_moved = v:false
