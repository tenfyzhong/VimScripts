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
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>lr', ':LeetCodeReset<cr>', '<silent>'))
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>ls', ':LeetCodeSubmit<cr>', '<silent>'))
  call add(mappings, mode#mapping#create('n', 1, 0, '<leader>lt', ':LeetCodeTest<cr>', '<silent>'))
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

function! s:leetcode_open()
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
endfunction

function! LeetcodeCRPre(problem)
  if a:problem == {}
    return
  endif
  let root = trim(system('git rev-parse --show-toplevel 2>/dev/null'))
  let problem_id = a:problem['fid']
  let problem_slug = a:problem['slug']
  if root != ''
    call <sid>TryCd(root, problem_id, problem_slug)
  endif
endfunction

function! LeetcodeResetSolutionAfter(problem)
  call <sid>create_readme(a:problem['slug'], a:problem['title'], a:problem['desc'])
  let ft = &ft
  if ft == 'cpp'
    let pos = getcurpos()
    call cursor(1, 1)
    let search_if_test = search('ifdef TEST')
    if search_if_test == 0
      call <SID>afterComment(ft)
      call <SID>afterCode(ft)
    endif
    call setpos('.', pos)
  endif
endfunction

function! s:TryCd(root, id, slug)
  let dir = printf('%04d-%s', a:id, a:slug)
  exec "cd " . a:root
  if !isdirectory(dir)
    call mkdir(dir)
  endif
  exec "cd " . dir
endfunction

function! s:create_readme(slug, title, desc)
  if filereadable('README.md')
    return
  endif
  let content = []
  call add(content, printf('# [%s](https://leetcode.com/problems/%s/)', a:title, a:slug))
  let content += a:desc
  call add(content, '')
  call add(content, '# 解题思路')
  call writefile(content, 'README.md')
endfunction

function! s:afterComment(ft)
  if a:ft == 'cpp'
    let content = ['', '#ifdef TEST', '#define CATCH_CONFIG_MAIN', '#include "catch.hpp"', '#endif', '#include <iostream>', 'using namespace std;', '']
    let search_end_of_description = search('\[End of Description\]')
    if search_end_of_description == 0
      return
    endif
    call append(search_end_of_description, content)
  endif
endfunction

function! s:afterCode(ft)
  if a:ft == 'cpp'
    let content = ['', 'static const int fastIO = []() {', '    std::ios::sync_with_stdio(false);', '    std::cin.tie(nullptr);', '    return 0;', '}();', '', '#ifdef TEST', 'TEST_CASE("") {', '}', '#endif']
    call append('$', content)
  endif
endfunction
