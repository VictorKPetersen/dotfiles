return {
    {
        "echasnovski/mini.icons",

        opts = {
            style = "glyph",
        },
    },

    {
        "echasnovski/mini.comment",

        opts = {},
    },

    {
        "echasnovski/mini.files",
        lazy = false,

        keys = {
            {
                "<leader>fm",
                function ()
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
