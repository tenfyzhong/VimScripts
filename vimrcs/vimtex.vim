"==============================================================
"    file: vimtex.vim
"   brief: 
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2019-07-29 11:08:19
" depends: brew install tectonic
"==============================================================
PluginAdd 'lervag/vimtex'

let g:vimtex_view_method = 'skim'
let g:tex_flavor = 'latex'
let g:vimtex_compiler_method = 'tectonic'
let g:vimtex_view_automatic = 1

if empty(v:servername) && exists('*remote_startserver') && has('clientserver')
  call remote_startserver('VIM')
endif
