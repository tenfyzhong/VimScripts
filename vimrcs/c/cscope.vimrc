"==============================================================
"    file: cscope.vimrc
"   brief: 
"
" command: cs help 帮助
"          cs kill 断开链接
"          cs reset 重新链接
"          cs show 显示链接
"          cs find {querytype} {name}
"             querytype可以是下面的选项
"		0 or s: Find this C symbol
"		1 or g: Find this definition
"		2 or d: Find functions called by this function
"		3 or c: Find functions calling this function
"		4 or t: Find this text string
"		6 or e: Find this egrep pattern
"		7 or f: Find this file
"		8 or i: Find files #including this file
"
"    nmap: <prefix> <c-\> cs find
"                   <c-_> csc find
"                   <a-\> vert scs find
"
"         <c-]> 跳到定义
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-16 17:45:57
"==============================================================
if !has("cscope")
    finish
endif

set cscopetag " 使支持用Ctrl+]和Ctrl+t 快捷键在代码间跳来跳去
set csto=1
set cst

let g:cscope_timer = 0

function! s:ConnectCscope() " {{{ 查找cscope.out并连接
	set nocsverb
    cs kill -1
    let p = file#FindFile(getcwd(), 'cscope.out')
    if p != ''
        execute "cs add " . p . "/cscope.out " . p

        if version >= 800
            " 定时更新
            if g:cscope_timer == 0
                let g:cscope_timer = timer_start(600000, 'file#ResetCscope', {'repeat': -1})
            endif
        endif
    endif
	set csverb
endfunction
" }}}


augroup CSCOPE_VIMRC
    au!
    " autocmd FileType c,cpp,java call <SID>ConnectCscope()
    autocmd VimEnter * call <SID>ConnectCscope()
augroup END

if exists("g:cscope_init")
    finish
endif

let g:cscope_maps = 1
nnoremap <unique><C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <unique><C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <unique><C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <unique><C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <unique><C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <unique><C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <unique><C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nnoremap <unique><C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

nnoremap <unique><C-_>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <unique><C-_>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <unique><C-_>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <unique><C-_>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <unique><C-_>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <unique><C-_>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <unique><C-_>i :scs find i <C-R>=expand("<cfile>")<CR><CR>
nnoremap <unique><C-_>d :scs find d <C-R>=expand("<cword>")<CR><CR>

call keymap#Mate("nnoremap <unique><m-\\>s :vert scs find s <C-R>=expand('<cword>')<CR><CR>")
call keymap#Mate("nnoremap <unique><m-\\>g :vert scs find g <C-R>=expand('<cword>')<CR><CR>")
call keymap#Mate("nnoremap <unique><m-\\>c :vert scs find c <C-R>=expand('<cword>')<CR><CR>")
call keymap#Mate("nnoremap <unique><m-\\>t :vert scs find t <C-R>=expand('<cword>')<CR><CR>")
call keymap#Mate("nnoremap <unique><m-\\>e :vert scs find e <C-R>=expand('<cword>')<CR><CR>")
call keymap#Mate("nnoremap <unique><m-\\>f :vert scs find f <C-R>=expand('<cfile>')<CR><CR>")
call keymap#Mate("nnoremap <unique><m-\\>i :vert scs find i <C-R>=expand('<cfile>')<CR><CR>")
call keymap#Mate("nnoremap <unique><m-\\>d :vert scs find d <C-R>=expand('<cword>')<CR><CR>")


let g:cscope_init = 1
