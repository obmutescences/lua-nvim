vim.cmd("syntax enable")
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

" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"


" indentLine
autocmd FileType json,markdown,http let g:indentLine_conceallevel = 0
" vim-json
autocmd FileType json,markdown,http let g:vim_json_syntax_conceal = 0

" fitgetui
highlight FidgetTask guifg=#00EE76
highlight FidgetTitle guifg=#00EE76


" hi Comment cterm=italic
" hi Comment guifg=#5C6370 ctermfg=59
" hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi NonText ctermfg=gray guifg=grey10
hi ColorColumn guibg=NONE

" gitsigns
autocmd VimEnter * silent! Gitsigns toggle_current_line_blame

" nvim-tree everforest
hi NvimTreeNormal guibg=#22292D guifg=#77B98B
hi TelescopeBorder guibg=#22292D guifg=#77B98B
hi TelescopeNormal guibg=#22292D guifg=#5d6b66
hi TelescopeSelection guibg=#00EE76

" oh-lucy
" hi TelescopeNormal guibg=#1E1D23 guifg=#FF7DA3
" hi TelescopeBorder guibg=none guifg=#7EC49D
" hi NvimTreeNormal guibg=#1E1D23 guifg=#77B98B
" hi WinSeparator guibg=#1E1D23 guifg=#1E1D23
" hi EndOfBuffer guibg=#1E1D23 guifg=#1E1D23
" hi CmpItemAbbrMatch guifg=#FF7DA3
" hi CmpItemAbbrMatchFuzzy guifg=#FF7DA3

" tokyonight
" hi NvimTreeNormal guibg=#24283b
" hi NvimTreeNormalNC guibg=#24283b
" hi TelescopeSelection guibg=#CD5555


" navigator
hi default GuihuaTextViewDark guifg=#e0d8f4 guibg=#CD5555
hi default GuihuaListDark guifg=#e0d8f4 guibg=#CD5555
hi default GuihuaListSelHl guifg=#548B54 guibg=#8B3A3A

" lsp hints
hi link LspInlayHint Comment

]])
