-- Autocmds are automatically loaded on the VeryLazy event
--
-- Add any autocmds here
-- with  `vim.api.vim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_augroup("FiletypeHelp", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*/doc/*.txt",
	callback = function()
		vim.bo.filetype = "help"
	end,
	group = "FiletypeHelp",
})
