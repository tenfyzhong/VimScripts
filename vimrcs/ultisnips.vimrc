" ultisnips
if !has('python')
    finish
endif

PluginAdd 'SirVer/ultisnips'
PluginAdd 'honza/vim-snippets'

let g:UltiSnipsEditSplit            = "horizontal"
let g:UltiSnipsExpandTrigger        = "<tab>"
let g:UltiSnipsJumpForwardTrigger   = "<tab>"
let g:UltiSnipsJumpBackwardTrigger  = "<s-tab>"

