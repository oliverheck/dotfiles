return {
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "hurrlipurr",
					path = "~/obsidian/hurrlipurr",
				},
			},

			-- Wichtige Einstellungen für Obsidian-Kompatibilität
			notes_subdir = ".",
			new_notes_location = "current_dir",

			-- Wikilinks bevorzugen statt Markdown-Links
			preferred_link_style = "wiki",

			-- Completion für Links
			completion = {
				nvim_cmp = true,
				min_chars = 2,
			},

			-- Tägliche Notes falls du das nutzt
			daily_notes = {
				folder = "journal",
				date_format = "%Y-%m-%d",
			},
		},
	},
}
