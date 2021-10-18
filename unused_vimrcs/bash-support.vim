"==============================================================
"    file: bash-support.vim
"   brief: bash ide
"
"    nmap:
"  [n]\rr     update file, run script             (n, i)
"     \ra     set script cmd. line arguments      (n, i)
"     \rba    set Bash cmd. line arguments        (n, i)
"     \rc     update file, check syntax           (n, i)
"     \rco    syntax check options                (n, i)
"     \rd     start debugger                      (n, i)
"     \re     make script executable/not exec.(*) (in )
"     \rh     hardcopy buffer to FILENAME.ps      (n, i)
"     \rs     plug-in settings                    (n, i)
"     \rt     set xterm size (*)                  (n, i)
"     \ro     change output destination           (n, i)
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-16 17:57:23
"==============================================================
Plug 'vim-scripts/bash-support.vim'

let g:BASH_GuiSnippetBrowser    = 'commandline'
let g:BASH_LocalTemplateFile    = $HOME .'/.vim/resource/bash-support/Templates'
