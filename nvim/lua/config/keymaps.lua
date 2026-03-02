-- Escape alternatives
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })

-- Pfeiltasten im Normal-, Insert- und Visual-Mode deaktivieren
local modes = { "n", "i", "v" }
for _, mode in ipairs(modes) do
	vim.keymap.set(mode, "<Up>", "<Nop>", { desc = "Pfeiltaste deaktiviert" })
	vim.keymap.set(mode, "<Down>", "<Nop>", { desc = "Pfeiltaste deaktiviert" })
	vim.keymap.set(mode, "<Left>", "<Nop>", { desc = "Pfeiltaste deaktiviert" })
	vim.keymap.set(mode, "<Right>", "<Nop>", { desc = "Pfeiltaste deaktiviert" })
end
