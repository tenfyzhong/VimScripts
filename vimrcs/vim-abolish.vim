"==============================================================
"    file: vim-abolish.vim
"   brief: 一次查找,替换,缩写多个字符串
"
" command: 
"	:Abolish [options] {abbreviation} {replacement}
"	:Abolish -delete [options] {abbreviation}
"	:Abolish -search [options] {pattern}
"	:Subvert/{pattern}[/flags]
"	:Abolish!-search [options] {pattern}
"	:Subvert?{pattern}[?flags]
"	:Abolish -search [options] {pattern} {grep-arguments}
"	:Subvert /{pattern}/[flags] {grep-options}
"	:Abolish!-search [options] {pattern} {grep-arguments}
"	:Subvert!/{pattern}/[flags] {grep-options}
"	:[range]Abolish -substitute [options] {pattern} {replacement}
"	:[range]Subvert/{pattern}/{replacement}[/flags]
"
"	eg:
"	:%S/{,un}nec{ce,ces,e}sar{y,ily}/{}nec{es}sar{}/g
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-15 16:44:39
"==============================================================
Plug 'tpope/vim-abolish'
