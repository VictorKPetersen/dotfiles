return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    opts = {
        input = {
            enabled = true,
        },

        picker = {
            enabled = true,
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
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
    },
}
