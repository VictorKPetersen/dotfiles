vim.api.nvim_create_autocmd("LspAttach", {
    -- Dsiable ruff hover functionallity
    group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
            return
        end
        if client.name == 'ruff' then
            client.server_capabilities.hoverProvider = false
        end
    end,
    desc = 'LSP: Disable hover capability from Ruff',
})

vim.api.nvim_create_autocmd("LspAttach", {
    -- Setup keymaps for LSP
    group = vim.api.nvim_create_augroup("lsp_attatch_keymaps", {clear = true }),
    callback = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover,
            { desc = "Displays hover information about the symbol under the cursor" })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,
            { desc = "Code action for the symbol under the cursor" })
    end,
    desc = "LSP: Enable keymaps",
})
