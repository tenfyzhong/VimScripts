"==============================================================
"    file: vim-taskwarrior.vim
"   brief: taskwarrior管理
"
" | a = add task    | m = modify      | S = taskd sync    | <F1> = this help     |
" | A = annotate    | M = mod prompts | s = sort col      | <CR> = task info     |
" | d = task done   | q = quit buffer | < = sort incr     | <C>c = abort         |
" | D = task delete | r = new report  | > = sort decr     | <Del> = task/anno    |
" | c = task cmd    | u = undo last   | <TAB> = next col  | <Space> = (de)select |
" | f = add filter  | x = del annot   | <S-TAB>= prev col | p  = dupe select     |
" | H = cycle fmt l | + = start task  | <right>= r field  | R  = refresh         |
" | L = cycle fmt r | - = stop task   | <left> = l field  | X  = clear done      |
" | J = next entry  | K = prev entry  | B = new bookmark  | o  = open annotation |

" nmap:
" :TW [args]            " task [filter report arguments]
" :TWUndo               " undo the previous modification
" :TWEditTaskrc         " edit ~/.taskrc
" :TWEditVitrc          " edit ~/.vitrc
" :TWDeleteCompleted    " clear all completed tasks
" :TWAdd                " add new tasks interactively
" :TWAnnotate           " add an annotation
" :TWComplete           " mark task done
" :TWDelete             " deleta a task
" :TWDeleteAnnotation   " delete an annotation
" :TWModifyInteractive  " make changes to a task interactively (use with caution!)
" :TWReportInfo         " run the info report
" :TWReportSort [args]  " overide the sort method, reset to default if no arguments passed
" :TWSync               " synchronise with taskd server
" :TWToggleReadonly     " toggle readonly option
" :TWToggleHLField      " toggle highlight field option
" :TWHistory            " list history records using unite.vim
" :TWHistoryClear       " clear history
" :TWBookmark           " list bookmarks using unite.vim
" :TWBookmarkClear      " clear bookmarks
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2018-07-15 23:20:31
"==============================================================
PluginAdd 'blindFS/vim-taskwarrior'

let g:task_default_prompt = ['due', 'project', 'description', 'tag']
