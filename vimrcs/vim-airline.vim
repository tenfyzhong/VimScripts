"==============================================================
"    file: vim-airline.vim
"   brief: 
" 
" command: AirlineTheme {theme-name} 切换主题
"          AirlineToggleWhitespace 触发显示空格
"          AirlineToggle 触发airline
"          AirlineRefresh 刷新airline
"
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-15 17:04:40
"==============================================================
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ycm#error_symbol = 'E:'
let g:airline#extensions#ycm#warning_symbol = 'W:'
let g:airline#extensions#tabline#buffers_label = 't%(%{tabpagenr()}%)/%(%{tabpagenr("$")}%)'
let g:airline#extensions#tabline#tabs_label = 't'

let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#disable_rtp_load = 0
let g:airline_exclude_preview = 1
let g:airline#extensions#whitespace#checks = [ 'indent', 'mixed-indent' ]

function! AfterAirlineInitSetting()
    call airline#parts#define_function('tablemode', 'TableModeStatusLine')
    let g:airline_section_warning .= airline#section#create_right(['tablemode'])
    if exists('*joplin#statusline#airline')
        call airline#add_statusline_func('joplin#statusline#airline')
    endif
endfunction

augroup AirlineSetting
    autocmd!
    autocmd User AirlineAfterInit call AfterAirlineInitSetting() 
augroup END

