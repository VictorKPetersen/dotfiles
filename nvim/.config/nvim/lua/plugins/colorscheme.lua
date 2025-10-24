return {
    {
        -- Custom colorscheme using tokyonight as a base because it is easy.
        -- https://github.com/metalelf0/base16-black-metal-scheme/tree/master
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,

        config = function()
            local bg = "#000000"
            local bg_lighter = "#121212"
            local bg_highlight = "#222222"

            local dark_grey = "#333333"
            local light_grey = "#c1c1c1"
            local grey = "#aaaaaa"

            require("tokyonight").setup({

                on_colors = function(colors)
                    colors.bg = bg
                    colors.bg_float = bg
                    colors.bg_highlight = bg_highlight
                    colors.bg_search = bg_highlight
                    colors.bg_visual = bg_highlight
                    colors.bg_statusline = bg_lighter
                    colors.border = light_grey
                    colors.border_highlight = light_grey
                    colors.comment = grey
                    colors.dark3 = dark_grey
                    colors.dark5 = dark_grey
                    colors.fg_dark = light_grey
                    colors.fg_float = light_grey
                    colors.fg_gutter = bg_highlight
                    colors.fg_sidebar = light_grey
                end
            })

            -- vim.cmd.colorscheme("tokyonight-night")
        end
    },

    {
        dir = "~/Documents/Plugins/singular-noir.nvim",
        lazy = false,
        priority = 1000,

        config = function ()
            vim.cmd.colorscheme("singular-noir")
        end
    }
}
