"==============================================================
"    file: vim-open-url.vim
"   brief: 打开链接
"
"    nmap: <leader>ob 在浏览器中打开当前下标的url
"          <leader>og 在google中搜索当前下标的单词
"          <leader>ow 在wikipedia中搜索当前下标的单词
"          <leader>os 在stackoverflow中搜索当前下标的单词
"    vmap: <leader>ob 在浏览器中打开当前选中的url
"          <leader>og 在google中搜索当前选中的内容
"          <leader>ow 在wikipedia中搜索当前选中的内容
"          <leader>os 在stackoverflow中搜索当前选中的内容
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2020-06-10 13:13:30
"==============================================================
Plug 'dhruvasagar/vim-open-url'

let g:open_url_default_mappings = 0

nmap <leader>ob :call <SID>open_url()<cr>
vmap <leader>ob <Plug>(open-url-browser)
nmap <leader>og <Plug>(open-url-search-google)
vmap <leader>og <Plug>(open-url-search-google)
nmap <leader>ow <Plug>(open-url-search-wikipedia)
vmap <leader>ow <Plug>(open-url-search-wikipedia)
vmap <leader>os <Plug>(open-url-search-so)
vmap <leader>os <Plug>(open-url-search-so)

function! s:open_url() abort
  let ft=&ft
  if ft ==# 'vim'
    let line = getline(line('.'))
    let match = matchlist(line, "Plug '\\(.*\\)'")
    if len(match) >= 2
      let url = match[1]
      if url !~? 'https\?:\/\/'
        let url = 'https://github.com/' . url
      endi
      call open_url#open(url)
      return
    endif
  endif
  exec "normal \<Plug>(open-url-browser)"
endfunction
