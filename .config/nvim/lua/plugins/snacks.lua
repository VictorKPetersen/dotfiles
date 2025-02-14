return {
    "folke/snacks.nvim",

    event = "VeryLazy",

    opts = {
        input = {
            enabled = true,
        },

        notifier = {
            enabled = true,
        },

        indent = {
            enabled = true,
            animate = { enabled = false, },
        },

        picker = {
            enabled = true,

            layout = {
                cycle = false,
            },

            win = {

                input = {
                    keys = {
                        ["<ESC>"] = { "close", mode = { "i", "n" } },
                        ["<c-j>"] = { "list_down", mode = { "i", "n" } },
                        ["<c-k>"] = { "list_up", mode = { "i", "n" } },
                        ["<Down>"] = { "history_forward", mode = { "i", "n" } },
                        ["<Up>"] = { "history_back", mode = { "i", "n" } },
                    },
                },
            },
        },
    },

    keys = {
        { "<leader>ff", function() Snacks.picker.files() end,     desc = "Find files" },
        { "<leader>fb", function() Snacks.picker.buffers() end,   desc = "Find buffers" },
        { "<leader>fr", function() Snacks.picker.recent() end,    desc = "Find recent" },


        { "<leader>sg", function() Snacks.picker.grep() end,      desc = "Grep in files" },
        { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Grep selection or word", mode = { "n", "v", } },
    },
}
