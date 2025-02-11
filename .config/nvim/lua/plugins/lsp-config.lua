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

        dependencies = {
            "saghen/blink.cmp",
        },

        opts = {
            servers = {
                lua_ls = {},
                basedpyright = {},
            },
        },


        config = function(_, opts)
            local lspconfig = require('lspconfig')
            -- Passing capabilities to each LSP in opts.servers
            for server, config in pairs(opts.servers) do
                -- passing config.capabilities to blink.cmp merges with the capabilities in your
                -- `opts[server].capabilities, if you've defined it
                config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
                lspconfig[server].setup(config)
            end

            -- Example calling setup directly for each lsp
            -- config = function()
            -- local capabilities = require('blink.cmp').get_lsp_capabilities()
            -- local lspconfig = require('lspconfig')

            -- lspconfig['lua_ls'].setup({ capabilities = capabilities })
            -- end

            -- Setup custom LSP keymaps
            vim.keymap.set("n", "K", vim.lsp.buf.hover,
                { desc = "Displays hover information about the symbol under the cursor" })
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition,
                { desc = "Jumps to the definition of the symbol under the cursor" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,
                { desc = "Code action for the symbol under the cursor" })
        end
    }
}
