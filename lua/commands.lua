vim.cmd("syntax enable")
-- vim.cmd('syntax sync minlines=256')
vim.cmd("autocmd BufEnter * silent! lcd %:p:h")

vim.cmd([[

" set guifont=CodeNewRoman\ Nerd\ Font\ Mono:h15:i:#e-antialias:#h-none
" set guifont=CodeNewRoman\ Nerd\ Font:h14:#e-antialias:#h-none,SimSong
" set guifont=UbuntuMono\ Nerd\ Font\ Mono:h14:#e-antialias:#h-none,SimSong
" set guifont=Ubuntu\ Mono:h12:w1.2:#e-antialias:#h-none
" set guifont=Gintronic:h12
" set guifont=Consola\ Mono:h12:w1.1:#e-antialias:#h-none
" set guifont=ConsolaMono:h13:w1.2
" set guifont=Comic\ Shanns:h14
" set guifont=Comic\ Code\ Ligatures:h12:w1.2
" set guifont=Rec\ Mono\ Custom:h13
" set guifont=Comic\ Code:h10:w1.0:#e-antialias:#h-none
" set guifont=Monaspace\ Radon:h9:w1.0:#e-antialias:#h-full


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
let g:rooter_patterns = ['.git/', 'go.mod', 'Cargo.toml', 'package.json']

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

" gitsigns
autocmd VimEnter * silent! Gitsigns toggle_current_line_blame

" nvim-tree everforest
" hi NvimTreeNormal guibg=#22292D guifg=#77B98B
" hi TelescopeBorder guibg=#22292D guifg=#77B98B
" hi TelescopeNormal guibg=#22292D guifg=#5d6b66

" oh-lucy
hi TelescopeNormal guibg=#1E1D23 guifg=#FF7DA3
hi TelescopeBorder guibg=#22292D guifg=#7EC49D
hi NvimTreeNormal guibg=#1E1D23 guifg=#77B98B
hi WinSeparator guibg=#1E1D23 guifg=#1E1D23
hi EndOfBuffer guibg=#1E1D23 guifg=#1E1D23
hi CmpItemAbbrMatch guifg=#FF7DA3
hi CmpItemAbbrMatchFuzzy guifg=#FF7DA3

" navigator
hi default GuihuaTextViewDark guifg=#e0d8f4 guibg=#CD5555
hi default GuihuaListDark guifg=#e0d8f4 guibg=#CD5555
hi default GuihuaListSelHl guifg=#548B54 guibg=#8B3A3A

" lsp hints
hi link LspInlayHint Comment

]])

if vim.g.nvui then
	vim.cmd([[
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
	]])
end
