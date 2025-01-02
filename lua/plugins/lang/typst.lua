local tinymist_keys = {}
local export_marker = { "S", "P", "o", "H", "M", "T", "Q" }
local export_desc = { "Svg", "Png", "Pdf", "Html", "Markdown", "Text", "Query" }
local export_commands =
	{ "exportSvg", "exportPng", "exportPdf", "exportHtml", "exportMarkdown", "exportText", "exportQuery" }
for i = 1, #export_marker do
	table.insert(tinymist_keys, {
		"<leader>o" .. export_marker[i],
		function()
			local current_file = vim.fn.expand("%")
			vim.lsp.buf.execute_command({
				command = "tinymist." .. export_commands[i],
				arguments = { current_file },
			})
		end,
		desc = "export to " .. export_desc[i],
		ft = "typst",
	})
end

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "typst" } },
	},
	{
		"hrsh7th/nvim-cmp",
		optional = true,
		opts = function(_, opts)
			opts.auto_brackets = opts.auto_brackets or {}
			table.insert(opts.auto_brackets, "typst")
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"tinymist",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		---@class PluginLspOpts
		opts = {
			----@type lspconfig.options
			servers = {
				tinymist = {
					--- todo: these configuration from lspconfig maybe broken
					on_attach = function(client, _)
						client.server_capabilities.semanticTokensProvider = nil
					end,
					single_file_support = true,
					root_dir = function()
						return vim.fn.getcwd()
					end,
					--- See [Tinymist Server Configuration](https://github.com/Myriad-Dreamin/tinymist/blob/main/Configuration.md) for references.
					settings = {
						formatterMode = "typstyle",
						exportPdf = "nerver", --"onDocumentHasTitle",
						outputPath = "$root/target/$dir/$name",
						-- semanticTokens = "disable",
					},
				},
			},
		},
		keys = tinymist_keys,
	},
	{
		"chomosuke/typst-preview.nvim",
		ft = "typst",
		version = "1.*",
		opts = {
			dependencies_bin = {
				["tinymist"] = nil,
				["websocat"] = nil,
			},
		},
		keys = {
			{
				"<leader>cp",
				"<cmd>TypstPreview<cr>",
				desc = "Typst Preview",
				ft = "typst",
			},
			{
				"<leader>ck",
				"<cmd>TypstPreviewStop<cr>",
				desc = "Stop Typst Preview",
				ft = "typst",
			},
		},
	},
}
