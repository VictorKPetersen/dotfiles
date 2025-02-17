return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "echasnovski/mini.icons", },

    opts = function()
        -- Get colors from onedark scheme
        local colors = {
            bg = vim.g.terminal_color_0,
            red = vim.g.terminal_color_1,
            green = vim.g.terminal_color_2,
            yellow = vim.g.terminal_color_3,
            blue = vim.g.terminal_color_4,
            purple = vim.g.terminal_color_5,
            cyan = vim.g.terminal_color_6,
            white = vim.g.terminal_color_7,
            fg = vim.g.terminal_color_8
        }

        local modeColors = {
            n = colors.red,
            i = colors.green,
            v = colors.blue,
            [''] = colors.blue,
            V = colors.blue,
            c = colors.magenta,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [''] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ['r?'] = colors.cyan,
            ['!'] = colors.red,
            t = colors.red,
        }

        local opts = {
            sections = {
                lualine_a = {},

                lualine_b = {
                    {
                        "mode",
                        color = function() return { fg = modeColors[vim.fn.mode()], gui = "bold" } end,
                    },
                },

                lualine_c = {
                    {
                        "filename",
                        path = 1,
                        color = { gui = "bold" },
                    },

                    {
                        "filetype",
                        icon_only = true,
                        color = { gui = "bold" },
                    },

                    {
                        "diagnostics",
                        always_visible = true,
                        color = { gui = "bold" },
                    },
                },

                lualine_x = {
                    {
                        "encoding",
                        fmt = string.upper,
                        color = { fg = colors.green, gui = "bold" },
                    },

                    {
                        "fileformat",
                        icons_enabled = false,
                        fmt = string.upper,
                        color = { fg = colors.green, gui = "bold" },
                    },
                },

                lualine_y = {
                    {
                        "branch",
                        icon = " ",
                        color = { fg = colors.purple, gui = "bold" },
                        separator = "",
                    },

                    {
                        "diff",
                        symbols = { added = " ", modified = " ", removed = " " },
                        color = { gui = "bold" },
                        separator = "",
                    },
                },

                lualine_z = {},
            },
        }

        return opts
    end,

}
