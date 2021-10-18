"==============================================================
"    file: vimproc.vim
"   brief: 异常执行库
"
" command: VimProcBang {path} 执行path命令然后echo结果,这是同步的
"          VimProcRead {path} 执行path命令然后将结果粘贴到当前的buffer
"          VimProcInstall {args} build
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-16 10:57:31
"==============================================================
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
