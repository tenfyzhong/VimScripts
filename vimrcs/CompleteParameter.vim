"==============================================================
"    file: CompleteParameter.vim
"   brief: 
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfyzhong@qq.com
" created: 2017-06-07 20:26:40
"==============================================================
PluginAdd 'tenfyzhong/CompleteParameter.vim'

let g:complete_parameter_log_level = 4
inoremap <buffer><silent> ) <C-R>=AutoPairsInsert(')')<CR>
