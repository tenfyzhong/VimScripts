"==============================================================
"    file: string.vim
"   brief: 
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-06-15 22:32:37
"==============================================================

" name_like_this -> NameLikeThis
" NAME_LIKE_THIS -> NameLikeThis
function! string#ToCamelU(content)
  let text = substitute(a:content, '_*\(\w\)\([^_]*\)', '\u\1\L\2', 'g')
  return substitute(text, '_', '', 'g')
endfunction

" name_like_this -> nameLikeThis
" NAME_LIKE_THIS -> nameLikeThis
function! string#ToCamelL(content)
  let text = string#ToCamelU(a:content)
  return substitute(text, '.', '\l&', '')
endfunction

" NameLikeThis -> NAME_LIKE_THIS
function! string#ToUnderScoreU(content)
  let text = substitute(a:content, '\C\(\u[a-z0-9]\+\|[a-z0-9]\+\)\(\u\)', '\1_\2', 'g')
  return substitute(text, '.', '\U&', 'g')
endfunction

" NameLikeThis -> name_like_this
function! string#ToUnderScoreL(content)
  let text = string#ToUnderScoreU(a:content)
  return substitute(text, '.', '\L&', 'g')
endfunction
