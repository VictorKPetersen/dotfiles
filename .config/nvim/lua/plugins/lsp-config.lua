return {
    -- Mason for installing & managing LSP
    {
        "williamboman/mason.nvim",
        cmd = "Mason",

        -- Run MasonUpdate when mason updates
        build = ":MasonUpdate",

        opts = {},
    },

    -- Mason-lspconfig for bridring the gap, and ensuring certain servers are installed
    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",

        opts = {
            ensure_installed = {
                "lua_ls",
            },
        },
    },

    -- nvim-lspconfig for general lsp configuation
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufWritePost", "BufNewFile", },
        dependencies = {
            "saghen/blink.cmp",
        },

        opts = {
            servers = {
                lua_ls = {},

                basedpyright = {
                    settings = {
                        basedpyright = {
                            disableOrganizeImports = true,
                            analysis = {
                                ignore = { "*", },
                            },
                        },
                    },
                },

                ruff = {},

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
            -- The rest can be found in the snacks picker
            vim.keymap.set("n", "K", vim.lsp.buf.hover,
                { desc = "Displays hover information about the symbol under the cursor" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,
                { desc = "Code action for the symbol under the cursor" })


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
        end,

    }
}
