" Requirement {{{
" 版本低于7.0会有很多配置用不了，要求更新
if version < 700
    echoerr "请更新到vim 7.0以上"
    finish
endif
" }}} 

" global variable {{{
" 全局变量
if &shell =~# 'fish$'
    set shell=sh
endif

let g:log_level = vimlog#error_level()
let mapleader   = "'"
let g:MSWIN     = system#IsMswin()
let g:UNIX      = system#IsUnix()
if g:MSWIN
    let g:VIMHOME=fnamemodify("~/vimfiles/", ':p')
else
    let g:VIMHOME=fnamemodify("~/.vim/", ':p')
endif
let g:vimrc_path    = fnamemodify(g:VIMHOME . "vimrcs/", ':p')
let g:bundle_path   = fnamemodify(g:VIMHOME . "bundle/", ':p')
" }}} 

" base setting {{{
source $VIMRUNTIME/vimrc_example.vim
set nocompatible " 关闭vi兼容模式
set cindent      " C语言缩进方式
set cinoptions+=:0 " case的括号不缩进
set cinoptions+=l1 " 大括号与case对齐
set cinoptions+=g0 " public,protected,private不缩进
set cinoptions+=N-s " c++ namespace里面的内容不缩进
set cinoptions+=(0,w1,W4 " 没结束的括号与上一行的内容对齐
set cinoptions+=j1 " 匿名类设置正确的缩进
set cinoptions+=J1 " 正常设置js的对齐声明
set foldmethod=syntax   " 根据缩进折叠
set fileencoding=utf-8
set fileencodings=utf-8,gbk,gb2312,cp936,usc-bom,euc-jp,gb18030
set mouse=           " 禁用鼠标
set wrapmargin=0
set textwidth=0
set colorcolumn=81
set backspace=2 " 使回格键正常处理indet,eol,start 等
set iskeyword+= " 设为字，遇到这些字符时不断行
set whichwrap+=<,>,h,l    " 允许backspace和光标键跨越行边界
set formatoptions=tcrqn " 自动格式化
set autochdir " 自动切换工作目录为当前文件所在的目录
set autowrite " 文件跳转时自动保存

set shortmess=atI    " 启动的时候不显示援助乌干达儿童提示
set autoread    " 文件修改后自动载入
set hidden

set showmatch    " 括号匹配
set ruler        " 显示标尺
set showmode     " 显示输入的命令
set confirm        " 在处理未保存或只读文件的时候，弹出确认

set hlsearch     " 高亮search命中的文本
set incsearch    " 随着键入即时搜索
"set ignorecase     搜索时忽略大小写
"set smartcase     有一个或以上大写字母时仍大小写敏感

set wildmenu     " 增加命令行自动补全操作
set history=500

highlight CursorLine term=underline cterm=NONE ctermbg=DarkGrey guibg=Grey90 
highlight ColorColumn ctermbg=DarkGrey guibg=Grey90

" 显示相关
"set cursorcolumn        " 高亮当前列
set cursorline            " 高亮当前行
set t_Co=256 

" tab缩进4
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set smarttab

set showtabline=2   "标签栏
set laststatus=2    "永远显示状态栏

set number          " 显示行号
set relativenumber

exec "set backupdir=" . g:VIMHOME . ".backupfile"
exec "set undodir=" . g:VIMHOME . ".undofile"

set pastetoggle=<leader>p

" set splitbelow
set splitright
set diffopt=filler,vertical

set viminfo+=!

set sessionoptions-=buffers


" 开启语法高亮
syntax on
syntax enable

" }}}

" autocmd {{{
augroup initial
    au!
    autocmd BufWritePost *vimrc,*.vim source % 
    autocmd InsertLeave * set nopaste
    autocmd InsertEnter * set number norelativenumber 
    autocmd InsertLeave * set number relativenumber 
    autocmd WinLeave * setl nocursorline
    autocmd WinEnter * setl cursorline
augroup END
" }}} 

" mswin setting {{{
if g:MSWIN
    colorscheme evening
    if filereadable("$VIMRUNTIME/_vimrc")
        source $VIMRUNTIME/_vimrc
    endif
    if filereadable("$VIMRUNTIME/../_vimrc")
        source $VIMRUNTIME/../_vimrc
    endif
endif
" }}} 

" global mapping {{{
if !exists("g:load_vimrc")
    nnoremap <c-k>                      gT
    nnoremap <c-j>                      gt
    nnoremap <unique><F12>              <C-w>w
    nnoremap <unique><leader>h          <c-w>h
    nnoremap <unique><leader>j          <c-w>j
    nnoremap <unique><leader>k          <c-w>k
    nnoremap <unique><leader>l          <c-w>l
    nnoremap <unique><c-left>           <c-w>h
    nnoremap <unique><c-down>           <c-w>j
    nnoremap <unique><c-up>             <c-w>k
    nnoremap <unique><c-right>          <c-w>l
    nnoremap <unique>j                  gj
    nnoremap <unique>gj                 j
    nnoremap <unique>k                  gk
    nnoremap <unique>gk                 k
    cnoremap <unique><c-k>              <Up>
    cnoremap <unique><c-j>              <Down>
    nnoremap <unique><silent><Space>    :call fold#FoldIfLevelGreat0(line("."))<CR>
    nnoremap ;                          :
    xnoremap ;                          :
    nnoremap <leader>w                  :wa<CR>
    nnoremap <leader>q                  :q<CR>
    nnoremap <silent>do                 :diffget<cr>:diffupdate<cr>
    nnoremap <silent>dp                 :diffput<cr>:diffupdate<cr>
    nnoremap <silent><unique><leader>nn :call feature#PollNumber()<cr>
    vnoremap < <gv
    vnoremap > >gv

    call keymap#Mate("nnoremap <unique><m-,> ;")

    if &diff
        nnoremap <unique><silent>[1 :diffget 1<CR> :diffupdate<CR> 
        nnoremap <unique><silent>[2 :diffget 2<CR> :diffupdate<CR>
        nnoremap <unique><silent>[3 :diffget 3<CR> :diffupdate<CR>
        nnoremap <unique><silent>[4 :diffget 4<CR> :diffupdate<CR>
        nnoremap <unique><silent>]1 :diffput 1<CR> :diffupdate<CR> 
        nnoremap <unique><silent>]2 :diffput 2<CR> :diffupdate<CR>
        nnoremap <unique><silent>]3 :diffput 3<CR> :diffupdate<CR>
        nnoremap <unique><silent>]4 :diffput 4<CR> :diffupdate<CR>
    endif

    onoremap af :<c-u>normal! ggVG<CR>
endif
" }}} 

" command {{{
com! -nargs=+ -bar PluginAdd call loader#core#BundlePlugin(<args>)
" }}} 

" local.vim {{{
let b:local_vim = g:VIMHOME . "local.vim"
if filereadable(b:local_vim)
    exec "so " . b:local_vim
endif
" }}}

" {{{ source dir vimrc
function! s:SourceDirVimrc(name) 
    let l:dir_vimrc_path = file#FindFile(getcwd(), a:name)
    if l:dir_vimrc_path != '' && 
                \ l:dir_vimrc_path != fnamemodify(resolve($HOME), ':p')
        let l:dir_vimrc = l:dir_vimrc_path . a:name
        exec 'source ' . l:dir_vimrc
    endif
endfunction 

if g:MSWIN
    call <SID>SourceDirVimrc('_vimrc')
else
    call <SID>SourceDirVimrc('.vimrc')
endif
" }}}

" source plugin {{{
" 加载插件
" 建议：插件的配置最好以插件名加.vimrc命名
" 如a.vim的配置为a.vim.vimrc，放在vimrcs目录下
" 加载vimrcs目录下的所有脚本
call loader#core#LoadVimrcs()

let g:load_vimrc = 1
" }}} 

