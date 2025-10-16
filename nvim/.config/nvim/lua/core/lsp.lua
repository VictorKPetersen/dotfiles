local servers = {
    "basedpyright",
    "lua_ls",
    "gopls",
}

vim.lsp.enable(servers)

vim.diagnostic.config({ virtual_text = true })
