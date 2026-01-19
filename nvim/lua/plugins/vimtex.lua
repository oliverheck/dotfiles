return {
	"lervag/vimtex",
	config = function()
		vim.g.vimtex_view_method = "general"
		vim.g.vimtex_view_general_viewer = "okular"
		vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
		vim.g.vimtex_compiler_method = "latexmk"
		vim.g.vimtex_compiler_latexmk = {
			out_dir = "build",
			options = {
				"-verbose",
				"-file-line-error",
				"-synctex=1",
				"-interaction=nonstopmode",
				"-outdir=build",
			},
		}
		vim.g.vimtex_compiler_latexmk_engines = {
			_ = "-lualatex",
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
