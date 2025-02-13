return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "echasnovski/mini.icons", },

    opts = function()
        -- Get colors from onedark scheme
        local c = require("onedark.colors")
        local colors = {
            bg = c.bg0,
            fg = c.fg,
            red = c.red,
            green = c.green,
            yellow = c.yellow,
            blue = c.blue,
            purple = c.purple,
            cyan = c.cyan,
            gray = c.grey
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
                        color = function() return { fg = modeColors[vim.fn.mode()], bg = colors.grey, gui = "bold" } end,
                    },
                },

                lualine_c = {
                    {
                        "filename",
                        path = 1,
                        color = { bg = colors.grey, gui = "bold" },
                    },

                    {
                        "filetype",
                        icon_only = true,
                        color = { bg = colors.grey, gui = "bold" },
                    },

                    {
                        "diagnostics",
                        always_visible = true,
                        color = { bg = colors.grey, gui = "bold" },
                    },
                },

                lualine_x = {
                    {
                        "encoding",
                        fmt = string.upper,
                        color = { fg = colors.green, bg = colors.grey, gui = "bold" },
                    },

                    {
                        "fileformat",
                        icons_enabled = false,
                        fmt = string.upper,
                        color = { fg = colors.green, bg = colors.grey, gui = "bold" },
                    },
                },

                lualine_y = {
                    {
                        "branch",
                        icon = " ",
                        color = { fg = colors.purple, bg = colors.grey, gui = "bold" },
                        separator = "",
                    },

                    {
                        "diff",
                        symbols = { added = " ", modified = " ", removed = " " },
                        color = { bg = colors.grey, gui = "bold" },
                        separator = "",
                    },
                },

                lualine_z = {},
            },
        }

        return opts
    end,

}
