"==============================================================
"    file: braceless.vim
"   brief: 
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-06-19 14:55:45
"==============================================================
finish
PluginAdd 'tweekmonster/braceless.vim'

highlight BracelessIndent ctermfg=NONE ctermbg=Black guibg=Grey90 

augroup BRACELESS_SETTING
    autocmd!
    autocmd FileType python,yaml,coffee BracelessEnable +indent +fold 
augroup end

