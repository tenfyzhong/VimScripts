PluginAdd 'haya14busa/incsearch.vim'
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
set hlsearch
let g:incsearch#auto_nohlsearch = 0
