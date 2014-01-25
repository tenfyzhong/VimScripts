"**********************************************************************
" 加载插件
" 注意：插件的配置必须以插件名加.vimrc命名
" 如a.vim的配置为a.vim.vimrc，放在vimrcs目录下

" 第0步 载入全局函数
source ~/.vim/vimrcs/functions.vimrc

" 第1步 加载vundle
call g:load_plugin_vimrc('vundle.vimrc')

" 第2步 加载其他插件
let s:bundle_list = [
	\ 'Rip-Rip/clang_complete',
	\ 'winmanager',
	\ 'a.vim',
	\ 'c.vim',
	\ 'scrooloose/nerdtree',
	\ 'FindMate',
	\ 'fholgado/minibufexpl.vim',
	\ 'vim-scripts/grep.vim',
	\ 'ervandew/supertab',
	\ 'kien/ctrlp.vim',
	\ 'tpope/vim-fugitive',
	\ 'magic-dot-files/TagHighlight',
	\ 'vim-scripts/DoxygenToolkit.vim',
	\ 'vim-jp/cpp-vim',
	\ 'Raimondi/delimitMate',
	\ 'tpope/vim-surround',
	\ 'gregsexton/gitv',
	\ 'tpope/vim-commentary',
	\ 'Yggdroot/indentLine',
	\ 'Shougo/unite.vim',
	\ 'terryma/vim-multiple-cursors',
	\ 'kshenoy/vim-signature',
	\ 'Rykka/colorv.vim',
	\ 'sjl/gundo.vim',
	\ 'leshill/vim-json',
	\ 'SirVer/ultisnips',
	\ 'othree/xml.vim',
	\ 'itchyny/calendar.vim',
	\ 'vimwiki/vimwiki',
	\ 'vim-scripts/VimRepress',
	\ 'vim-scripts/VOoM',
	\ 'vim-scripts/CmdlineComplete',
	\ 'DataWraith/auto_mkdir',
	\]
"	\ 'airblade/vim-gitgutter',
"	\ 'Lokaltog/powerline'
"	\ 'ywvim.vimrc',
"	\ 'neocomplcache.vim.vimrc',
"	\ 'YouCompleteMe.vimrc',
"	\ 'syntastic.vimrc',

if version >= 701
	call add(s:bundle_list, 'majutsushi/tagbar')
else
	call add(s:bundle_list, 'vim-scripts/taglist.vim')
endif

call g:bundle_all_plugin(s:bundle_list)


" 第3步 加载没有插件的配置
let s:vimrc_name_list = [
	\ 'ctags.vimrc',
	\ 'cscope.vimrc',
	\ 'quickfix.vimrc',
	\	]

for vimrc_name in s:vimrc_name_list
	call g:load_plugin_vimrc(vimrc_name)
endfor
"**********************************************************************
