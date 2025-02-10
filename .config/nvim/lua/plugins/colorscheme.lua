return {
    "navarasu/onedark.nvim",
    priority = 1000,
    opts = {
        style = "deep",     -- Default style. Choose between "dark", "darker", "cool", "deep", "warm", "warmer", "light"
        transparent = true,
        term_colors = true, -- Change terminal colors to selected theme

        -- Options are italic, bold, underline, none
        -- Configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
        code_style = {
            comments = 'italic',
            keywords = 'bold',
            functions = 'italic,bold',
            strings = 'none',
            variables = 'none'
        },
    },

    config = function(_, opts)
        require("onedark").setup(opts)
        require("onedark").load()
    end,
}
