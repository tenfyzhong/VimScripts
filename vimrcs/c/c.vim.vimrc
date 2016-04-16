"==============================================================
"    file: c.vim.vimrc
"   brief: help文件是csupport
"
"    nmap:
"    \rc       save and compile                    (n,i)
"    \rl       link                                (n,i)
"    \rr       run                                 (n,i)
"    \ra       set comand line arguments           (n,i)
"    \rm       run make                            (n,i)
"    \rmc      run 'make clean'                    (n,i)
"    \rcm      choose makefile                     (n,i)
"    \rme      executable to run                   (n,i)
"    \rma      cmd. line arg. for make             (n,i)
"    \rp       run splint                          (n,i)
"    \rpa      cmd. line arg. for splint           (n,i)
"    \rk       run CodeCheck (TM)                  (n,i)
"    \rka      cmd. line arg. for CodeCheck (TM)   (n,i)
"    \rd       run indent                          (n,v,i)
" [n]\rh       hardcopy buffer                     (n,v,i)
"    \rs       show plugin settings                (n,i)
"    \rx       set xterm size                      (n, only Linux/UNIX & GUI)
"    \ro       change output destination           (n,i)
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-16 17:36:59
"==============================================================
PluginAdd 'c.vim'

" 帮助: help csupport
let g:C_GuiSnippetBrowser 	= 'commandline'
let g:C_CFlags 				= '-Wall -g -O0 -c -std=c++0x -Werror'
let g:C_FormatDate 			= '%Y-%m-%d'
let g:C_FormatTime 			= '%H:%M'
let g:C_TypeOfH             = 'cpp'

let g:C_LocalTemplateFile 	= $HOME . '/.vim/resource/csupport/Templates'
let g:C_GlobalTemplateFile  = g:C_LocalTemplateFile
