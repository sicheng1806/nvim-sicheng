local utils = require("utils")
-- LSP服务启动basedpyright
---@type LazySpec
return {
	{
		"nvim-treesitter/nvim-treesitter",
		optional = true,
		opts = function(_, opts)
			if opts.ensure_installed ~= "all" then
				opts.ensure_installed =
					utils.table_insert_unique(opts.ensure_installed, { "python", "toml", "ninja", "rst" })
			end
		end,
	},
	{
		-- 虚拟环境管理工具
		"linux-cultist/venv-selector.nvim",
		ft = "python",
		branch = "regexp",
		enabled = true,
		dependencies = {
			{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
		},
		opts = {},
		event = "VeryLazy",
		cmd = "VenvSelect",
	},
	{
		-- 测试框架
		"nvim-neotest/neotest",
		optional = true,
		dependencies = { "nvim-neotest/neotest-python" },
		opts = function(_, opts)
			if not opts.adapters then
				opts.adapters = {}
			end
			table.insert(
				opts.adapters,
				require("neotest-python")({
					dap = { justMyCode = true },
					-- args = { "--log-level", "DEBUG" },
					-- runner = "pytest",
				})
			)
		end,
	},
}
