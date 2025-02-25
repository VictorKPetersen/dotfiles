local M = {}

function M.setup()
    -- Custom ChangeColor command, sets the name of the colorscheme in shada
    vim.api.nvim_create_user_command("ChangeColor", function(opts)
        M.change_color(opts.args)
    end, { nargs = 1 })

    M.load_color()
end

function M.load_color()
    -- Load last selected colorscheme from shada.
    vim.cmd("rshada") -- Read shada file
    local succes, color = pcall(vim.api.nvim_get_var, "COLORSCHEME_LAST_USED")
    if succes and color ~= "" then
        vim.schedule(function()
            M.change_color(color)
        end)
    else
        vim.schedule(function()
            vim.cmd("ChangeColor default")
        end)
    end
end

function M.change_color(colorscheme)
    if not colorscheme or colorscheme == "" then
        vim.notify("No colorscheme provided!")
        return
    end

    vim.cmd("set background=dark")
    vim.cmd("hi clear")
    vim.cmd("colorscheme " .. colorscheme)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    vim.api.nvim_set_var("COLORSCHEME_LAST_USED", colorscheme)
    vim.cmd("wshada")
end

return M
