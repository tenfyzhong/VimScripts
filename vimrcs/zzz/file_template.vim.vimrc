"==============================================================
"    file: file_template.vim.vimrc
"   brief: 自动根据文件类型插入文件头注释
"
" command: InsertTemplate 在文件头部插入注释
"
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-14 09:49:19
"==============================================================
PluginAdd 'tenfyzhong/file_template.vim'

" let g:file_template_ignore_filetype = ['sh', 'cpp', 'c'] 

let g:local_template_dir = '~/.vim/resource/file_template'
