"==============================================================
"    file: leetcode.vim
"   brief:
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2019-07-16 08:52:43
"==============================================================
PluginAdd 'ianding1/leetcode.vim', {'do': 'pip3 install requests beautifulsoup4 --user'}

let g:leetcode_china = 0
let g:leetcode_browser = 'firefox'
let g:leetcode_hide_paid_only = 1
let g:leetcode_hide_topics = 0
let g:leetcode_hide_companies = 1
let g:leetcode_problemset = 'algorithms'

function! LeetCodeMode()
  let mappings = []
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>ll', ':LeetCodeList<cr>', '<silent>'))
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>lo', ':LeetCodeOpen<cr>', '<silent>'))
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>lr', ':LeetCodeResetInsert<cr>', '<silent>'))
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>ls', ':LeetCodeSubmit<cr>', '<silent>'))
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>lt', ':LeetCodeTest<cr>', '<silent>'))
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>cd', ':LeetCodeCD<cr>', '<silent>'))
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>ci', ':LeetCodeCommit<cr>', '<silent>'))
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

  augroup leetcode_mode_local_inif
    au!
    autocmd BufWritePre *.cpp LeetCodeCD
  augroup end
endfunction

command! -nargs=0 LeetCodeOpen call <sid>leetcode_open()
command! -nargs=0 LeetCodeCD call <sid>leetcode_cd()
command! -nargs=0 LeetCodeInsertExtra call <sid>leetcode_insert_extra()
command! -nargs=0 LeetCodeResetInsert call <sid>leetcode_reset_insert()
command! -nargs=0 LeetCodeCommit call <sid>leetcode_commit()
command! -nargs=1 -complete=customlist,s:difficulty_complete LeetCodeTagDifficulty call <sid>leetcode_select_tag('^## Difficulty', <q-args>)
command! -nargs=1 -complete=customlist,s:status_complete LeetCodeTagStatus call <sid>leetcode_select_tag('^## Status', <q-args>)

function! s:leetcode_commit() " {{{
  let path = expand('%:p')
  let dir = fnamemodify(path, ':h:t')
  let filename = fnamemodify(path, ':t:r')
  let slug = ''
  let root = trim(system('git rev-parse --show-toplevel'))
  if fnamemodify(path, ':h') ==# root
    echo 'Please open the solution file and try again.'
    return
  endif

  call system(printf('cd %s; git add .; git commit -m "解决%s" > /dev/null', fnamemodify(path, ':h'), dir))
  redraw!
  echo printf("<%s> commited!", dir)
endfunction " }}}


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

function! s:leetcode_cd() " {{{
  let filepath = expand('%:p')
  let filename = expand('%:p:t')
  if filename !~ '^.\+\.\w\+\.\w\+$'
    return
  endif

  let fileitems = matchlist(filename, '^\(.\+\)\.\(\w\+\)\.\(\w\+\)$')
  if len(fileitems) < 4
    return
  endif
  let id = fileitems[1]
  let slug = substitute(fileitems[2], '_', '-', 'g')
  let filetype = fileitems[3]

  let root = trim(system('git rev-parse --show-toplevel'))

  let dirname = printf('%s/%04s-%s', root, id, slug)
  let newfile = printf('%s/%s.%s', dirname, slug, filetype)
  if filereadable(newfile)
    if input(printf('%s/%s.%s existed, continue? (y/N): ', fnamemodify(dirname, ':t'), slug, filetype)) !=? "y"
      let newfile  = printf('%s/%s', root, filename)
      exec 'saveas! ' . newfile
      return
    endif
  endif

  " create directory and file
  if !isdirectory(dirname)
    call mkdir(dirname)
  endif
  exec "cd " . dirname
  exec "saveas! " . newfile
  call system(printf("rm %s", filepath))


  " get the description
  let description_name = printf('[DESCRIPTION] %s.%s', id, slug)
  let title = getbufline(bufnr(description_name), 2)[0][3:]
  let description = <SID>leetcode_description(description_name)

  " create readme
  call <SID>create_readme(slug, title, description)

  " insert test content
  call <sid>leetcode_insert_extra()
endfunction " }}}

let s:head_content = [
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
  let ft = &filetype

  if ft == 'cpp'
    if search('#define CATCH_CONFIG_MAIN', 'n') == 0
      call append(0, s:head_content)
    endif
    if search('std::ios::sync_with_stdio', 'n') == 0
      call append('$', s:tail_content)
    endif
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

function! s:leetcode_description(bufname) " {{{
  let expr = bufnr(a:bufname)
  if expr == -1
    return []
  endif
  let lines = getbufline(expr, 1, '$')[5:-2]
  return map(lines, 'v:val[3:]')
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

