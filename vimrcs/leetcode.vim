"==============================================================
"    file: leetcode.vim
"   brief:
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2019-07-16 08:52:43
"==============================================================
PluginAdd 'ianding1/leetcode.vim', {'do': 'pip3 install requests beautifulsoup4 --user'}

let g:leetcode_company_enable = 0
let g:leetcode_topic_enable = 1
let g:leetcode_paid_only_enable = 0
let g:leetcode_browser = 'firefox'

function! LeetCodeMode()
  let mappings = []
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>ll', ':LeetCodeList<cr>', '<silent>'))
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>lo', ':LeetCodeOpen<cr>', '<silent>'))
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>lr', ':LeetCodeResetInsert<cr>', '<silent>'))
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>ls', ':LeetCodeSubmit<cr>', '<silent>'))
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>lt', ':LeetCodeTest<cr>', '<silent>'))
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>ld', ':LeetCodeToDir<cr>', '<silent>'))
  call mode#add('leetcode', '', mappings)
  call mode#enable('leetcode')
endfunction

augroup leetcode_vim_init
  au!
  autocmd FileType leetcode nnoremap <silent><buffer><leader>da :LeetCodeDifficulty All<cr>
  autocmd FileType leetcode nnoremap <silent><buffer><leader>de :LeetCodeDifficulty Easy<cr>
  autocmd FileType leetcode nnoremap <silent><buffer><leader>dm :LeetCodeDifficulty Medium<cr>
  autocmd FileType leetcode nnoremap <silent><buffer><leader>dh :LeetCodeDifficulty Hard<cr>
  autocmd FileType leetcode nnoremap <silent><buffer><leader>sa :LeetCodeStatus All<cr>
  autocmd FileType leetcode nnoremap <silent><buffer><leader>st :LeetCodeStatus Todo<cr>
  autocmd FileType leetcode nnoremap <silent><buffer><leader>ss :LeetCodeStatus Solved<cr>
  autocmd FileType leetcode nnoremap <silent><buffer><leader>sd :LeetCodeStatus Attempted<cr>
augroup end


command! -nargs=0 LeetCodeOpen call <sid>leetcode_open()
command! -nargs=0 LeetCodeToDir :call <sid>leetcode_to_dir()
command! -nargs=0 LeetCodeInsertExtra :call <sid>leetcode_insert_extra()
command! -nargs=0 LeetCodeResetInsert :call <sid>leetcode_reset_insert()

function! s:leetcode_reset_insert() " {{{
  LeetCodeReset
  LeetCodeInsertExtra
endfunction " }}}


function! s:leetcode_open() " {{{
  let slug = expand('%:t:r')
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

  let dirname = printf('%04d-%s', id, slug)
  let newfile = printf('%s.%s', slug, filetype)

  " create directory and file
  if !isdirectory(dirname)
    call mkdir(dirname)
  endif
  exec "cd " . dirname
  exec "saveas " . newfile
  call system(printf("rm ../%s", filename))

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

function! s:leetcode_insert_extra() " {{{
  let end_of_description = search('\[End of Description\]', 'n')
  if end_of_description == 0
    return
  endif

  let ft = &filetype

  if ft == 'cpp'
    let content = ['', '#ifdef TEST', '#define CATCH_CONFIG_MAIN', '#include "catch.hpp"', '#endif', '#include <iostream>', 'using namespace std;', '']
    call append(end_of_description, content)

    let content = ['', 'static const int fastIO = []() {', '    std::ios::sync_with_stdio(false);', '    std::cin.tie(nullptr);', '    return 0;', '}();', '', '#ifdef TEST', 'TEST_CASE("") {', '}', '#endif']
    call append('$', content)
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

