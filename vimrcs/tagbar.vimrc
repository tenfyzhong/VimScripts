"==============================================================
"    file: tagbar.vimrc
"   brief: 浏览tag的工具
"
" command: TagbarOpen [{flags}] 打开tagbar
"          TagbarClose 关闭tagbar
"          TagbarToggle 触发tagbar
"          TagbarTogglePause 触发冻结当前的tagbar,文件间切换也不会变
"          TagbarOpenAutoClose 打开tagbar窗口后,选择完就关闭
"          TagbarSetFoldlevel[!] {number} 设置折叠级别
"          TagbarShowTag 显示当前结点
"          TagbarCurrentTag [{flags}] 回显当前结点
"          TagbarGetTypeConfig {filetype} 粘贴filetype的配置
"
"    nmap: <leader>tt :TagbarToggle
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-14 19:48:14
"==============================================================

if version < 701
    finish
endif

PluginAdd 'majutsushi/tagbar'

" 比taglist更现代的代码结构浏览工具
function! TagbarStatusFunc(current, sort, fname, ...) abort
	let colour = a:current ? '%#StatusLine#' : '%#StatusLineNC#'
	return colour . '[' . a:sort . '] ' . a:fname
endfunction

if !exists("g:tagbar_maps")
    let g:tagbar_maps = 1
    nnoremap <unique><silent><leader>tb :TagbarToggle<CR>
    nnoremap <unique><silent><leader>ta :call <SID>ToggleNerdTreeAndTagbar()<CR>
endif
" autocmd FileType c,cpp,h,cc,hpp,cxx nested :TagbarOpen

let g:tagbar_width 				= 25
let g:tagbar_compact 			= 1
let g:tagbar_show_linenumbers 	= 1
let g:tagbar_status_func 		= 'TagbarStatusFunc'
let g:tagbar_show_visibility 	= 1
let g:tagbar_iconchars 			= ['+', '-']
let g:tagbar_indent             = 1
let g:tagbar_show_linenumbers   = 0

function! s:ToggleNerdTreeAndTagbar()
    let l:pos = getpos('.')
    if exists(':NERDTreeToggle')
        NERDTreeToggle
        normal <c-w>l
    endif
    TagbarToggle
    normal <c-w>h
    call setpos('.', l:pos)
endfunction

