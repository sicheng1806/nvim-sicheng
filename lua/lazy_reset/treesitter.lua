local utils = require("utils")

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if opts.ensure_installed ~= "all" then
				opts.ensure_installed = utils.table_insert_unique(opts.ensure_installed, { "ini" })
			end
		end,
	},
}
