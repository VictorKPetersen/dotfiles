return {
    "folke/snacks.nvim",
    lazy = false, -- Can't lazyload due to using the dashboard

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
                        ["<c-n>"] = { "list_down", mode = { "i", "n" } },
                        ["<c-p>"] = { "list_up", mode = { "i", "n" } },
                        ["<Down>"] = { "history_forward", mode = { "i", "n" } },
                        ["<Up>"] = { "history_back", mode = { "i", "n" } },
                    },
                },
            },
        },

        dashboard = {
            enabled = true,

            preset = {
                keys = {
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    -- { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                    { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                    { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                    -- { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            },

            sections = {
                { section = "header", },
                { section = "keys", gap = 1, padding = 1, },
                { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
            },
        },

    },

    keys = {
        -- Files
        { "<leader>ff", function() Snacks.picker.files() end,           desc = "Find files" },
        { "<leader>fr", function() Snacks.picker.recent() end,          desc = "Find recent" },

        -- utility
        { "<leader>sg", function() Snacks.picker.grep() end,            desc = "Grep in files" },
        { "<leader>sw", function() Snacks.picker.grep_word() end,       desc = "Grep selection or word", mode = { "n", "v", } },
        { "<leader>sb", function() Snacks.picker.buffers() end,         desc = "Search buffers" },
        { "<leader>sm", function() Snacks.picker.marks() end,           desc = "Search Marks" },
        { "<leader>uC", function() Snacks.picker.colorschemes() end,    desc = "Colorschemes" },

        -- Git
        { "<leader>gb", function() Snacks.picker.git_branches() end,    desc = "Git Branches" },

        -- LSP
        { "gd",         function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
        { "<leader>ss", function() Snacks.picker.lsp_symbols() end,     desc = "LSP Symbols" },
    },
}
