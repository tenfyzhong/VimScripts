"==============================================================
"    file: leetcode.vim
"   brief:
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2019-07-16 08:52:43
"==============================================================
PluginAdd 'ianding1/leetcode.vim', {'do': 'pip3 install requests beautifulsoup4 --user'}

let g:leetcode_browser = 'firefox'
let g:leetcode_hide_paid_only = 1
let g:leetcode_hide_topics = 0
let g:leetcode_hide_companies = 1

function! LeetCodeMode()
  let mappings = []
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>ll', ':LeetCodeList<cr>', '<silent>'))
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>lo', ':LeetCodeOpen<cr>', '<silent>'))
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>lr', ':LeetCodeResetInsert<cr>', '<silent>'))
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>ls', ':LeetCodeSubmit<cr>', '<silent>'))
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>lt', ':LeetCodeTest<cr>', '<silent>'))
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>ld', ':LeetCodeToDir<cr>', '<silent>'))
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>da', ':LeetCodeTagDifficulty All<cr>', '<silent>'))
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>de', ':LeetCodeTagDifficulty Easy<cr>', '<silent>'))
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>dm', ':LeetCodeTagDifficulty Medium<cr>', '<silent>'))
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>dh', ':LeetCodeTagDifficulty Hard<cr>', '<silent>'))
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>sa', ':LeetCodeTagStatus All<cr>', '<silent>'))
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>st', ':LeetCodeTagStatus Todo<cr>', '<silent>'))
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>ss', ':LeetCodeTagStatus Solved<cr>', '<silent>'))
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>sd', ':LeetCodeTagStatus Attempted<cr>', '<silent>'))
  call mode#add('leetcode', '', mappings)
  call mode#enable('leetcode')
endfunction

command! -nargs=0 LeetCodeOpen call <sid>leetcode_open()
command! -nargs=0 LeetCodeToDir call <sid>leetcode_to_dir()
command! -nargs=0 LeetCodeInsertExtra call <sid>leetcode_insert_extra()
command! -nargs=0 LeetCodeResetInsert call <sid>leetcode_reset_insert()
command! -nargs=1 -complete=customlist,s:difficulty_complete LeetCodeTagDifficulty call <sid>leetcode_select_tag('^## Difficulty', <q-args>)
command! -nargs=1 -complete=customlist,s:status_complete LeetCodeTagStatus call <sid>leetcode_select_tag('^## Status', <q-args>)

function! s:leetcode_reset_insert() " {{{
  LeetCodeReset
  LeetCodeInsertExtra
endfunction " }}}

function! s:leetcode_open() " {{{
  let path = expand('%:p')
  let dir = fnamemodify(path, ':h:t')
  let filename = fnamemodify(path, ':t:r')
  let slug = ''
  if dir =~# '\d\+-' . filename
    let slug = filename
  else
    let slug = substitute(filename, '\d\+\.\(.*\)', '\1', 'g')
    let slug = substitute(slug, '_', '-', 'g')
  endif

  if get(g:, 'leetcode_china', 0) == 1
    let url = printf('https://leetcode-cn.com/problems/%s/', slug)
  else
    let url = printf('https://leetcode.com/problems/%s/', slug)
  endif
  if executable('xdg-open')
    call system('xdg-open ' . url)
  elseif executable('open')
    call system('open ' . url)
  else
    echoerr 'leetcode: no `open` or equivalent command found.'
  endif
  redraw!
endfunction " }}}

function! s:leetcode_to_dir() " {{{
  let filepath = expand('%:p')
  let filename = expand('%:p:t')
  if filename !~ '\d\+\..*\.\w\+'
    return
  endif

  let fileitems = matchlist(filename, '\(\d\+\)\.\(.*\)\.\(\w\+\)')
  if len(fileitems) < 4
    return
  endif
  let id = fileitems[1]
  let slug = substitute(fileitems[2], '_', '-', 'g')
  let filetype = fileitems[3]

  let root = trim(system('git rev-parse --show-toplevel'))

  let dirname = printf('%s/%04d-%s', root, id, slug)
  let newfile = printf('%s/%s.%s', dirname, slug, filetype)

  " create directory and file
  if !isdirectory(dirname)
    call mkdir(dirname)
  endif
  exec "cd " . dirname
  exec "saveas " . newfile
  call system(printf("rm %s", filepath))

  let title = getline(1)[3:]
  " get the description
  let end_of_description = search('\[End of Description\]', 'n')
  if end_of_description == 0
    return
  endif
  let description = <SID>leetcode_description(end_of_description)

  " create readme
  call <SID>create_readme(slug, title, description)

  " insert test content
  call <sid>leetcode_insert_extra()
endfunction " }}}

let s:head_content = [
      \ '', 
      \ '#ifdef TEST', 
      \ '#define CATCH_CONFIG_MAIN', 
      \ '#include "catch.hpp"', 
      \ '#endif', 
      \ '#include <iostream>', 
      \ 'using namespace std;', 
      \ '']

let s:tail_content = [
      \ '', 
      \ 'static const int fastIO = []() {', 
      \ '    std::ios::sync_with_stdio(false);', 
      \ '    std::cin.tie(nullptr);', 
      \ '    return 0;', 
      \ '}();', 
      \ '', 
      \ '#ifdef TEST', 
      \ 'TEST_CASE("") {', 
      \ '}', 
      \ '#endif']

function! s:leetcode_insert_extra() " {{{
  let end_of_description = search('\[End of Description\]', 'n')
  if end_of_description == 0
    return
  endif

  let ft = &filetype

  if ft == 'cpp'
    call append(end_of_description, s:head_content)
    call append('$', s:tail_content)
    silent w
  endif
endfunction " }}}

function! s:create_readme(slug, title, desc) " {{{
  if filereadable('README.md')
    return
  endif
  let content = []
  call add(content, printf('# [%s](https://leetcode.com/problems/%s/)', a:title, a:slug))
  let content += a:desc
  call add(content, '')
  call add(content, '# 解题思路')
  call writefile(content, 'README.md')
endfunction " }}}

function! s:leetcode_description(end_line_of_description) " {{{
  if a:end_line_of_description < 4
    return []
  endif
  let lines = []
  for i in range(5, a:end_line_of_description-1)
    let line = getline(i)[3:]
    call add(lines, line)
  endfor
  return lines
endfunction " }}}

function! s:leetcode_select_tag(parent, tag) " {{{
  let name = bufname()
  if name !~ '^leetcode:\/\/\/problems'
    return
  endif
  call search(a:parent)
  call search(a:tag, 'z')
  call feedkeys("\<CR>")
endfunction " }}}

function! s:difficulty_complete(A, L, P) " {{{
  return filter(['All', 'Easy', 'Medium', 'Hard'], 'v:val =~# a:A')
endfunction " }}}

function! s:status_complete(A, L, P) " {{{
  return filter(['All', 'Todo', 'Solved', 'Attempted'], 'v:val =~# a:A')
endfunction " }}}

