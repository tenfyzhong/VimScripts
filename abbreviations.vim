ab eles else
ab contineu continue

augroup ft_abbreviate
  au!
  autocmd FileType python ab <buffer> true True
  autocmd FileType python ab <buffer> false False
  autocmd FileType python ab <buffer> none None
  autocmd FileType python ab <buffer> __MAIN__ __main__
  autocmd FileType python ab <buffer> __NAME__ __name__

  autocmd FileType proto ab <buffer> int int32
  autocmd FileType proto ab <buffer> uint uint32
  autocmd FileType proto ab <buffer> byte bytes

augroup end
