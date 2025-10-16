return {
    {
        "nvim-mini/mini.icons",
        lazy = true,

        opts = {
            style = "glyph",
        },

        -- Mocks "nvim-tree/nvim-web-devicons", allows plugins which use web-devicons to use mini.icons
        -- Stolen from LazyVim spec https://www.lazyvim.org/plugins/ui
        init = function()
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
    },

    {
        "nvim-mini/mini.comment",
        event = { "BufNewFile", "BufReadPost", "BufWritePost", },

        opts = {},
    },

    {
        "nvim-mini/mini.ai",
        event = { "BufNewFile", "BufReadPost", "BufWritePost", },

        opts = {},
    },

    {
        "nvim-mini/mini.files",
        keys = {
            {
                "<leader>fm",
                function()
                    require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
                end,
                desc = "Open mini.files manager"
            },
        },

        opts = {
            options = {
                use_as_default_explorer = true,
            },

            windows = {
                preview = true,
                width_focus = 35,
                width_nofocus = 30,
                width_preview = 30,
            },
        },
    },
}
