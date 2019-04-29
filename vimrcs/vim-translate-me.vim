"==============================================================
"    file: vim-translate-me.vim
"   brief: 翻译插件
"
"    nmap:
"    vmap:
"      <leader>td 翻译当前光标下的文本，在命令行回显
"      <leader>tw 翻译当前光标下的文本，在窗口中显示
"      <leader>tr 翻译当前光标下的文本，替换光标下的文本为翻译内容
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2019-04-29 08:47:54
"==============================================================
PluginAdd 'voldikss/vim-translate-me'

" 普通模式，<Leader>d 翻译光标下的文本，在命令行回显翻译内容
nmap <silent> <Leader>td <Plug>Translate
" 可视模式，<Leader>d 翻译光标下的文本，在命令行回显翻译内容
vmap <silent> <Leader>td <Plug>TranslateV
" 普通模式，<Leader>w 翻译光标下的文本，在窗口中显示翻译内容
nmap <silent> <Leader>tw <Plug>TranslateW
" 可视模式，<Leader>w 翻译光标下的文本，在窗口中显示翻译内容
vmap <silent> <Leader>tw <Plug>TranslateWV
" 普通模式，<Leader>r 替换光标下的文本为翻译内容
nmap <silent> <Leader>tr <Plug>TranslateR
" 可视模式，<Leader>r 替换光标下的文本为翻译内容
vmap <silent> <Leader>tr <Plug>TranslateRV


