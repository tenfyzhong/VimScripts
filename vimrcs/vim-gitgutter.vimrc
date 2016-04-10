" vim-gitgutter
PluginAdd 'airblade/vim-gitgutter'

if system#IsUnixInMswin()
    let g:gitgutter_sign_removed_first_line = '*'
endif

let g:gitgutter_map_keys = 0
