local status_ok, db = pcall(require, "dashboard")
if not status_ok then
	return
end

db.setup({
	theme = "hyper",
	config = {
		header = {
		'      ▐██      ▄█  ███  █▄      ██▌        ',
		'     ▐██▌     ██████████████     ▐██▌      ',
		'    ████     ████████████████    ████      ',
		'    ▐█████  ██████████████████  █████▌     ',
		'    ████████████████████████████████       ',
		'     ███████▀▀████████████▀▀███████        ',
		'      █████▌  ▄▄ ▀████▀ ▄▄  ▐█████         ',
		'    ▄▄██████▄ ▀▀  ████  ▀▀ ▄██████▄▄       ',
		'    ██████████████████████████████████     ',
		'  ████████████████████████████████████     ',
		' ██████   ███████▀▄██▄▀███████   ██████▌   ',
		'▐█████     ██████████████████      █████▌  ',
		' ▐█████      ██████▀  ▀██████       █████▌ ',
		'  █████▄      ███        ███      ▄█████   ',
		'    ██████     █          █     ██████     ',
		'     █████                     █████       ',
		'      █████                   █████        ',
		'      ████   ▄            ▄    ████        ',
		'        ████ ██           ██ ████          ',
		'          ████████ ▄██▄ ████████           ',
		'         ████████████████████████          ',
		'         ████████████████████████          ',
		'          ▀█████████▀▀█████████▀           ',
		'            ▀███▀       ▀███▀              ',
		},
	}
})

db.session_directory = '~/.config/nvim/.sessions'
db.default_executive = 'telescope'
vim.cmd("let g:dashboard_default_executive = 'telescope'")

vim.cmd("let g:dashboard_session_directory = $HOME..'/.config/nvim/.sessions'")
vim.cmd("let packages = len(globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))")

vim.api.nvim_exec([[
    let g:dashboard_custom_footer = ['LuaJIT loaded '..packages..' packages']
]], false)
