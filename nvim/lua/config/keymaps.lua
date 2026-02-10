-- Leader keys setzen
vim.g.mapleader = " "
vim.g.maplocalleader = ","
-- Escape alternatives
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })
