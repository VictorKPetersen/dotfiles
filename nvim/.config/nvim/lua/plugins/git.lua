return {
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
        },

        event = "VeryLazy",

        config = true,
        opts = {},
    },
    {
        "lewis6991/gitsigns.nvim",

        event = "VeryLazy",

        opts = {},
    },
}
