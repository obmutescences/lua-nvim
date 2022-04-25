local Utils = require('utils')

-- local exprnnoremap = Utils.exprnnoremap
local nnoremap = Utils.nnoremap
local vnoremap = Utils.vnoremap
-- local xnoremap = Utils.xnoremap
local inoremap = Utils.inoremap
local cnoremap = Utils.cnoremap
-- local tnoremap = Utils.tnoremap
local nmap = Utils.nmap
-- local xmap = Utils.xmap

vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Save & quit
nnoremap("Q", ":q<CR>")
nnoremap("<C-q>", ":q<CR>")
nnoremap("S", ":w<CR>")

-- Open Startify
nnoremap("<LEADER>st", ":Startify<CR>")

-- Undo operations
nnoremap("l", "u")

--Insert Key
nnoremap("k", "i")
nnoremap("k", "I")

-- make Y to copy till the end of the line
nnoremap("Y", "y$")

-- Copy to system clipboard
vnoremap("Y", '"+y')

-- Cursor Movement
nnoremap("u", "k")
nnoremap("n", "h")
nnoremap("e", "j")
nnoremap("i", "l")
nnoremap("gu", "gk")
nnoremap("ge", "gj")
nnoremap("U", "5k")
nnoremap("E", "5j")


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
nnoremap("<LEADER>u", "<C-w>k")
nnoremap("<LEADER>e", "<C-w>j")
nnoremap("<LEADER>n", "<C-w>h")
nnoremap("<LEADER>i", "<C-w>l")

--split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
-- noremap su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
-- noremap se :set splitbelow<CR>:split<CR>
-- noremap sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
-- noremap si :set splitright<CR>:vsplit<CR>


-- Resize splits with arrow keys
nnoremap("<up>", ":res +5<CR>")
nnoremap("<down>", ":res -5<CR>")
nnoremap("<left>", ":vertical resize-5<CR>")
nnoremap("<right>", ":vertical resize+5<CR>")


-- Press ` to change case (instead of ~)
nnoremap("`", "~")
nnoremap("<C-c>", "zz")

nnoremap("\\s", ":%s//g<left><left>")


--Compile function
nnoremap("r", ":call CompileRunGcc()<CR>")

-- clap
nnoremap("<C-i>", ":Clap filer<CR>")


--Telescope
nnoremap("<C-p>", ":Telescope find_files<CR>")
nnoremap("<C-l>", ":Telescope current_buffer_fuzzy_find<CR>")

-- GitGutter
nnoremap("<LEADER>gf", ":GitGutterFold<CR>")
nnoremap("H", ":GitGutterPreviewHunk<CR>")
nnoremap("<LEADER>g-", ":GitGutterPrevHunk<CR>")
nnoremap("<LEADER>g=", ":GitGutterNextHunk<CR>")

-- vim-fugitive
nnoremap("gb", ":Gblame<CR>")

-- Undotree
nnoremap("L", ":UndotreeToggle<CR>")

-- goneovim
nnoremap("<C-s>", ":GonvimWorkspacePrevious<CR>")
nnoremap("<C-w>", ":GonvimWorkspaceNew<CR>")

-- Indentation
nnoremap("<", "<<")
nnoremap(">", ">>")

-- goyo
nmap('<LEADER>n', ':Goyo<CR>')


-- nvim-tree
nmap("tt", ":NvimTreeToggle<CR>")
