"==============================================================
"    file: vim-do.vimrc
"   brief: 异步执行shell脚本后将结果返回到一个新buffer中
"
" command: Do <command> 在后台执行command
"          DoQuietly <command> 在后台执行command，不打开输出窗口
"          Doing 显示所有的进程，包括运行中的和结束的
"          Done alias for Doing
"          '<,'>DoThis 执行选择中的command
"          DoAgain 重跑上一次的命令
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-17 10:29:31
"==============================================================
PluginAdd 'WolfgangMehner/vim-do'
