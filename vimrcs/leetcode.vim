"==============================================================
"    file: leetcode.vim
"   brief: 
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2019-07-16 08:52:43
"==============================================================
PluginAdd 'tenfyzhong/leetcode.vim'

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

