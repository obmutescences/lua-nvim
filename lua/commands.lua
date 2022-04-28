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
vim.cmd('syntax sync minlines=256')
vim.cmd('autocmd BufEnter * silent! lcd %:p:h')

vim.cmd([[

set guifont=CodeNewRoman\ Nerd\ Font\ Mono:h15:cANSI

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
	endif
endfunc

set noexpandtab
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

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
" === Far.vim
" ===
noremap <LEADER>f :F  **/*<left><left><left><left><left>
let g:far#mapping = {
			\ "replace_undo" : ["l"],
			\ }


" ===
" === Ultisnips
" ===
let g:tex_flavor = "latex"
inoremap <c-n> <nop>
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/', $HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips/']
silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>
" Solve extreme insert-mode lag on macOS (by disabling autotrigger)
augroup ultisnips_no_auto_expansion
	au!
	au VimEnter * au! UltiSnips_AutoTrigger
augroup END

" ===
" === anzu
" ===
set statusline=%{anzu#search_status()}
nnoremap = n
nnoremap - N


" ===
" === vim-easy-align
" ===
" xmap ga <Plug>(EasyAlign)
" nmap ga <Plug>(EasyAlign)

" ===
" === rainbow
" ===
let g:rainbow_active = 1


" ===
" === vim-illuminate
" ===
let g:illuminate_delay = 750
hi illuminatedword cterm=undercurl gui=undercurl


" ===
" === vim-rooter
" ===
let g:rooter_patterns = ['__vim_project_root', '.git/', '.gitignore', 'go.mod']



" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"

" ale
let g:airline#extensions#ale#enabled = 1

]])
