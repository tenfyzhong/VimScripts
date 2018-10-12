"==============================================================
"    file: Conque-GDB.vim
"   brief: 在vim中使用gdb
"          vim中使用命令行
"
" command: 启动gdb
"          ConqueGdb
"          ConqueGdb program
"          ConqueGdb -d dir --args program [arguments]
"          ConqueGdbSplit 水平分割出调试窗口
"          ConqueGdbVSplit 垂直分割调试窗口
"          ConqueGdbTab 开一个新tab打开调试窗口
"          ConqueGdbBDelete 删除ConqueGdb打开的buffer
"          ConqueGdbCommand 在非gdb窗口中给gdb发送命令
"          ConqueGdbExe 设置gdb运行程序
"
"          ConqueTerm <command> 在当前窗口运行command
"          ConqueTermSplit 水平分割窗口运行命令
"          ConqueTermVSplit 垂直分割窗口运行命令
"          ConqueTermTab tab窗口运行命令
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2017-05-04 20:34:44
"==============================================================
PluginAdd 'tenfyzhong/Conque-GDB'

let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_TERM = 'xterm'
let g:conque_gdb_enable_mapping = 0
