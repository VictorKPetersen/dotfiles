local servers = {
    "basedpyright",
    "lua_ls",
    "gopls",
    "ts_ls",
    "svelte",
}

vim.lsp.enable(servers)

vim.diagnostic.config({ virtual_text = true })
