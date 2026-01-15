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
			{ "<leader>lc", "<cmd>LilyPondCompile<cr>", desc = "Compile LilyPond" },
			{ "<leader>lp", "<cmd>LilyPondOpenPDF<cr>", desc = "Open PDF" },
			{ "<leader>lm", "<cmd>LilyPondPlayMIDI<cr>", desc = "Play MIDI" },
		},
	},
}
