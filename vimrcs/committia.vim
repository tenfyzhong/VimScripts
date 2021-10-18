"==============================================================
"    file: committia.vim
"   brief: 
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2018-07-03 22:38:11
"==============================================================
Plug 'rhysd/committia.vim'


" You can get the information about the windows with first argument as a dictionary.
"
"   KEY              VALUE                      AVAILABILITY
"-----------------------------------------------------------------------------------
"   vcs            : vcs type (e.g. 'git')   -> all hooks
"   edit_winnr     : winnr of edit window    -> ditto
"   edit_bufnr     : bufnr of edit window    -> ditto
"   diff_winnr     : winnr of diff window    -> ditto
"   diff_bufnr     : bufnr of diff window    -> ditto
"   status_winnr   : winnr of status window  -> all hooks except for 'diff_open' hook
"   status_bufnr   : bufnr of status window  -> ditto

let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
    setlocal nonu
    setlocal nornu
    augroup edit_open_init
        autocmd InsertEnter * set nonumber norelativenumber
        autocmd InsertLeave * set nonumber norelativenumber 
    augroup END

    " Scroll the diff window from insert mode
    " Map <C-n> and <C-p>
    imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
    imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
endfunction

function! g:committia_hooks.status_open(info)
    setlocal nonu
    setlocal nornu
    augroup edit_open_init
        autocmd InsertEnter * set nonumber norelativenumber
        autocmd InsertLeave * set nonumber norelativenumber 
    augroup END

endfunction

