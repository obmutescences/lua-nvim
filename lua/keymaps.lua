local Utils = require("utils")

local nnoremap = Utils.nnoremap
local inoremap = Utils.inoremap
local vnoremap = Utils.vnoremap
local cnoremap = Utils.cnoremap
local nmap = Utils.nmap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Save & quit
nnoremap("Q", "<cmd>q<cr>")
nnoremap("<c-q>", "<cmd>q<cr>")
nnoremap("S", "<cmd>w<cr>")

-- undo operations
nnoremap("l", "u")

-- make y to copy till the end of the line
nnoremap("y", "y$")

-- copy to system clipboard
vnoremap("y", '"+y')

-- cursor movement
nnoremap("u", "k")
nnoremap("n", "h")
nnoremap("e", "j")
nnoremap("i", "l")
nnoremap("U", "5k")
nnoremap("E", "5j")
vnoremap("i", "l")
vnoremap("n", "h")
vnoremap("u", "k")

-- delete a word
nnoremap("dw", "daw")

-- N key: go to the start of the line
nnoremap("N", "0")
-- I key: go to the end of the line
nnoremap("I", "$")

-- set h (same as n, cursor left) to 'end of word'
nnoremap("h", "e")

--Ctrl + U or E will move up/down the view port without moving the cursor
nnoremap("<C-U>", "5<C-y>")
nnoremap("<C-E>", "5<C-e>")

-- Insert Mode Cursor Movement
inoremap("<C-a>", "<ESC>A")
inoremap("<C-f>", "<Right>")
inoremap("<C-j>", "<Down>")
inoremap("<C-p>", "<Up>")
inoremap("<C-b>", "<Left>")

--Command Mode Cursor Movement
cnoremap("<C-a>", "<Home>")
cnoremap("<C-e>", "<End>")
cnoremap("<C-p>", "<Up>")
cnoremap("<C-n>", "<Down>")
cnoremap("<C-b>", "<Left>")
cnoremap("<C-f>", "<Right>")
cnoremap("<C-b>", "<S-Left>")
cnoremap("<C-w>", "<S-Right>")

-- Window management
nnoremap("<LEADER>w", "<C-w>w")
-- nnoremap("<LEADER>u", "<C-w>k")
-- nnoremap("<LEADER>e", "<C-w>j")
nnoremap("<LEADER>b", "<C-w>h")
-- nnoremap("<LEADER>i", "<C-w>l")

-- Resize splits with arrow keys
nnoremap("<up>", ":res +5<CR>")
nnoremap("<down>", ":res -5<CR>")
nnoremap("<left>", ":vertical resize-5<CR>")
nnoremap("<right>", ":vertical resize+5<CR>")

-- nvim-tree
nmap("tt", "<cmd>NvimTreeToggle<CR>")

--Telescope
nnoremap("<C-p>", ":Telescope find_files<CR>")
nnoremap("<C-l>", ":Telescope current_buffer_fuzzy_find<CR>")
nnoremap("<LEADER>vv", ":Telescope live_grep<CR>")
nnoremap("<C-;>", ":Telescope file_browser<CR>")
nnoremap("<LEADER>cc", "<cmd>Telescope commands<CR>")
vim.api.nvim_set_keymap(
	"n",
	"<Leader><Leader>",
	[[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
	{ noremap = true, silent = true }
)

-- vim-fugitive
nnoremap("gb", ":Gblame<CR>")

-- goneovim
nnoremap("<C-s>", ":GonvimWorkspacePrevious<CR>")
nnoremap("<C-w>", ":GonvimWorkspaceNew<CR>")

-- Indentation
nnoremap("<", "<<")
nnoremap(">", ">>")

-- zen mode
nmap("<LEADER>nn", "<cmd>TZMinimalist<CR>")

-- find and replace
nnoremap("<LEADER>rr", "<cmd>GrugFar<CR>")

-- neovide change scale
local change_scale_factor_add = function(delta)
	vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + delta
end
local change_scale_factor_delete = function(delta)
	vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - delta
end
vim.keymap.set("n", "<C-=>", function()
	change_scale_factor_add(0.05)
end)
vim.keymap.set("n", "<C-->", function()
	change_scale_factor_delete(0.05)
end)

-- dap
nnoremap("<LEADER>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
nnoremap("<LEADER>dc", "<cmd>lua require'dap'.continue()<CR>")
nnoremap("<LEADER>du", "<cmd>lua require'dapui'.toggle()<CR>")
