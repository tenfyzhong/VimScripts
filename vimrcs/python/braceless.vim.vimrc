"==============================================================
"    file: braceless.vim.vimrc
"   brief: 
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-06-19 14:55:45
"==============================================================
PluginAdd 'tweekmonster/braceless.vim'

highlight BracelessIndent ctermfg=NONE ctermbg=Black guibg=Grey90 

augroup BRACELESS_SETTING
    au!
    autocmd FileType python,yaml,coffee BracelessEnable +indent +flod +highlight
augroup end

