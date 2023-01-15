" nvim setting
if !has('nvim')
    finish
endif
set runtimepath+=~/.vim,~/.vim/after
let &packpath = &runtimepath

let g:python_host_prog  = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

let main = '~/.vim/main.vim'
exec 'source ' . main

" tnoremap <Esc> <C-\><C-n>
" tnoremap <C-h> <C-\><C-n><C-w>h
" tnoremap <C-j> <C-\><C-n><C-w>j
" tnoremap <C-k> <C-\><C-n><C-w>k
" tnoremap <C-l> <C-\><C-n><C-w>l
" tnoremap <C-o> <C-l>

function! s:split_window(cmd)
    exec a:cmd
    if &buftype ==# 'terminal'
        terminal
    endif
endfunction

nnoremap <c-w>s :call <SID>split_window('sp')<cr>
nnoremap <c-w>S :call <SID>split_window('sp')<cr>
nnoremap <c-w><c-s> :call <SID>split_window('sp')<cr>
nnoremap <c-w>v :call <SID>split_window('vsp')<cr>
nnoremap <c-w><c-v> :call <SID>split_window('vsp')<cr>

set clipboard+=unnamedplus

