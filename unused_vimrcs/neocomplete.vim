"==============================================================
"    file: neocomplete.vim.vimrc
"   brief: 补全
"
" command: NeoCompleteEnable 开启补全
"          NeoCompleteDisable 关闭补全
"          NeoCompleteToggle 触发锁定补全
"          NeoCompleteLock 锁定，此时不会自动补全，可以手动补全
"          NeoCompleteUnlock 解锁
"          NeoCompleteAutoCompletionLength {length} 修改当前buffer的触发补全字符数
"          NeoCompleteClean 清除g:neocomplete#data_directory的文件
"          NeoCompleteSetFileType [filetype] 修改neocomplete的文件类型，不影响文件本身
"          NeoCompleteBufferMakeCache [bufname] 对bufname的文件生成cache
"          NeoCompleteDictionaryMakeCache 对文件类型进行生成cache
"          NeoCompleteTagMakeCache 从当前文件的tags生成cache
"          NeoCompleteMemberMakeCache 对当前的buffer建立成员cache
"
"    imap: <c-e>关闭补全菜单
"          <c-y>插入候选并关闭菜单
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-08-15 00:01:39
"==============================================================
PluginAdd 'Shougo/neocomplete.vim'
PluginAdd 'Shougo/neopairs.vim'

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#auto_completion_start_length = 1
let g:neocomplete#min_keyword_length = 2
let g:neocomplete#auto_complete_delay = 0
let g:neocomplete#enable_auto_close_preview = 1
let g:neocomplete#enable_refresh_always = 1

inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

augroup neocomplete_setting
    autocmd!
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

