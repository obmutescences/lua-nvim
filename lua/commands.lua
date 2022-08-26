-- -- Define commands

-- -- Remove trailing whitespaces
-- -- (if a file requires trailing spaces, exclude its type using the regex)
-- vim.cmd [[autocmd BufWritePre * %s/\s\+$//e ]]

-- -- Swap folder
-- vim.cmd('command! ListSwap split | enew | r !ls -l ~/.local/share/nvim/swap')
-- vim.cmd('command! CleanSwap !rm -rf ~/.local/share/nvim/swap/')

-- -- Open help tags
-- vim.cmd("command! HelpTags Telescope help_tags")

-- -- Create ctags
-- vim.cmd('command! MakeCTags !ctags -R --exclude=@.ctagsignore .')


---- my---

vim.cmd('syntax enable')
-- vim.cmd('syntax sync minlines=256')
vim.cmd('autocmd BufEnter * silent! lcd %:p:h')

vim.cmd([[

" set guifont=CodeNewRoman\ Nerd\ Font\ Mono:h14:i
set guifont=CodeNewRoman\ Nerd\ Font:h14
" set guifont=UbuntuMono\ Nerd\ Font\ Mono:h15:cANSI


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
autocmd BufWritePost * GitGutter
"autocmd BufEnter * hi ColorColumn guibg=NONE ctermbg=NONE
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
" === anzu
" ===
set statusline=%{anzu#search_status()}
nnoremap = n
nnoremap - N

" ===
" === rainbow
" ===
let g:rainbow_active = 1


" ===
" === vim-illuminate
" ===
let g:Illuminate_delay = 400


" ===
" === vim-rooter
" ===
let g:rooter_patterns = ['__vim_project_root', '.git/', '.gitignore', 'go.mod', 'Cargo.lock']

" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"

" ale
" let g:airline#extensions#ale#enabled = 1


" vim-json

" indentLine 
autocmd FileType json,markdown,http let g:indentLine_conceallevel = 0
" vim-json
autocmd FileType json,markdown,http let g:vim_json_syntax_conceal = 0


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
