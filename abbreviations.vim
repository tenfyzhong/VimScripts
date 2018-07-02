ab eles else
ab contineu continue

augroup pyabbreviate
  autocmd BufRead,BufNewFile *.py ab <buffer> true True
  autocmd BufRead,BufNewFile *.py ab <buffer> false True
  autocmd BufRead,BufNewFile *.py ab <buffer> none None
augroup end
