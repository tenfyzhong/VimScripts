"==============================================================
"    file: ultisnips.vimrc
"   brief: 提供snippet
"
" command: UltiSnipsEdit[!] 为当前filetype打开一个snippet编辑窗口
"          UltiSnipsAddFileTypes 合并其他文件类型的snippet
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-15 12:52:50
"==============================================================
if !has('python') 
    finish
endif

PluginAdd 'SirVer/ultisnips'
PluginAdd 'honza/vim-snippets'

let g:UltiSnipsEditSplit            = "horizontal"
let g:UltiSnipsExpandTrigger        = "<tab>"
let g:UltiSnipsJumpForwardTrigger   = "<tab>"
let g:UltiSnipsJumpBackwardTrigger  = "<s-tab>"

