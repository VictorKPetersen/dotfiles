local plugins = {
    {
        "Mofiqul/dracula.nvim",
        lazy = true,
        name = "dracula",
        opts = {
            italic_comment = true,
        },
    },
    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
        opts = {
            term_colors = true,
        },
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = true,
        name = "nightfox",
        opts = {},
    },
    {
        "folke/tokyonight.nvim",
        lazy = true,
        name = "tokyonight",
        opts = {},
    },
}

return plugins
