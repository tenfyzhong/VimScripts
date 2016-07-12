"==============================================================
"    file: vim-airline.vimrc
"   brief: 
" 
" command: AirlineTheme {theme-name} 切换主题
"          AirlineToggleWhitespace 触发显示空格
"          AirlineToggle 触发airline
"          ArilineRefresh 刷新airline
"
"    nmap: 
"      <leader>1 选择tab1的内容
"      <leader>2 选择tab2的内容
"      <leader>3 选择tab3的内容
"      <leader>4 选择tab4的内容
"      <leader>5 选择tab5的内容
"      <leader>6 选择tab6的内容
"      <leader>7 选择tab7的内容
"      <leader>8 选择tab8的内容
"      <leader>9 选择tab9的内容
"      <c-h> 左边tab内容
"      <c-l> 右边tab内容
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-15 17:04:40
"==============================================================
PluginAdd 'vim-airline/vim-airline'
PluginAdd 'vim-airline/vim-airline-themes'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#ycm#error_symbol = 'E:'
let g:airline#extensions#ycm#warning_symbol = 'W:'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#disable_rtp_load = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_exclude_preview = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <c-h> <Plug>AirlineSelectPrevTab
nmap <c-l> <Plug>AirlineSelectNextTab

function! AfterAirlineInitSetting()
    call airline#parts#define_function('tablemode', 'TableModeStatusLine')
    let g:airline_section_warning .= airline#section#create_right(['tablemode'])
endfunction

augroup AirlineSetting
    au!
    autocmd User AirlineAfterInit call AfterAirlineInitSetting()
augroup END

