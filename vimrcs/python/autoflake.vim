"==============================================================
"    file: autoflake.vim
"   brief:
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2019-05-29 13:23:12
"==============================================================
PluginAdd 'tenfyzhong/autoflake.vim'

augroup autoflake_vim_init
  autocmd BufWritePre *.py silent Autoflake 
augroup end
