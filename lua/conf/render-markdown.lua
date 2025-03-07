-- 引入everforest的颜色变量
local colors = {
	bg0 = "#2D353B", -- 主背景
	bg1 = "#343F44", -- 较深背景（如折叠区域）
	bg4 = "#4F585E", -- 分割线/空白符背景
	bg_red = "#514045", -- 错误背景（深红灰）
	bg_green = "#425047", -- 新增背景（深绿灰）
	bg_blue = "#3A515D", -- 修改背景（深蓝灰）
	bg_yellow = "#4D4C43", -- 警告背景
	fg = "#D3C6AA", -- 默认文字
	red = "#E67E80", -- 强烈红色（错误）
	orange = "#E69875", -- 橙色（操作符）
	green = "#A7C080", -- 绿色（字符串/函数）
	yellow = "#DBBC7F", -- 黄色（警告）
	purple = "#D699B6", -- 紫色（常量）
	grey0 = "#7FBBB3", -- 浅灰（备用）
	grey1 = "#859289", -- 注释灰
}

-- 标题高亮（强化层次感）
vim.api.nvim_set_hl(0, "RenderMarkdownH1", { fg = colors.green, bold = true }) -- H1标题（绿色加粗）
vim.api.nvim_set_hl(0, "RenderMarkdownH2", { fg = colors.orange, bold = true }) -- H2标题（橙色加粗）
vim.api.nvim_set_hl(0, "RenderMarkdownH3", { fg = colors.purple, bold = true }) -- H3标题（紫色加粗）
vim.api.nvim_set_hl(0, "RenderMarkdownH4", { fg = colors.yellow, italic = true }) -- H4标题（黄色斜体）
vim.api.nvim_set_hl(0, "RenderMarkdownH5", { fg = colors.red, italic = true }) -- H5标题（红色斜体）

-- 标题背景（使用更暗的Diff背景色）
vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { bg = colors.bg_green }) -- 新增背景（深绿灰）
vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { bg = colors.bg_blue }) -- 修改背景（深蓝灰）
vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { bg = colors.bg_red }) -- 错误背景（深红灰）
vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { bg = colors.bg4 }) -- 浅灰色背景
vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { bg = colors.bg4 })
vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { bg = colors.bg4 })

-- 代码块（调暗背景）
vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = colors.bg1 }) -- 深背景
vim.api.nvim_set_hl(0, "RenderMarkdownCodeInline", { bg = colors.bg4 })
vim.api.nvim_set_hl(0, "RenderMarkdownInlineHighlight", { fg = colors.green }) -- 绿色突出

-- 列表和引用（增加绿色和红色）
vim.api.nvim_set_hl(0, "RenderMarkdownBullet", { fg = colors.green }) -- 绿色列表符号
vim.api.nvim_set_hl(0, "RenderMarkdownQuote", { fg = colors.yellow }) -- 黄色引用块
vim.api.nvim_set_hl(0, "RenderMarkdownDash", { fg = colors.grey1 }) -- 浅灰分隔线

-- 数学公式和表格（强化颜色对比）
vim.api.nvim_set_hl(0, "RenderMarkdownMath", { fg = colors.purple, italic = true }) -- 紫色斜体公式
vim.api.nvim_set_hl(0, "RenderMarkdownTableHead", { fg = colors.red }) -- 红色表格标题

-- 提示/警告信息（突出红色和绿色）
vim.api.nvim_set_hl(0, "RenderMarkdownSuccess", { fg = colors.green }) -- 成功绿色
vim.api.nvim_set_hl(0, "RenderMarkdownInfo", { fg = colors.green }) -- 信息绿
vim.api.nvim_set_hl(0, "RenderMarkdownHint", { fg = colors.yellow }) -- 提示黄
vim.api.nvim_set_hl(0, "RenderMarkdownWarn", { fg = colors.orange }) -- 警告橙
vim.api.nvim_set_hl(0, "RenderMarkdownError", { fg = colors.red }) -- 错误红

-- 链接和特殊符号（减少蓝色）
vim.api.nvim_set_hl(0, "RenderMarkdownLink", { fg = colors.purple }) -- 紫色链接
vim.api.nvim_set_hl(0, "RenderMarkdownChecked", { fg = colors.green }) -- 绿色复选框
vim.api.nvim_set_hl(0, "RenderMarkdownUnchecked", { fg = colors.red }) -- 红色未选框

-- 调整其他元素（更暗的背景）
vim.api.nvim_set_hl(0, "RenderMarkdownSign", { bg = colors.bg0 }) -- 主背景符号列
vim.api.nvim_set_hl(0, "RenderMarkdownHtmlComment", { fg = colors.grey1 }) -- 浅灰注释
