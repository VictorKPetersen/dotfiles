-- Set the mapleader to space
vim.g.mapleader = " "
vim.g.localmapleader = " "

vim.keymap.set("n", "<leader>tt", "<cmd>Explore<cr>", {desc = "Open file explorer"})

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], {desc = "Yank to system clipboard"})
vim.keymap.set({"n", "v"}, "<leader>p", [["+p]], {desc = "Paste system clipboard after cursor"})
vim.keymap.set({"n", "v"}, "<leader>P", [["+P]], {desc = "Paste system clipboard before cursor"})
