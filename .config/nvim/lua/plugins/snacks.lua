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

        explorer = {
            enabled = true,
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
                { pane = 2, section = "startup" },
            },
        },

    },

    keys = {
        -- Files
        { "<leader>ff", function() Snacks.picker.files() end,     desc = "Find files" },
        { "<leader>fr", function() Snacks.picker.recent() end,    desc = "Find recent" },

        -- utility
        { "<leader>sg", function() Snacks.picker.grep() end,      desc = "Grep in files" },
        { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Grep selection or word", mode = { "n", "v", } },
        { "<leader>sb", function() Snacks.picker.buffers() end,   desc = "Search buffers" },
        { "<leader>sm", function() Snacks.picker.marks() end,     desc = "Search Marks" },
        {
            "<leader>cU",
            function()
                local colors = require("plugins.colorscheme")
                for _, color in ipairs(colors) do
                    require("lazy").load({ plugins = { color.name } })
                end

                Snacks.picker.colorschemes({
                    preview = "false",
                    confirm = function(picker, item)
                        picker:close()
                        if item then
                            picker.preview.state.colorscheme = nil
                            vim.schedule(function()
                                vim.cmd("ChangeColor " .. item.text)
                            end)
                        end
                    end,
                })
            end,
            desc = "Colorschemes"
        },

        -- Git
        { "<leader>gb", function() Snacks.picker.git_branches() end,    desc = "Git Branches" },


        -- LSP
        { "gd",         function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
        { "gD",         function() Snacks.picker.lsp_declarations() end, desc = "Goto Declarations" },
        { "gr",         function() Snacks.picker.lsp_references() end,  nowait = true,           desc = "References" },
        { "<leader>ss", function() Snacks.picker.lsp_symbols() end,     desc = "LSP Symbols" },

        -- Other snakcs
        { "<leader>db", function() Snacks.dashboard() end, desc = "Open dashboard" },
        { "<leader>tt", function() Snacks.explorer() end, desc = "Open Explorer" }
    },
}
