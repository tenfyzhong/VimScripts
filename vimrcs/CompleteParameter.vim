"==============================================================
"    file: CompleteParameter.vim
"   brief: 
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2017-06-07 20:26:40
"==============================================================
Plug 'tenfyzhong/CompleteParameter.vim', {'frozen': 1}

let g:complete_parameter_log_level = 4
let g:complete_parameter_use_ultisnips_mappings = 1
let g:complete_parameter_echo_signature = 1

imap <expr>( 
            \ pumvisible() ? 
            \ complete_parameter#pre_complete("()") : 
            \ "\<Plug>delimitMate("
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
nmap <m-d> <Plug>(complete_parameter#overload_down)
imap <m-d> <Plug>(complete_parameter#overload_down)
smap <m-d> <Plug>(complete_parameter#overload_down)
nmap <m-u> <Plug>(complete_parameter#overload_up)
imap <m-u> <Plug>(complete_parameter#overload_up)
smap <m-u> <Plug>(complete_parameter#overload_up)
