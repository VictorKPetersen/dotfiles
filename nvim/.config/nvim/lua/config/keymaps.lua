-- Space as the leader key (The only way)
vim.g.mapleader = " "
vim.g.localmapleader = " "

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste system clipboard after cursor" })
vim.keymap.set({ "n", "v" }, "<leader>P", [["+P]], { desc = "Paste system clipboard before cursor" })

vim.keymap.set("n", "<leader><cr>", ":nohlsearch<cr>", { desc = "Clear search highlight" })

vim.keymap.set("n", "<leader>do", function ()
    vim.diagnostic.open_float()
end, { desc = "Open diagnostic window" }
)

vim.keymap.set("n", "<leader>dn", function ()
    vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Jump to next diagnostic window" }
)

vim.keymap.set("n", "<leader>dp", function ()
    vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Jump to prev diagnostic window" }
)
