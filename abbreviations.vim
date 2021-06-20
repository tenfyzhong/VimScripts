iab eles else
iab contineu continue
iab 1= !=

augroup ft_abbreviate
  au!
  autocmd FileType python iab <buffer> true True
  autocmd FileType python iab <buffer> false False
  autocmd FileType python iab <buffer> none None
  autocmd FileType python iab <buffer> __MAIN__ __main__
  autocmd FileType python iab <buffer> __NAME__ __name__

  autocmd FileType proto iab <buffer> int int32
  autocmd FileType proto iab <buffer> uint uint32
  autocmd FileType proto iab <buffer> byte bytes
  autocmd FileType proto iab <buffer> return returns

  autocmd FileType go iab <buffer> ;= :=

  autocmd FileType lua iab <buffer> != ~=
  autocmd FileType lua iab <buffer> 1= ~=

  autocmd FileType nginx iab <buffer> != ~=
  autocmd FileType nginx iab <buffer> 1= ~=

  autocmd FileType thrift iab <buffer> int16 i16
  autocmd FileType thrift iab <buffer> int32 i32
  autocmd FileType thrift iab <buffer> int64 i64

augroup end
