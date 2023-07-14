vim.cmd('syntax enable')
-- vim.cmd('syntax sync minlines=256')
vim.cmd('autocmd BufEnter * silent! lcd %:p:h')

vim.cmd([[

" set guifont=CodeNewRoman\ Nerd\ Font\ Mono:h15:i:#e-antialias:#h-none
" set guifont=CodeNewRoman\ Nerd\ Font:h14:#e-antialias:#h-none,SimSong
" set guifont=UbuntuMono\ Nerd\ Font\ Mono:h14:#e-antialias:#h-none,SimSong
" set guifont=Ubuntu\ Mono:h13:#e-antialias:#h-none,SimSong
set guifont=Gintronic:h12:#e-antialias
" set guifont=Hack\ Nerd\ Font\ Mono:h13:#e-antialias:#h-none,SimSong

silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" |


func! CompileRunGcc()
	exec "w"
	if &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	elseif &filetype == 'http'
		:sp
		:lua require('rest-nvim').run()
	endif
endfunc

" set noexpandtab
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" GitGutter
" autocmd BufWritePost * GitGutter
"autocmd BufEnter * hi ColorColumn guibg=NONE ctermbg=NONE
"autocmd BufEnter * hi LineNr guifg=#556B2F
" autocmd BufEnter * hi LineNr guifg=#8B8386
" Undotree
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> u <plug>UndotreeNextState
	nmap <buffer> e <plug>UndotreePreviousState
	nmap <buffer> U 5<plug>UndotreeNextState
	nmap <buffer> E 5<plug>UndotreePreviousState
endfunc

" ===
" === vim-rooter
" ===
let g:rooter_patterns = ['__vim_project_root', '.git/', '.gitignore', 'go.mod', 'Cargo.lock']

" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"


" vim-json

" indentLine
autocmd FileType json,markdown,http let g:indentLine_conceallevel = 0
" vim-json
autocmd FileType json,markdown,http let g:vim_json_syntax_conceal = 0

if exists("g:neovide")
	" let pumblend = 70
	" let winblend = 70
endif

" fitgetui
highlight FidgetTask guifg=#00EE76
highlight FidgetTitle guifg=#00EE76


" hi Comment cterm=italic
" hi Comment guifg=#5C6370 ctermfg=59
" hi Normal     ctermbg=NONE guibg=#01141F
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi NonText ctermfg=gray guifg=grey10
hi ColorColumn guibg=NONE

" ===
" === vim-go
" ===
" let g:go_doc_popup_window = 1
" let g:go_def_mapping_enabled = 0
" let g:go_template_autocreate = 0
" let g:go_textobj_enabled = 0
" let g:go_auto_type_info = 0
" let g:go_def_mapping_enabled = 0
" let g:go_highlight_array_whitespace_error = 0
" let g:go_highlight_build_constraints = 1
" let g:go_highlight_chan_whitespace_error = 0
" let g:go_highlight_extra_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_format_strings = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_function_parameters = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_generate_tags = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_space_tab_error = 0
" let g:go_highlight_string_spellcheck = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_trailing_whitespace_error = 0
" let g:go_highlight_types = 1
" let g:go_highlight_variable_assignments = 1
" let g:go_highlight_variable_declarations = 1
" let g:go_doc_keywordprg_enabled = 0
" let g:go_highlight_generate_tags = 1
" let g:go_highlight_diagnostic_errors = 1
" let g:go_highlight_diagnostic_warnings = 1
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'

" navigator
" autocmd BufEnter * highlight GuihuaListHl guifg=#FF0000 guibg=#323d43
" autocmd BufEnter * highlight GuihuaTextViewDark guifg=#007b43 guibg=#323d43
" autocmd BufEnter * highlight GuihuaListDark guifg=#e4ab9b guibg=#323d43
hi GuihuaTextViewDark guifg=#A23620 guibg=#38503E
hi GuihuaListDark guifg=#A23620 guibg=#38503E
hi GuihuaListHl guifg=#A23620 guibg=#38503E

" gitsigns
autocmd VimEnter * silent! Gitsigns toggle_current_line_blame

" nvim-tree
" hi NvimTreeNormal guibg=#272e33 ctermbg=NONE

" everforest
hi TelescopeBorder guibg=#272e33 guifg=#272e33
hi TelescopeNormal guibg=#272e33 guifg=#5d6b66

" oh-lucy
" hi TelescopeBorder guibg=#14131A guifg=#14131A
" hi TelescopeNormal guibg=#14131A guifg=#6E4D55


]])

if vim.g.nvui then
	vim.cmd [[
	NvuiFullscreen 1
	NvuiScrollAnimationDuration 0.1
	NvuiCursorAnimationDuration 0.2
	NvuiCmdBorderWidth 0.5
	NvuiCmdPadding 15
	NvuiCharspace 1
	" NvuiOpacity 0.7
	NvuiCmdCenterXPos 0.5
	NvuiCmdCenterYPos 0.4
	NvuiCmdWidth 0.2
	NvuiCmdFontFamily Ubuntu Mono
	NvuiCmdFontSize 17
	NvuiFullscreen 1
	NvuiCmdBg #1B5E20
	]]
end
