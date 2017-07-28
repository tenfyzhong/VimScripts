"==============================================================
"    file: CompleteParameter.vim
"   brief: 
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfyzhong@qq.com
" created: 2017-06-07 20:26:40
"==============================================================
PluginAdd 'tenfyzhong/CompleteParameter.vim', {'frozen': 1}

let g:complete_parameter_log_level = 4
let g:complete_parameter_use_ultisnips_mappings = 1

inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
