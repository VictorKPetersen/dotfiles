return {
    {
        "mfussenegger/nvim-lint",

        event = { "BufNewFile", "BufReadPost", "BufWritePost", },

        opts = {
            linters_by_ft = {
                python = { "ruff" },
                java = { "checkstyle" },
            },
        },

        config = function(_, opts)
            local lint = require("lint")
            lint.linters_by_ft = opts.linters_by_ft

            -- Creates auto cmd to run linters when insert mode is exited and when a buffer is written
            vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "BufReadPost" }, {
                callback = function()
                    require("lint").try_lint() -- Runs the linters for current filetype
                end,
            })
        end,
    },
}
