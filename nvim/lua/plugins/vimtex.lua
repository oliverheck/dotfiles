return {
	"lervag/vimtex",
	config = function()
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_compiler_method = "latexmk"
		vim.g.vimtex_compiler_latexmk = {
			options = {
				"-xelatex",
				"-verbose",
				"-file-line-error",
				"-synctex=1",
				"-interaction=nonstopmode",
			},
		}
	end,
	keys = {
		{ "<leader>ll", "<cmd>VimtexCompile<cr>", desc = "VimTeX Compile", ft = "tex" },
		{ "<leader>lv", "<cmd>VimtexView<cr>", desc = "VimTeX View", ft = "tex" },
		{ "<leader>lc", "<cmd>VimtexClean<cr>", desc = "VimTeX Clean", ft = "tex" },
		{ "<leader>ls", "<cmd>VimtexStop<cr>", desc = "VimTeX Stop", ft = "tex" },
		{ "<leader>lt", "<cmd>VimtexTocToggle<cr>", desc = "VimTeX TOC", ft = "tex" },
		{ "<leader>li", "<cmd>VimtexInfo<cr>", desc = "VimTeX Info", ft = "tex" },
	},
}
