-- return settings

local settings = {
	-- every line should be same width without escaped \
	header = {
		type = "text",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "Header",
		margin = 5,
		content = {
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			-- " ",
			-- " ",
			-- " ",
			-- " ",
			-- " ",
			-- " ",
			-- " ",
			-- " ",
			-- " ",
			-- " ",
			" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
			" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
			" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
			" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
			" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
			" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
		},
		highlight = "",
		-- default_color = "#4EEE94",
		default_color = "#b3f4f3",
		oldfiles_amount = 0,
	},
	-- name which will be displayed and command
	body = {
		type = "mapping",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "Basic Commands",
		margin = 5,
		content = {
			{ " Recent Files", "Telescope oldfiles", "<leader>of" },
			{ " Find File", "Telescope find_files", "<leader>ff" },
			{ " File Browser", "Telescope file_browser", "<leader>fb" },
			{ " All Project", "Telescope project", "<leader>ap" },
			{ " Update Plugins", "Lazy", "<leader>pu" },
			{ "󰬶 Find Word", "Telescope live_grep", "<leader>lg" },
		},
		-- everforest
		default_color = "",
		highlight = "String",

		-- hardhacker
		-- default_color = "#e965a5",
		-- highlight = "",

		oldfiles_amount = 0,
	},
	clock = {
		type = "text",
		content = function()
			local clock = " " .. os.date("%H:%M")
			local date = " " .. os.date("%y-%m-%d")
			return { clock, date }
		end,
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "",
		margin = 5,
		-- highlight = "TSString",
		highlight = "",
		-- default_color = "#FFFFFF",
		default_color = "#e965a5",
		oldfiles_amount = 10,
	},

	options = {
		after = function()
			require("startup.utils").oldfiles_mappings()
		end,
		mapping_keys = true,
		cursor_column = 0.5,
		empty_lines_between_mappings = true,
		disable_statuslines = true,
		paddings = { 1, 3, 3, 0 },
	},
	mappings = {
		execute_command = "<CR>",
		open_file = "o",
		open_file_split = "<c-o>",
		open_section = "<TAB>",
		open_help = "?",
	},
	colors = {
		-- background = "#1f2227",
		background = "none",
		folded_section = "#56b6c2",
	},
	parts = { "header", "body", "clock" },
}
return settings
