return {
    -- Mason for installing & managing LSP
    {
        "williamboman/mason.nvim",
        opts = {},
    },

    -- Mason-lspconfig for bridring the gap, and ensuring certain servers are installed
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
            },
        },
    },

    -- nvim-lspconfig for general lsp configuation
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            --Setup servers
            lspconfig.lua_ls.setup({})

            -- Setup custom LSP keymaps
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {}) -- Show documentation for whats under cursor
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {}) -- Go to definition for whats under cursor
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {}) -- Code actions for whats under cursor -- Code actions for whats under cursor
        end,
    }
}

