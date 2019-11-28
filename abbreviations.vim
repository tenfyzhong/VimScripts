ab eles else
ab contineu continue

augroup ft_abbreviate
  au!
  autocmd BufRead,BufNewFile *.py ab <buffer> true True
  autocmd BufRead,BufNewFile *.py ab <buffer> false False
  autocmd BufRead,BufNewFile *.py ab <buffer> none None

  autocmd BufRead,BufNewFile *.proto ab <buffer> int int32
  autocmd BufRead,BufNewFile *.proto ab <buffer> uint uint32
  autocmd BufRead,BufNewFile *.proto ab <buffer> byte bytes
augroup end
