"==============================================================
"    file: pload.vim
"   brief: Load vim script in multiple files.
"
"   Download pload.vim and put it in ~/.vim/autoload
"     curl -fLo ~/.vim/autoload/pload.vim --create-dirs \
"       https://raw.githubusercontent.com/tenfyzhong/VimScripts/master/autoload/pload.vim
"
"   Edit your .vimrc
"   call pload#source('~/.vim/vimrcs')
"
"   Then you can put you plugin configuration in difference files, 
"   and then put the configuration in `~/.vim/vimrcs`. 
"
"   Every configuration file can has a prefix `<num>-`, the `<num>` is a
"   placeholder, it means the source level. Lower level has priority. 
"   Default level is 5.
"
"   pload.vim is not a plugin manager. You should use it combine with a 
"   plugin manager such `junegunn/vim-plug`. 
"
"   Here's an example to use it with vim-plug.
"   " file: ~/.vim/vimrcs/vim-easy-align.vim
"   Plug 'junegun/vim-easy-align'
"   " file: ~/.vim/vimrcs/SirVer/ultisnips.vim
"   Plug 'SirVer/ultisnips.vim'
"
"   " file ~/.vim/vimrc
"   call plug#begin('~/.vim/plugged')
"   call pload#source('~/.vim/vimrcs/)
"   call plug#end()
"   filetype on					
"   filetype plugin on			
"   filetype indent on			
"   filetype plugin indent on	
" VIM Version: 8.2
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2021-10-12 15:08:59
"==============================================================

function! pload#source(path)
  let path = fnamemodify(a:path, ':p')
  let path .= <sid>iswin() ? '\' : '/'
  let vimrcs = globpath(path . '**', '*.vim', 0, 1)
  let level_vimrcs = {}
  for vimrc in vimrcs
    let level = <sid>level(vimrc)
    if !has_key(level_vimrcs, level)
      let level_vimrcs[level] = []
    endif
    call add(level_vimrcs[level], vimrc)
  endfor

  let level_vimrcs_tuple = []
  for item in items(level_vimrcs)
    let item[0] = str2nr(item[0])
    call add(level_vimrcs_tuple, item)
  endfor

  call sort(level_vimrcs_tuple, {a, b -> a[0] == b[0] ? a[1] < b[1] : a[0] < b[0]})
  for [level, vimrcs] in level_vimrcs_tuple
    for vimrc in vimrcs
      execute "source " . vimrc
    endfor
  endfor
endfunction

function! pload#luafile(path)
  let path = fnamemodify(a:path, ':p')
  let path .= <sid>iswin() ? '\' : '/'
  let files = globpath(path . '**', '*.lua', 0, 1)
  for file in files
    execute 'luafile ' . file
  endfor
endfunction

" get the level of file
" a level is prefix of the filename with the format `<num>-xxx.vimrc`
" the default level is 5, if the filename without a prefix with a `<num>-`, 5 will return
function! s:level(vimrc)
  let filename = fnamemodify(a:vimrc, ':p:t')
  if filename =~# '^\d-.*$'
    return str2nr(filename)
  endif
  return 5
endfunction

function! s:iswin()
  return has("win16") || has("win32")   || has("win64") || has("win95")
endfunction
