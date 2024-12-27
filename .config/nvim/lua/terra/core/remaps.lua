-- Set the mapleader to space
vim.g.mapleader = " "
vim.g.localmapleader = " "

vim.keymap.set("n", "<leader>tt", "<cmd>Explore<cr>")

-- Remap <leader>y/p to yank and paste from system clipboard
vim.keymap.set("n", "<leader>y", [["+y]])
vim.keymap.set("v", "<leader>y", [["+y]])

vim.keymap.set("n", "<leader>p", [["+p]])
vim.keymap.set("v", "<leader>p", [["+p]])
