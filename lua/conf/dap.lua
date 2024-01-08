local dap = require("dap")
-- dap.adapters.go_headless = {
-- 	type = "server",
-- 	port = "38697",
-- }
dap.adapters.go = {
	type = 'server',
	port = "38697",
	-- executable = {
	-- 	command = 'dlv',
	-- 	args = { 'dap', '-l', '127.0.0.1:${port}' },
	-- }
}
-- 先dlv debug -l 127.0.0.1:38697 --headless ./xxx.go
-- 再 :lua require('dap').contiune() 启动远程调试 再执行程序
dap.configurations.go = {
	{
		type = "go",
		name = "Attach remote",
		mode = "remote",
		request = "attach"
	},
}
dap.adapters.codelldb = {
	type = 'server',
	host = '127.0.0.1',
	port = 13000 -- 💀 Use the port printed out or specified with `--port`
}

require("dapui").setup({
	layouts = { {
		elements = { {
			id = "scopes",
			size = 0.75
		}, {
			id = "breakpoints",
			size = 0.10
		}, {
			id = "stacks",
			size = 0.10
		}, {
			id = "watches",
			size = 0.10
		} },
		position = "left",
		size = 60
	}, {
		elements = { {
			id = "repl",
			size = 0.5
		}, {
			id = "console",
			size = 0.5
		} },
		position = "bottom",
		size = 10
	} },
})
require("nvim-dap-virtual-text").setup()
local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end
