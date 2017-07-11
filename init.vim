" nvim setting
if !has('nvim')
    finish
endif
set runtimepath+=~/.vim,~/.vim/after
set packpath+=.vim

let g:python_host_prog  = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:ycm_server_python_interpreter = g:python_host_prog

let main = expand('<sfile>:h:p').'/main.vim'
exec 'source ' . main

tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap <C-o> <C-l>
