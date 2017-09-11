"==============================================================
"    file: ctags.vimrc
"   brief: 使用ctags进行跳转,需要链接tags
"
"    nmap: <c-]> 跳转到当前字符串的定义处,与cscope一起使用的话,先使用cscope的功能
"
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-13 21:33:05
"==============================================================

if executable('ctags')
    let p = file#FindFile(getcwd(), 'tags')
    if p != ''
        execute "set tags=" . p . "tags"
    endif
endif

