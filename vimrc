" Requirement {{{
if version < 704
    echoerr "请更新到vim 7.4以上"
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
lang messages en_US.UTF-8
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
set foldmethod=syntax   " 缩进，这个开启后，打开大文件非常慢
" set foldmethod=indent
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
" set autochdir " 自动切换工作目录为当前文件所在的目录
set autowrite " 文件跳转时自动保存
set scrolloff=2

set shortmess=atI    " 启动的时候不显示援助乌干达儿童提示
set autoread    " 文件修改后自动载入
set hidden

set showmatch    " 括号匹配
set ruler        " 显示标尺
set showmode     " 显示输入的命令
set confirm        " 在处理未保存或只读文件的时候，弹出确认

set hlsearch     " 高亮search命中的文本
set incsearch    " 随着键入即时搜索
" set ignorecase   " 搜索时忽略大小写
" set smartcase    " 有一个或以上大写字母时仍大小写敏感

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

set background=dark
colorscheme solarized
highlight Folded term=bold cterm=bold ctermfg=12 ctermbg=0 guifg=Cyan guibg=DarkGrey
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
nnoremap <c-k>              gT
nnoremap <c-j>              gt
nnoremap <F12>              <C-w>w
nnoremap <leader>h          <c-w>h
nnoremap <leader>j          <c-w>j
nnoremap <leader>k          <c-w>k
nnoremap <leader>l          <c-w>l
nnoremap <c-left>           <c-w>h
nnoremap <c-down>           <c-w>j
nnoremap <c-up>             <c-w>k
nnoremap <c-right>          <c-w>l
nnoremap j                  gj
nnoremap gj                 j
nnoremap k                  gk
nnoremap gk                 k
cnoremap <c-k>              <Up>
cnoremap <c-j>              <Down>
nnoremap <silent><Space>    za
nnoremap ;                  :
xnoremap ;                  :
nnoremap <leader>w          :wa<CR>
nnoremap <silent>do         :diffget<cr>:diffupdate<cr>
nnoremap <silent>dp         :diffput<cr>:diffupdate<cr>
nnoremap <silent><leader>nn :call feature#PollNumber()<cr>
vnoremap < <gv
vnoremap > >gv
nnoremap <leader><Space> zA
nnoremap <silent><leader>tn         <Esc>:tabnew<cr>
nnoremap <silent><leader>tc         <Esc>:tabclose<cr>
nnoremap <silent><leader>cf         <Esc>:let @"=expand('%')<cr>
nnoremap <silent><leader>cp         <Esc>:let @"=expand('%:p')<cr>

call keymap#Mate("nnoremap <m-,> ;")

if &diff
    nnoremap <silent>[1 :diffget 1<CR> :diffupdate<CR> 
    nnoremap <silent>[2 :diffget 2<CR> :diffupdate<CR>
    nnoremap <silent>[3 :diffget 3<CR> :diffupdate<CR>
    nnoremap <silent>[4 :diffget 4<CR> :diffupdate<CR>
    nnoremap <silent>]1 :diffput 1<CR> :diffupdate<CR> 
    nnoremap <silent>]2 :diffput 2<CR> :diffupdate<CR>
    nnoremap <silent>]3 :diffput 3<CR> :diffupdate<CR>
    nnoremap <silent>]4 :diffput 4<CR> :diffupdate<CR>
endif

onoremap af :<c-u>normal! ggVG<CR>
" }}} 

" command {{{
com! -nargs=+ -bar PluginAdd call loader#BundlePlugin(<args>)
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
call loader#LoadVimrcs()

let g:load_vimrc = 1
" }}} 

