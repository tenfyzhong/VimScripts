"==============================================================
"    file: vim-startify.vim
"   brief: 启动vim时显示最近使用的文件书签和session
"
" command: Startify 手动触发startify
"          SLoad [session] 加载session
"          SSave [session] 保存session
"          SDelete[!] [session] 删除session
"          SClose 关闭session
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-16 11:57:01
"==============================================================
PluginAdd 'mhinz/vim-startify'

let g:startify_session_dir = g:VIMHOME . '.startify_session'
let g:startify_enable_special = 0
let g:startify_change_to_dir = 1

" let g:startify_bookmarks = [ {'c': '~/.vim'}, '~/.zshrc' ]
let g:startify_bookmarks = []

let g:startify_skiplist = [
            \ 'bundle/.*/doc',
            \ 'COMMIT_EDITMSG',
            \ ]

let g:startify_custom_header = 
            \['*---------------------------------------------------*',
            \ '| Open: b(buffer) s(split) v(vertical split) t(tab) |',
            \ '| Action: q(quit) e(empty buffer) i(insert) - tenfy |',
            \ '*---------------------------------------------------*',
            \ '       o                                             ',
            \ '        o   ^__^                                     ',
            \ '         o  (oo)\_______                             ',
            \ '            (__)\       )\/\                         ',
            \ '                ||----w |                            ',
            \ '                ||     ||                            ',
            \ ]
