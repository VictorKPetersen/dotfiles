return {
    {
        "Mofiqul/dracula.nvim",
        name = "dracula",
        lazy = true,
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
    {
        "zenbones-theme/zenbones.nvim",
        name = "zenbones",
        lazy = true,
        opts = {},

        config = function()
            vim.g.zenbones = { solid_line_nr = true }
        end
    },
}
