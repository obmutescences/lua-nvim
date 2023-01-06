" Startify

" Open Startify
noremap <LEADER>st :Startify<CR>

" Don't show [e] and [q] options
let g:startify_enable_special = 1

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

" hi Comment cterm=italic
" hi Comment guifg=#5C6370 ctermfg=59
" hi Normal     ctermbg=NONE guibg=#323d43
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi NonText ctermfg=gray guifg=grey10
hi ColorColumn guibg=NONE

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
let g:go_highlight_generate_tags = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" navigator 
autocmd BufEnter * highlight GuihuaListHl guifg=#FF0000 guibg=#323d43
" autocmd BufEnter * highlight GuihuaTextViewDark guifg=#007b43 guibg=#323d43
" autocmd BufEnter * highlight GuihuaListDark guifg=#e4ab9b guibg=#323d43

" gitsigns
autocmd VimEnter * silent! Gitsigns toggle_current_line_blame
