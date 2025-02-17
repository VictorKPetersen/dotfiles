local function colorSetup()
    local colorTable = {
        black = vim.g.terminal_color_0,
        red = vim.g.terminal_color_1,
        green = vim.g.terminal_color_2,
        yellow = vim.g.terminal_color_3,
        blue = vim.g.terminal_color_4,
        magenta = vim.g.terminal_color_5,
        cyan = vim.g.terminal_color_6,
        white = vim.g.terminal_color_7,
        black_bright = vim.g.terminal_color_8
    }

    return colorTable
end


local function themeSetup()
    local colors = colorSetup()
    local themeTable = {
        normal = {
            a = { bg = colors.black, fg = colors.red, gui = "bold" },
            b = { bg = colors.black, fg = colors.white, gui = "bold" },
            c = { bg = colors.black, fg = colors.white, gui = "bold" },
            x = { bg = colors.black, fg = colors.white, gui = "bold" },
            y = { bg = colors.black, fg = colors.white, gui = "bold" },
            z = { bg = colors.black, fg = colors.white, gui = "bold" },
        },

        insert = {
            a = { bg = colors.black, fg = colors.green, gui = "bold" },
        },

        visual = {
            a = { bg = colors.black, fg = colors.blue, gui = "bold" },
        },

        replace = {
            a = { bg = colors.black, fg = colors.magenta, gui = "bold" },
        },

        command = {
            a = { bg = colors.black, fg = colors.yellow, gui = "bold" },
        },

        inactive = {
            a = { bg = colors.black, fg = colors.black_bright, gui = "bold" },
        },
    }

    return themeTable
end


return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "echasnovski/mini.icons", },

    opts = function()
        local colors = colorSetup()

        local opts = {
            options = {
                theme = themeSetup(),
            },

            sections = {
                lualine_a = {
                    { "mode", },
                },

                lualine_b = {
                    {
                        "filename",
                        path = 1,
                    },

                    {
                        "filetype",
                        icon_only = true,
                    },
                },

                lualine_c = {
                    {
                        "diagnostics",
                        always_visible = true,
                    },
                },

                lualine_x = {
                    {
                        "encoding",
                        fmt = string.upper,
                        color = { fg = colors.green, },
                    },

                    {
                        "fileformat",
                        icons_enabled = false,
                        fmt = string.upper,
                        color = { fg = colors.green, },
                    },
                },

                lualine_y = {
                    {
                        "branch",
                        icon = " ",
                        separator = "",
                        color = { fg = colors.magenta, },
                    },

                    {
                        "diff",
                        symbols = { added = " ", modified = " ", removed = " " },
                        separator = "",
                    },
                },

                lualine_z = {},
            },
        }


        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()
                opts.options.theme = themeSetup()
                require("lualine").setup(opts)
            end,
            desc = "Autoreload lualine after :colorscheme",
        })

        return opts
    end,

}
