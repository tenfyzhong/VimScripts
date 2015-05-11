" powerline
if version < 702
    InfoLog("version should be greater 7.2")
    finish
endif

PluginAdd 'Lokaltog/vim-powerline'

" let g:Powerline_symbols = 'unicode'
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors"
