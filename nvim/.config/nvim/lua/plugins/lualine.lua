return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "echasnovski/mini.icons", },

    opts = {
        options = {
            theme = "auto"
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
                },

                {
                    "fileformat",
                    icons_enabled = false,
                    fmt = string.upper,
                },
            },

            lualine_y = {
                {
                    "branch",
                    icon = " ",
                    separator = "",
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
}
