"==============================================================
"    file: java.vim
"   brief: 
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-09 10:52:53
"==============================================================

if exists("g:java_after_ftplugin")
    finish
endif

if exists(":JCserverStart")
    " For smart (trying to guess import option) insert class import:
    nmap <buffer><unique>\js <Plug>(JavaComplete-Imports-AddSmart)
    imap <buffer><unique>\js <Plug>(JavaComplete-Imports-AddSmart)
    " For usual (will ask for import option) insert class import:
    nmap <buffer><unique>\ja <Plug>(JavaComplete-Imports-Add)
    imap <buffer><unique>\ja <Plug>(JavaComplete-Imports-Add)
    " For add all missing imports with <F6>:
    nmap <buffer><unique>\jm <Plug>(JavaComplete-Imports-AddMissing)
    imap <buffer><unique>\jm <Plug>(JavaComplete-Imports-AddMissing)
    " For remove all missing imports with <F7>:
    nmap <buffer><unique>\jr <Plug>(JavaComplete-Imports-RemoveUnused)
    imap <buffer><unique>\jr <Plug>(JavaComplete-Imports-RemoveUnused)
endif

if exists(":EclimEnable") 
    nnoremap <buffer><unique>\ji :JavaImport<cr>
    nnoremap <buffer><unique>\jd :JavaDocSearch -x declarations<cr>
    nnoremap <buffer><unique>\jc :JavaSearchContext<cr>
    if exists(":YcmCompleter")
        let g:EclimCompletionMethod = 'omnifunc'
    endif

    if !eclim#EclimAvailable() 
        setlocal omnifunc=javacomplete#Complete 
    endif

endif


let g:java_after_ftplugin = 1
