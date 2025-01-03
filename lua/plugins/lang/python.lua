local use_pylsp = true

local base_specs = {
	recommended = function()
		return LazyVim.extras.wants({
			ft = "python",
			root = {
				"pyproject.toml",
				--"setup.py",
				--"setup.cfg",
				--"requirements.txt",
				--"Pipfile",
				--"pyrightconfig.json",
			},
		})
	end,
	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "ninja", "rst" } },
	},
	{
		"nvim-neotest/neotest",
		optional = true,
		dependencies = {
			"nvim-neotest/neotest-python",
		},
		opts = {
			adapters = {
				["neotest-python"] = {
					-- Here you can specify the settings for the adapter, i.e.
					-- runner = "pytest",
					-- python = ".venv/bin/python",
				},
			},
		},
	},
	{
		"mfussenegger/nvim-dap",
		optional = true,
		dependencies = {
			"mfussenegger/nvim-dap-python",
      -- stylua: ignore
      keys = {
        { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method", ft = "python" },
        { "<leader>dPc", function() require('dap-python').test_class() end, desc = "Debug Class", ft = "python" },
      },
			config = function()
				require("dap-python").setup("uv")
			end,
		},
	},

	{
		"linux-cultist/venv-selector.nvim",
		branch = "regexp", -- Use this branch for the new version
		cmd = "VenvSelect",
		event = "VeryLazy",
		enabled = true,
		dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
		opts = {
			settings = {
				options = {
					notify_user_on_venv_activation = true,
				},
			},
		},
		--  Call config for python files and load the cached venv automatically
		ft = "python",
		keys = {
			{ "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv", ft = "python" },
		},
	},

	{
		"hrsh7th/nvim-cmp",
		optional = true,
		opts = function(_, opts)
			opts.auto_brackets = opts.auto_brackets or {}
			table.insert(opts.auto_brackets, "python")
		end,
	},

	-- Don't mess up DAP adapters provided by nvim-dap-python
	{
		"jay-babu/mason-nvim-dap.nvim",
		optional = true,
		opts = {
			handlers = {
				python = function() end,
			},
		},
	},
}

local specs = {}

if use_pylsp then
	specs = {
		{
			"neovim/nvim-lspconfig",
			opts = {
				servers = {
					pylsp = {
						settings = {
							pylsp = {
								plugins = {
									ruff = {
										enabled = true,
										formatEnabled = true,
										exclude = { "__about__.py" },
									},
								},
							},
						},
					},
				},
			},
			keys = {
				{
					"<leader>co",
					LazyVim.lsp.action["source.organizeImports"],
					desc = "Organize Imports",
				},
			},
		},
	}
else
	if lazyvim_docs then
		-- LSP Server to use for Python.
		-- Set to "basedpyright" to use basedpyright instead of pyright.
		vim.g.lazyvim_python_lsp = "basedpyright"
		-- Set to "ruff_lsp" to use the old LSP implementation version.
		vim.g.lazyvim_python_ruff = "ruff"
	end

	local lsp = vim.g.lazyvim_python_lsp or "basedpyright"
	local ruff = vim.g.lazyvim_python_ruff or "ruff"
	specs = {
		{
			"neovim/nvim-lspconfig",
			opts = {
				servers = {
					ruff = {
						cmd_env = { RUFF_TRACE = "messages" },
						init_options = {
							settings = {
								logLevel = "error",
							},
						},
						keys = {
							{
								"<leader>co",
								LazyVim.lsp.action["source.organizeImports"],
								desc = "Organize Imports",
							},
						},
					},
					ruff_lsp = {
						keys = {
							{
								"<leader>co",
								LazyVim.lsp.action["source.organizeImports"],
								desc = "Organize Imports",
							},
						},
					},
				},
				setup = {
					[ruff] = function()
						LazyVim.lsp.on_attach(function(client, _)
							-- Disable hover in favor of Pyright
							client.server_capabilities.hoverProvider = false
						end, ruff)
					end,
				},
			},
		},
		{
			"neovim/nvim-lspconfig",
			opts = function(_, opts)
				local servers = { "pyright", "basedpyright", "ruff", "ruff_lsp", ruff, lsp }
				for _, server in ipairs(servers) do
					opts.servers[server] = opts.servers[server] or {}
					opts.servers[server].enabled = server == lsp or server == ruff
				end
			end,
		},
	}
end
return vim.tbl_extend("force", specs, base_specs)
