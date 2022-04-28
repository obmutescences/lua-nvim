" Startify

" Open Startify
noremap <LEADER>st :Startify<CR>

" Don't show [e] and [q] options
let g:startify_enable_special = 0

" Change directory when opening file using Startify
let g:startify_change_to_dir  = 1  " This is the default value

" Add bashrc and nvim config files
let g:startify_bookmarks = [
          \ {'b': '~/.bashrc'},
          \ {'a': '~/.bash_aliases'},
          \ {'n': '~/.config/nvim/init.lua'}
          \ ]

" Change list order
let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'files',     'header': ['   Recent Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]



" ===
" === goyo
" ===

""进入goyo模式后自动触发limelight,退出后则关闭
"autocmd! user goyoenter nested call <sid>goyo_enter()
"autocmd! user goyoleave nested call <sid>goyo_leave()
"let g:goyo_width = 100
"let g:goyo_height = '100%'
"let g:goyo_linenr = 0

"function! s:goyo_enter()
"	if executable('tmux') && strlen($tmux)
"		silent !tmux set status off
"		silent !tmux list-panes -f '\#f' | grep -q z || tmux resize-pane -z
"	endif
"	set noshowmode
"	set noshowcmd
"	set scrolloff=999
"	" let g:limelight_conceal_ctermfg='#5c6370'
"	" let g:limelight_conceal_guifg='#5c6370'
"	" limelight
"	" ...
"endfunction

"function! s:goyo_leave()
"	if executable('tmux') && strlen($tmux)
"		silent !tmux set status on
"		silent !tmux list-panes -f '\#f' | grep -q z && tmux resize-pane -z
"	endif
"	set showmode
"	set showcmd
"	set scrolloff=5
"	" limelight!
"	" hi comment cterm=italic
"	" hi comment guifg=#5c6370 ctermfg=59
"	" hi normal     ctermbg=none guibg=none
"	" hi linenr     ctermbg=none guibg=none
"	" hi signcolumn ctermbg=none guibg=none
"	" hi normal guibg=#011f14
"	" hi comment cterm=italic
"	" hi comment guifg=#5c6370 ctermfg=59
"	" hi normal     ctermbg=none guibg=#323d43
"	hi linenr     ctermbg=none guibg=none
"	hi signcolumn ctermbg=none guibg=none
"	" let g:limelight_conceal_ctermfg='#5c6370'
"	" let g:limelight_conceal_guifg='#5c6370'
"	" limelight!

"	" ...
"endfunction


" hi Comment cterm=italic
" hi Comment guifg=#5C6370 ctermfg=59
" hi Normal     ctermbg=NONE guibg=#323d43
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi NonText ctermfg=gray guifg=grey10
hi ColorColumn guibg=NONE
" let g:clap_layout = { 'relative': 'editor' }
" let g:clap_theme = { 'search_text': {'guifg': 'red', 'ctermfg': 'red'} }
" let g:clap_layout = { 'width': '40%', 'height': '60%', 'col': '15%', 'row': '17%' }
" let g:clap_use_pure_python = 1
" let g:clap_preview_size = 50
" let g:clap_popup_border = 'nil'


" ===
" === vim-go
" ===
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 0
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_variable_declarations = 1
let g:go_doc_keywordprg_enabled = 0

" new add
let g:go_highlight_generate_tags = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

