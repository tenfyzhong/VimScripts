"==============================================================
"    file: defx.nvim.vim
"   brief: 
" VIM Version: 9.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2023-01-14 13:00:34
"==============================================================

if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'

let g:defx_icons_column_length = 2

nnoremap <silent><leader>nt :Defx<cr>

function! s:defx_setting()
  nnoremap <silent><buffer><expr> yy defx#do_action('copy')
  nnoremap <silent><buffer><expr> dd defx#do_action('move')
  nnoremap <silent><buffer><expr> <C-v> defx#do_action('paste')
  nnoremap <silent><buffer><expr> p defx#do_action('search', fnamemodify(defx#get_candidate().action__path, ':h'))
  nnoremap <silent><buffer><expr> l 
        \ defx#is_directory() ?
        \ defx#do_action('open') :
        \ "\<Ignore>"
  nnoremap <silent><buffer><expr> v 
        \ !defx#is_directory() && !defx#is_binary() ? 
        \ defx#do_action('drop', 'vsplit') :
        \ "\<Ignore>"
  nnoremap <silent><buffer><expr> s 
        \ !defx#is_directory() && !defx#is_binary() ? 
        \ defx#do_action('drop', 'split') :
        \ "\<Ignore>"
  nnoremap <silent><buffer><expr> <CR> 
        \ defx#is_directory() ?
        \ defx#do_action('open_tree', 'toggle') : 
        \ !defx#is_binary() ? defx#do_action('drop') : "\<Ignore>"
  nmap <silent><buffer>o <CR>

  nnoremap <silent><buffer><expr> mk defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> mf defx#do_action('new_file')
  nnoremap <silent><buffer><expr> mm defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> rm defx#do_action('remove')
  nnoremap <silent><buffer><expr> rn defx#do_action('rename')
  nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> . defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
  nmap <silent><buffer><expr> <Space><Space> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-r> defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
  nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
  nnoremap <silent><buffer><expr> > defx#do_action('resize', defx#get_context().winwidth + 2)
  nnoremap <silent><buffer><expr> < defx#do_action('resize', defx#get_context().winwidth - 2)
  nnoremap <buffer><silent> [c <Plug>(defx-git-prev)
  nnoremap <buffer><silent> ]c <Plug>(defx-git-next)
  nnoremap <buffer><silent> ]a <Plug>(defx-git-stage)
  nnoremap <buffer><silent> ]r <Plug>(defx-git-reset)
  nnoremap <buffer><silent> ]d <Plug>(defx-git-discard)
endfunction

augroup defx_init
  autocmd!
  autocmd FileType defx call <SID>defx_setting()
augroup END


