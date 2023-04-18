local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	vim.notify("nvim-tree not found!")
	return
end

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end


  -- Default mappings. Feel free to modify or remove as you wish.
  --
  -- BEGIN_DEFAULT_ON_ATTACH
  vim.keymap.set('n', '<C-v>', api.node.open.vertical,                opts('Open: Vertical Split'))
  vim.keymap.set('n', '<C-x>', api.node.open.horizontal,              opts('Open: Horizontal Split'))
  vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', '<Tab>', api.node.open.edit,					  opts('Open'))
  vim.keymap.set('n', 'o',     api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', 'tt',     api.tree.toggle,                    opts('Toggle'))

end

nvim_tree.setup {
	on_attach = on_attach,
	disable_netrw = true,
	hijack_netrw = true,
	open_on_tab = true,
	hijack_cursor = false,
	update_cwd = true,
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
	view = {
		width = 30,
		-- height = 30,
		hide_root_folder = false,
		side = "right",
		number = false,
		relativenumber = false,
		float = {
			enable = false,
			quit_on_focus_loss = false,
		}
	},
	filters = {
        dotfiles = true,
        git_clean = false,
        no_buffer = false,
        custom = {},
        exclude = {},
    },
	actions = {
		open_file = {
			resize_window = true -- close half-screen usage when open a new file
		}
	},
}

-- auto close feature
vim.cmd(
	[[
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]]
)


