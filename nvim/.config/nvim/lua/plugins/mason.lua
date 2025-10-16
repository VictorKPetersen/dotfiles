return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",

        -- Run MasonUpdate when mason updates
        build = ":MasonUpdate",

        opts = {},
    },

    {
        "williamboman/mason-lspconfig.nvim",
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },

        opts = {
            ensure_installed = {
                "lua_ls",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile", },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "saghen/blink.cmp",
        },
    },
}
