"==============================================================
"    file: fzf.vim
"   brief: 适配fzf工具
"
" command: [!]进行全屏模式
"      FZF {option} {path} " 从path进行搜索，不提供时为当前目录
"      以下命令以FZF为前缀
"      `Files [PATH]`    | Files (similar to  `:FZF` )
"      `GFiles [OPTS]`   | Git files (git ls-files)
"      `GFiles?`         | Git files (git status)
"      `Buffers`         | Open buffers
"      `Colors`          | Color schemes
"      `Ag [PATTERN]`    | {ag}{5} search result (ALT-A to select all, ALT-D to deselect all)
"      `Lines [QUERY]`   | Lines in loaded buffers
"      `BLines [QUERY]`  | Lines in the current buffer
"      `Tags [QUERY]`    | Tags in the project ( `ctags -R` )
"      `BTags [QUERY]`   | Tags in the current buffer
"      `Marks`           | Marks
"      `Windows`         | Windows
"      `Locate PATTERN`  |  `locate`  command output
"      `History`         |  `v:oldfiles`  and open buffers
"      `History:`        | Command history
"      `History/`        | Search history
"      `Snippets`        | Snippets ({UltiSnips}{6})
"      `Commits`         | Git commits (requires {fugitive.vim}{7})
"      `BCommits`        | Git commits for the current buffer
"      `Commands`        | Commands
"      `Maps`            | Normal mode mappings
"      `Helptags`        | Help tags [1]
"      `Filetypes`       | File types
"
"    nmap:  <leader>fp :FZF 提示输入
"           <leader>ff :FZFFiles
"           <leader>fg :FZFGFiles
"           <leader>fb :FZFBuffers
"           <leader>fa :FZFAg
"           <leader>fA :execute 'FZFAg ' . expand('<cword>')
"           <leader>fh :FZFHistory
"           <leader>fw :FZFWindows
"           <leader>fm :FZFMarks
"           <leader>; :FZFHistory:
"           <leader>fs :FZFSnippets
"           <leader>fc :FZFCommands
"           <leader>/ :FZFHistory/
"           <leader><leader> nmap模式的map
"    omap:  <leader><leader> omap模式的map
"    xmap:  <leader><leader> xmap模式的map
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2017-02-09 16:27:42
"==============================================================

if isdirectory($HOME . '/.fzf/plugin')
    set rtp+=~/.fzf
elseif isdirectory('/usr/local/opt/fzf/plugin')
    set rtp+=/usr/local/opt/fzf
else
    finish
endif

PluginAdd 'junegunn/fzf.vim'
PluginAdd 'tracyone/fzf-funky'
let g:fzf_command_prefix = 'FZF'

nnoremap <leader>fp :FZF
nnoremap <leader>ff :FZFFiles<cr>
nnoremap <leader>fg :FZFGFiles<cr>
nnoremap <leader>fb :FZFBuffers<cr>
nnoremap <leader>fa :FZFAg<cr>
nnoremap <leader>fA :execute 'FZFAg ' . expand('<cword>')<cr>
nnoremap <leader>fh :FZFHistory<cr>
nnoremap <leader>fw :FZFWindows<cr>
nnoremap <leader>fm :FZFMarks<cr>
nnoremap <leader>; :FZFHistory:<cr>
nnoremap <leader>fs :FZFSnippets<cr>
nnoremap <leader>fc :FZFCommands<cr>
nnoremap <leader>/ :FZFHistory/<cr>

nmap <leader><leader> <plug>(fzf-maps-n)
omap <leader><leader> <plug>(fzf-maps-o)
xmap <leader><leader> <plug>(fzf-maps-x)

"----------------------------------------------------------------------
let s:ansi = {'black': 30, 'red': 31, 'green': 32, 'yellow': 33, 'blue': 34, 'magenta': 35, 'cyan': 36}

function! s:ansi(str, group, default, ...) "{{{
  let fg = s:get_color('fg', a:group)
  let bg = s:get_color('bg', a:group)
  let color = s:csi(empty(fg) ? s:ansi[a:default] : fg, 1) .
        \ (empty(bg) ? '' : s:csi(bg, 0))
  return printf("\x1b[%s%sm%s\x1b[m", color, a:0 ? ';1' : '', a:str)
endfunction "}}}

for s:color_name in keys(s:ansi) "{{{
  execute "function! s:".s:color_name."(str, ...)\n"
        \ "  return s:ansi(a:str, get(a:, 1, ''), '".s:color_name."')\n"
        \ "endfunction"
endfor "}}}

function! s:csi(color, fg) "{{{
  let prefix = a:fg ? '38;' : '48;'
  if a:color[0] == '#'
    return prefix.'2;'.join(map([a:color[1:2], a:color[3:4], a:color[5:6]], 'str2nr(v:val, 16)'), ';')
  endif
  return prefix.'5;'.a:color
endfunction "}}}

function! s:get_color(attr, ...) "{{{
  let gui = has('termguicolors') && &termguicolors
  let fam = gui ? 'gui' : 'cterm'
  let pat = gui ? '^#[a-f0-9]\+' : '^[0-9]\+$'
  for group in a:000
    let code = synIDattr(synIDtrans(hlID(group)), a:attr, fam)
    if code =~? pat
      return code
    endif
  endfor
  return ''
endfunction "}}}

let s:TYPE = {'dict': type({}), 'funcref': type(function('call')), 'string': type('')}

function! s:wrap(name, opts, bang) "{{{
  " fzf#wrap does not append --expect if sink or sink* is found
  let opts = copy(a:opts)
  if get(opts, 'options', '') !~ '--expect' && has_key(opts, 'sink*')
    let Sink = remove(opts, 'sink*')
    let wrapped = fzf#wrap(a:name, opts, a:bang)
    let wrapped['sink*'] = Sink
  else
    let wrapped = fzf#wrap(a:name, opts, a:bang)
  endif
  return wrapped
endfunction "}}}

function! s:fzf(name, opts, extra) "{{{
  let [extra, bang] = [{}, 0]
  if len(a:extra) <= 1
    let first = get(a:extra, 0, 0)
    if type(first) == s:TYPE.dict
      let extra = first
    else
      let bang = first
    endif
  elseif len(a:extra) == 2
    let [extra, bang] = a:extra
  else
    throw 'invalid number of arguments'
  endif

  let eopts  = has_key(extra, 'options') ? remove(extra, 'options') : ''
  let merged = extend(copy(a:opts), extra)
  let merged.options = join(filter([get(merged, 'options', ''), eopts], '!empty(v:val)'))
  return fzf#run(s:wrap(a:name, merged, bang))
endfunction "}}}

function! s:search_history_sink(lines) "{{{
  call s:history_sink('/', a:lines)
endfunction "}}}

function! s:history_sink(type, lines) "{{{
  if len(a:lines) < 2
    return
  endif

  let key  = a:lines[0]
  let item = matchstr(a:lines[1], ' *[0-9]\+ *\zs.*')
  if key == 'ctrl-e'
    call histadd(a:type, item)
    redraw
    call feedkeys(a:type."\<up>")
  else
    call feedkeys(a:type.item."\<cr>", 'n')
  endif
endfunction "}}}

