" powerline
if version < 702
    call vimlog#InfoLog("version should be greater 7.2")
    finish
endif

PluginAdd 'Lokaltog/vim-powerline'

" let g:Powerline_symbols = 'unicode'
let g:Powerline_stl_path_style = 'filename'

