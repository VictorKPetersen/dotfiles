local color = require("util.color")
color.setup()


local servers = {
    "basedpyright",
    "lua_ls",
    "gopls",
}

vim.lsp.enable(servers)

return {}
