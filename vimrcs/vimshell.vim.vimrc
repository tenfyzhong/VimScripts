" vimshell.vim
let g:vimshell_prompt_expr = 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
let g:vimshell_disable_escape_highlight = 1

nnoremap <leader>vt     :VimShellTab<cr>
nnoremap <leader>vs     :VimShell<cr>
