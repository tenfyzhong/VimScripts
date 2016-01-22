" vimshell.vim
PluginAdd 'Shougo/vimshell.vim'
let g:vimshell_prompt_expr = 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
let g:vimshell_disable_escape_highlight = 1
let g:vimshell_vimshrc_path = '~/.vim/resource/vimshrc'

if !exists("g:vimshell_vim_maps")
    let g:vimshell_vim_maps = 1
    nnoremap <unique><silent><leader>vt     :VimShellTab<cr>
    nnoremap <unique><silent><leader>vs     :VimShell<cr>
endif
