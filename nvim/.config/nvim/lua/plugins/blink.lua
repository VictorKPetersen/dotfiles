return {
    {
        "saghen/blink.cmp",
        event = { "BufNewFile", "BufReadPost", "BufWritePost", "CmdwinEnter", "CmdlineEnter", },

        dependencies = {
            "rafamadriz/friendly-snippets",
        },

        -- Stay on this version to ensure the fuzze matcher is installed.
        version = '1.*',

        opts = {
            keymap = {
                preset = "default",

                ["<C-Space>"] = { "accept", "fallback" },
                ["<C-p>"] = { "select_prev", "fallback" },
                ["<C-n>"] = { "select_next", "fallback" },
            },

            appearance = {
                nerd_font_variant = "mono",
                -- We use this because the colorscheme doesn't natively support blink.cmp
                -- use_nvim_cmp_as_default = true,
            },

            completion = {
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = false,
                    },
                },

                menu = {
                    border = "rounded",

                    draw = {
                        columns = {
                            { "label",     "label_description", gap = 2 },
                            { "kind_icon", "kind",              "source_name", gap = 2 }
                        },
                        treesitter = { "lsp" },
                    },
                },

                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 200,
                    treesitter_highlighting = true,
                    window = { border = "rounded" },
                },
            },
        },

        snippets = { preset = "default" },

        signature = { enabled = true },

        sources = {
            default = {
                "lsp",
                "path",
                "snippets",
                "buffer"
            },

            providers = {
                lsp = {
                    min_keyword_length = 1,
                    score_offset = 0,
                },
                path = {
                    min_keyword_length = 0,
                    score_offset = 1,
                },
                snippets = {
                    min_keyword_length = 2,
                    score_offset = -1,
                },
                buffer = {
                    min_keyword_length = 4,
                    score_offset = -3,
                    max_items = 5,
                },
            }
        },

        opts_extend = { "sources.default" },
    },
}
