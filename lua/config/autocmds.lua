-- Autocmds are automatically loaded on the VeryLazy event
--
-- Add any autocmds here
-- with  `vim.api.vim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- make doc/*.txt become "help" filetype
vim.api.nvim_create_augroup("FiletypeHelp", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*/doc/*.txt",
	callback = function()
		vim.bo.filetype = "help"
	end,
	group = "FiletypeHelp",
})

-- autocmds for tinymist

vim.api.nvim_create_autocmd({
	"BufNewFile",
	"BufRead",
}, {
	pattern = "*.typ",
	callback = function()
		vim.bo.filetype = "typst"
	end,
})

-- auto spell
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "typst" },
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.spelllang = { "en", "cjk" }
	end,
})
