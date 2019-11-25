"==============================================================
"    file: reftools.vim
"   brief: reftools的工具
"
" command: Fixplurals 去除参数中的多余类型
"          Fillstruct 填充当前行的结构成员
"          Fillswitch 填充当前switch的case
"
"    nmap:
"     <leader>rtp 运行fixplurals
"     <leader>rts 运行fillstruct
"     <leader>rtw 运行fillswitch
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2019-11-15 09:28:09
"==============================================================
PluginAdd 'tenfyzhong/reftools.vim', {'frozen': 1}

augroup reftools_local
  au!
  au FileType go nmap <leader>rtp <Plug>(reftools#fixplurals)
  au FileType go nmap <leader>rts <Plug>(reftools#fillstruct)
  au FileType go nmap <leader>rtw <Plug>(reftools#fillswitch)
augroup end
