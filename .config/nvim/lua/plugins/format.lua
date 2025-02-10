return {
    'stevearc/conform.nvim',
    keys = {
        {
            -- Bind Conform.format()
            "<leader>f",
            function()
                require("conform").format({ async = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },

    opts = {
        -- Define formatters
        formatter_by_ft = {
            lua = { "stylua" },
        },

        -- Set defualts
        default_format_opts = {
            lsp_format = "fallback",
        },

        -- Format on save
        format_on_save = { timeout_ms = 500 },
    },
}
