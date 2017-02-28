"==============================================================
"    file: vimproc.vim.vimrc
"   brief: 异常执行库
"
" command: VimProcBang {path} 执行path命令然后echo结果,这是同步的
"          VimProcRead {path} 执行path命令然后将结果粘贴到当前的buffer
"          VimProcInstall {args} build
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-16 10:57:31
"==============================================================
PluginAdd 'Shougo/vimproc.vim', {'do' : 'make'}
