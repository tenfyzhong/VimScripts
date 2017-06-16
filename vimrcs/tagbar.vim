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
"    nmap: <leader>tb :TagbarToggle
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfyzhong@qq.com
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
    nnoremap <silent><leader>tb :call <SID>ToggleTagbar()<CR>
    nnoremap <silent><leader>ta :call <SID>ToggleNerdTreeAndTagbar()<CR>
endif
" autocmd FileType c,cpp,h,cc,hpp,cxx nested :TagbarOpen

let g:tagbar_width 				= 25
let g:tagbar_compact 			= 1
let g:tagbar_show_linenumbers 	= 1
let g:tagbar_status_func 		= 'TagbarStatusFunc'
let g:tagbar_show_visibility 	= 1
let g:tagbar_iconchars 			= ['+', '-']
let g:tagbar_indent             = 1
let g:tagbar_show_linenumbers   = -1

let s:support_winid = version >= 800 || has('nvim')

function! s:ToggleNerdTreeAndTagbar()
    let l:bufname = bufname('%')
    if s:support_winid
        let l:winid = win_getid()
        let l:pos = getpos('.')
    endif
    if exists(':NERDTreeToggle')
        silent NERDTreeToggle
    endif
    call <SID>ToggleTagbar()
    if s:support_winid
        call win_gotoid(l:winid)
        call setpos('.', l:pos)
    endif
endfunction

function! s:ToggleTagbar()
    if &filetype != 'startify'
        try
            if s:support_winid
                let l:winid = win_getid()
                let l:pos = getpos('.')
            endif
            silent TagbarToggle
            if s:support_winid
                call win_gotoid(l:winid)
                call setpos('.', l:pos)
            endif
        catch
        endtry
    endif
endfunction

