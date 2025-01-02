---@type LazySpec
return {
	{
		"kiyoon/jupynium.nvim",
		build = "uv sync",
		opts = {
			python_host = { "~/.local/share/nvim/lazy/jupynium.nvim/.venv/bin/python" },
			jupyter_command = { "uv", "run", "jupyter" },
			firefox_profiles_ini_path = "~/.mozilla/firefox/profiles.ini",
			firefox_profile_name = "light",
			use_default_keybindings = false,
		},
		keys = {
			{ -- 运行服务
				"<leader>cJr",
				"<cmd>JupyniumStartAndAttachToServer<cr>",
				desc = "Start Jupynium Server",
				ft = "python",
			},
			{ -- 开启同步
				"<leader>cJs",
				function()
					vim.api.nvim_command(
						"JupyniumStartSync " .. string.gsub(vim.fn.expand("%:t"), ".ju%.py$", ".ipynb")
					)
				end,
				desc = "Start Sync file",
				ft = "python",
			},
			{ -- 关闭同步
				"<leader>cJt",
				"<cmd>JupyniumStopSync<cr>",
				desc = "Stop Sync file",
				ft = "python",
			},
			{ -- 运行选定单元
				"<leader>cJx",
				"<cmd>JupyniumExecuteSelectedCells<cr>",
				desc = "Execute selected cells",
				ft = "python",
			},
			{ -- 清除选定单元输出
				"<leader>cJc",
				"<cmd>JupyniumClearSelectedCellsOutputs<cr>",
				desc = "Clear selected cells",
				ft = "python",
			},
			{ -- 检视变量
				"<leader>cJk",
				"<cmd>JupyniumKernelHover<cr>",
				desc = "Hover (inspect a variable)",
				ft = "python",
			},
		},
	},
}
