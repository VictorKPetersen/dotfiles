local plugins = {
    {
        "navarasu/onedark.nvim",
        lazy = true,
        name = "onedark",
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
    },
    {
        "Mofiqul/dracula.nvim",
        lazy = true,
        name = "dracula",
        opts = {
            transparent_bg = true,
            italic_comment = true,
        },
    },
    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
        opts = {
            transparent_background = true,
            term_colors = true,
        },
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = true,
        name = "nightfox",
        opts = {},
    },
    {
        "folke/tokyonight.nvim",
        lazy = true,
        name = "tokyonight",
        opts = {},
    },
}

-- Custom ChangeColor command, sets the name of the colorscheme in shada
vim.api.nvim_create_user_command("ChangeColor", function(opts)
    vim.cmd("colorscheme " .. opts.args)
    vim.notify("Setting colorscheme to " .. opts.args)
    vim.g.COLORSCHEME = opts.args
    vim.cmd("wshada")
end, { nargs = 1 })


-- Load last selected colorscheme from shada. Runs on plugin load
local function loadColorScheme()
    vim.cmd("rshada") -- Read shada file
    local color = vim.g.COLORSCHEME
    if color ~= nil and color ~= "" then
        vim.schedule(function()
            vim.cmd("ChangeColor " .. color)
        end)
    else
        vim.schedule(function()
            vim.cmd("ChangeColor onedark")
        end)
    end
end

loadColorScheme()
return plugins
