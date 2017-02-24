"==============================================================
"    file: vim-session.vimrc
"   brief: 保存加载session
"
" command: SaveSession[!] 保存session,!会直接覆盖同名的session而不提示
"          OpenSession[!] 加载session,!会忽略已经加载的提示
"          RestartVim 保存当前的session,重新打开vim和加载session
"          CloseSession[!] 关闭所有的窗口和buffer,然后打开一个空的buffer,!会忽略所有的未保存修改而不提示
"          DeleteSession[!] 删除session,!会忽略删除当前正打开的session的告警
"          ViewSession[!] 查看session的脚本
"          OpenTabSession 类似于OpenSession，但是只请求当前的tab页
"          SaveTabSession 类似于SaveSession，但是只请求当前的tab页
"          AppendTabSession 打开一个新的tab页，加载给定的scoped session
"          CloseTabSession 类似于CloseSession，但是只请求当前的tab页
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-16 11:10:03
"==============================================================
PluginAdd 'xolox/vim-session'

let g:session_default_overwrite = 0
let g:session_autosave          = 'yes'
let g:session_verbose_messages  = 0
let g:session_default_to_last   = 1
let g:session_command_aliases   = 1
let g:session_menu              = 0
let g:session_lock_enabled      = 0
let g:session_autoload          = 'no'
let g:session_directory         = g:VIMHOME . '.sessions'
