PluginAdd 'mhinz/vim-startify'

let g:startify_session_dir = g:VIMHOME . '.startify_session'
let g:startify_enable_special = 0

" let g:startify_bookmarks = [ {'c': '~/.vimrc'}, '~/.zshrc' ]
let g:startify_bookmarks = []

let g:startify_custom_header = 
            \['*--------------------------------------------------------*',
            \ '| Open: b(same window) s(split) v(vertical split) t(tab) |',
            \ '| Action: q(quit) e(empty buffer) i(insert)  tenfyzhong  |',
            \ '*--------------------------------------------------------*',
            \ '       o                                                  ',
            \ '        o   ^__^                                          ',
            \ '         o  (oo)\_______                                  ',
            \ '            (__)\       )\/\                              ',
            \ '                ||----w |                                 ',
            \ '                ||     ||                                 ',
            \ ]
