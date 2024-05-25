return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                --Parsers that should always be installed
                "c",
                "lua",
                "vim",
                "vimdoc",
                "java",
            },
            --Enable highlighting
            highlight = { enable = true },
            --Enable smart indenting
            indent = { enable = true}
        })
    end
 }

