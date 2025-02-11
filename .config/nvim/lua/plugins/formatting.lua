return {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    cmd = "ConformInfo",
    keys = {
        {
            -- Bind Conform.format()
            "<leader>gf",
            function()
                require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
            end,
            mode = { "n", "v", },
            desc = "Format buffer",
        },
    },

    opts = {
        -- Define formatters
        formatters_by_ft = {
        },

        -- Set defualts
        default_format_opts = {
            timeout_ms = 3000,
            lsp_format = "fallback",
            async = false,
        },

        -- Format on save
        format_on_save = { timeout_ms = 3000 },
    },
}
