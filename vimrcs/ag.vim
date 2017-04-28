"==============================================================
"    file: ag.vim.vimrc
"   brief: 使用ag命令来查找字符串或者文件
"
" command: :Ag[!] [options] {pattern} [{directory}] 在directory下去查找pattern
"          :AgBuffer[!] [option] {pattern} 在打开的buffers下去查找pattern
"          :AgAdd[!] [option] {pattern} [{directory}] 类似Ag,但是会将查找结果拼接在之前的结果之后
"          :AgHelp[!] [options] {pattern} 在vim documentation中查找pattern
"          以上四个命令如果在Ag前加L,则使用location-list替换quickfix
"          :AgFile [options] {pattern} [{directory}] 在目录下去查找文件名匹配pattern的文件
"
" buffer nmap:
"           e open file and close the quickfix window.
"           o open file (same as enter).
"           go preview file (open but maintain focus on ag.vim results).
"           t open in a new tab.
"           T open in new tab silently.
"           h open in horizontal split.
"           H open in horizontal split silently.
"           v open in vertical split.
"           gv open in vertical split silently.
"           q close the quickfix window.
"
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfyzhong@qq.com
" created: 2016-04-13 13:37:23
"==============================================================
PluginAdd 'tenfyzhong/ag.vim'

let g:ag_highlight = 1
