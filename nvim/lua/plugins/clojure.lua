return {
	"Olical/conjure",
	ft = { "clojure", "fennel", "janet" }, -- lazy loading nur für diese Dateitypen
	config = function()
		-- Optional: Localleader setzen falls noch nicht geschehen
		vim.g.maplocalleader = ","

		-- Optional: HUD deaktivieren falls zu ablenkend
		-- vim.g['conjure#log#hud#enabled'] = false
	end,
}
