vim.opt.fillchars:append({ horiz = "─", horizup = "┴", horizdown = "┬" })

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#7a7aaa" })
	end,
})
