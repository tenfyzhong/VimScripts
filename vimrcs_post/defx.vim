function! DefxRoot(path)
  let root = system('git rev-parse --show-toplevel 2> /dev/null')
  let root = substitute(root, '\n', '', '')
  let project = fnamemodify(root, ':t')
  if root != ''
    return fnamemodify(a:path, ':p:s?'.root.'?$/'.project.'?:~')
  else
    return fnamemodify(a:path, ':p:~')
  endif
endfunction

call defx#custom#source('file', {
      \ 'root': 'DefxRoot',
      \ })

call defx#custom#column('indent', 'indent', ' ')
call defx#custom#column('time', 'format', '%y-%m-%d %H:%M')
" call defx#custom#column('space', '')

call defx#custom#column('icon', {
      \ 'directory_icon': '▸ ',
      \ 'file_icon': '  ',
      \ 'opened_icon': '▾ ',
      \ 'root_icon': '  ',
      \ })

call defx#custom#column('mark', {
      \ 'readonly_icon': '✗',
      \ 'selected_icon': '✓',
      \ 'length': 0,
      \ })

call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'toggle': 1,
      \ 'resume': 1,
      \ 'columns': 'git:indent:icons:filename',
	  \ 'root_marker': '',
      \ 'ignored_files': '.*,*.a,*.so,*.o,*.d,*.swp,*.bak,*~,tags,cscope.*,*.pyc',
      \ 'auto_cd': 1,
      \ })

call defx#custom#column('filename', {
      \ 'root_marker_highlight': 'Ignore',
      \ })

call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ })

call defx#custom#column('git', 'column_length', 1)
