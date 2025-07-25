-- 获取路径
local codelldb_path = "/home/zerone/.local/share/nvim/mason/packages/codelldb/codelldb"

local dap = require("dap")
dap.adapters.go = {
	type = "server",
	port = "38697",
	-- executable = {
	-- 	command = 'dlv',
	-- 	args = { 'dap', '-l', '127.0.0.1:${port}' },
	-- }
}
-- 先dlv debug -l 127.0.0.1:38697 --headless ./xxx.go
-- 再 :lua require('dap').continue() 启动远程调试 再执行程序
dap.configurations.go = {
	{
		type = "go",
		name = "Attach remote",
		mode = "remote",
		request = "attach",
	},
}
dap.adapters.codelldb = {
	type = "executable",
	command = codelldb_path,
}

-- 配置 Rust 调试配置
-- 注意：运行的是二进制文件，所以程序每次改动完先build后调试才是最新的
-- 不需要手动先启动程序,
-- 先打好断点，然后dapnew 选择这个，
-- 无任何反应时，输入要调试target/debug中的二进制名称
-- 然后回车,再运行或调用接口触发函数
dap.configurations.rust = {
	{
		name = "launch-dap-rust", -- 配置名称
		type = "codelldb", -- 使用的适配器类型
		request = "launch", -- 请求类型改为 attach
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
		end,
	},
}

require("dapui").setup({
	layouts = {
		{
			elements = {
				{
					id = "scopes",
					size = 0.75,
				},
				{
					id = "breakpoints",
					size = 0.10,
				},
				{
					id = "stacks",
					size = 0.10,
				},
				{
					id = "watches",
					size = 0.10,
				},
			},
			position = "left",
			size = 60,
		},
		{
			elements = { {
				id = "repl",
				size = 0.5,
			}, {
				id = "console",
				size = 0.5,
			} },
			position = "bottom",
			size = 10,
		},
	},
})
require("nvim-dap-virtual-text").setup()
local dapui = require("dapui")
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
