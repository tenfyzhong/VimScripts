"==============================================================
"    file: vim-airline.vimrc
"   brief: 
" 
" command: AirlineTheme {theme-name} 切换主题
"          AirlineToggleWhitespace 触发显示空格
"          AirlineToggle 触发airline
"          ArilineRefresh 刷新airline
"
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-15 17:04:40
"==============================================================
PluginAdd 'vim-airline/vim-airline'
PluginAdd 'vim-airline/vim-airline-themes'

let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ycm#error_symbol = 'E:'
let g:airline#extensions#ycm#warning_symbol = 'W:'
let g:airline#extensions#tabline#buffers_label = 't%(%{tabpagenr()}%)/%(%{tabpagenr("$")}%)'
let g:airline#extensions#tabline#tabs_label = 't'

let g:airline#extensions#tabline#enabled = 1
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
" nmap <leader>1 <Plug>AirlineSelectTab1
" nmap <leader>2 <Plug>AirlineSelectTab2
" nmap <leader>3 <Plug>AirlineSelectTab3
" nmap <leader>4 <Plug>AirlineSelectTab4
" nmap <leader>5 <Plug>AirlineSelectTab5
" nmap <leader>6 <Plug>AirlineSelectTab6
" nmap <leader>7 <Plug>AirlineSelectTab7
" nmap <leader>8 <Plug>AirlineSelectTab8
" nmap <leader>9 <Plug>AirlineSelectTab9

function! AfterAirlineInitSetting()
    call airline#parts#define_function('tablemode', 'TableModeStatusLine')
    let g:airline_section_warning .= airline#section#create_right(['tablemode'])
endfunction

augroup AirlineSetting
    autocmd!
    autocmd User AirlineAfterInit call AfterAirlineInitSetting()
augroup END

