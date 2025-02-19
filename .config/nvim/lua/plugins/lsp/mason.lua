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
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },

        opts = {
            ensure_installed = {
                "lua_ls",
            },
        },
    },
}
