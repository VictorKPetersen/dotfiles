-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- Import your plugins
        { import = "plugins" },
    },

    defaults = {
        lazy = false,  -- Do not lazy load by default
        version = nil, -- Always use the latest git commit
        -- version = "*", -- Try installing the latest stable version for plugins that support semver
    },

    -- Configure any other settings here. See the documentation for more details.
    install = {
        missing = true, -- Install missing plugins on startup

        -- Colorscheme that will be used when installing plugins.
        -- Try to load one of these colorschemes when starting an installation during startup
        colorscheme = { "tokyonight-night", "lunaperche", },
    },

    -- Automatically check for plugin updates
    checker = {
        enabled = true, -- Check for plugin updates
        notify = true,
    },
})
