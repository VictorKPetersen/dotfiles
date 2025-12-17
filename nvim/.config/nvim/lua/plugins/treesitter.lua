return {
    "nvim-treesitter/nvim-treesitter",

    lazy = false,
    build = ":TSUpdate",
    branch = "main",

    opts = {
        highlight = { enable = true },
        indent = { enable = true },
    },

    config = function()
        local ts = require("nvim-treesitter")

        ts.install({
            "bash",
            "c",
            "cpp",
            "css",
            "html",
            "comment",
            "html",
            "java",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "vim",
            "vimdoc",
        })

        local group = vim.api.nvim_create_augroup("TreeSitterSetup", { clear = true })

        local ignore_filetypes = {
            "checkhealth",
            "lazy",
            "mason",
            "snacks_dashboard",
            "snacks_notif",
        }

        vim.api.nvim_create_autocmd("FileType", {
            group = group,
            desc = "Enable treesitter highlighting and indentation",
            callback = function(event)
                if vim.tbl_contains(ignore_filetypes, event.match) then
                    return
                end

                local lang = vim.treesitter.language.get_lang(event.match) or event.match
                local buf = event.buf

                pcall(vim.treesitter.start, buf, lang)

                vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

                ts.install({ lang })
            end,
        })
    end,
}
