return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "echasnovski/mini.icons", },

    config = function()
        local theme = require("noirbuddy.plugins.lualine").theme

        local sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff' },
            lualine_c = { { 'filename', path = 1 }, { 'diagnostics', always_visible = true } },
            lualine_x = { { 'filetype', colored = true }, 'encoding' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
        }

        local inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { { 'filename', path = 1 } },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {}
        }

        require("lualine").setup {
            options = {
                icons_enabled = true,
                theme = theme,
                filetype = { colored = true },
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {},
                always_divide_middle = true,
            },
            sections = sections,
            inactive_sections = inactive_sections,
        }
    end
}
