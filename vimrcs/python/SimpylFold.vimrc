PluginAdd 'tmhedberg/SimpylFold'

let g:SimpylFold_docstring_preview = 1

augroup SimpylfoldDefine
    au!
    autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
    autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
augroup END
