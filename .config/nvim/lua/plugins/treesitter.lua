return {
    "nvim-treesitter/nvim-treesitter",

    -- Ensures latests version of parsers
    build = ":TSUpdate",
    lazy = false,
    event = { "BufNewFile", "BufReadPost", "BufWritePost", },

    opts = {
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
            "bash",
            "c",
            "cpp",
            "css",
            "comment",
            "html",
            "java",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "vim",
            "vimdoc",
        },
    },

    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
