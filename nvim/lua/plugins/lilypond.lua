local compile_with_lilycomp = function()
	local file = vim.fn.expand("%")
	vim.cmd("!" .. "lilycomp " .. file)
end

return {
	{
		"martineausimon/nvim-lilypond-suite",
		ft = "lilypond",
		config = function()
			require("nvls").setup({
				lilypond = {
					options = {
						pdf_viewer = "zathura",
					},
				},
				player = {
					enabled = true,
					command = "timidity",
				},
			})
		end,
		keys = {
			{ "<leader>ll", "<cmd>LilyPondCompile<cr>", desc = "Compile LilyPond" },
			{ "<leader>lp", "<cmd>LilyPondOpenPDF<cr>", desc = "Open PDF" },
			{ "<leader>lm", "<cmd>LilyPondPlayMIDI<cr>", desc = "Play MIDI" },
			{ "<leader>lc", compile_with_lilycomp, desc = "Compile with lilycomp" },
		},
	},
}
