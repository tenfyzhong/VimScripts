"==============================================================
"    file: ale.vimrc
"   brief: 异步语法检查
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2017-02-08 12:52:47
"==============================================================
if version < 800
    finish
endif
PluginAdd 'w0rp/ale'

let g:ale_cpp_gcc_options = '-std=c++11 -Wall'

let g:ale_linters = {
            \ 'c': [], 
            \ 'cpp': [],
            \ 'go': ['gofmt']
            \}

" 关闭pymode的检查
let g:pymode_lint = 0
