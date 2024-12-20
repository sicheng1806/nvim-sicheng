local utils = require("utils")

---@module 'lazy'
---@type LazySpec
return {
	{
		"nvim-treesitter/nvim-treesitter",
		optional = true,
		opts = function(_, opts)
			opts.ensure_installed =
				utils.table_insert_unique(opts.ensure_installed, { "marksman", "prettierd", "markdownlint" })
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown" },
		event = "VeryLazy",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
		opts = {
			bullet = {
				right_pad = 1,
			},
		},
	},
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				markdown = { "prettierd", "prettier", stop_after_first = true },
			},
		},
	},
}
