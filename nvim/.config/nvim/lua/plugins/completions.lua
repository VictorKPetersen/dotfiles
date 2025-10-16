return {
    {
        "saghen/blink.cmp",
        event = { "BufNewFile", "BufReadPost", "BufWritePost", "CmdwinEnter", "CmdlineEnter", },

        dependencies = {
            "rafamadriz/friendly-snippets",
        },

        version = "*",

        opts = {
            -- 'default' for mappings similar to built-in completion
            keymap = {
                preset = "default",

                ["<C-Space>"] = { "accept", "fallback" },
                ["<C-p>"] = { "select_prev", "fallback" },
                ["<C-n>"] = { "select_next", "fallback" },
            },

            appearance = {
                use_nvim_cmp_as_default = false,
                nerd_font_variant = "mono",
            },

            completion = {
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 50
                },

                ghost_text = { enabled = true },

                menu = {
                    -- nvim-cmp style menu
                    draw = {
                        columns = {
                            { "label",     "label_description", gap = 2 },
                            { "kind_icon", "kind",              gap = 2 }
                        },

                        treesitter = { "lsp" },
                    },
                },
            },

            -- Use friendly-snippets
            snippets = { preset = "default" },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = {
                    "lsp",
                    "path",
                    "snippets",
                    "buffer",
                },
            },
        },

        opts_extend = { "sources.default" }
    },
}
