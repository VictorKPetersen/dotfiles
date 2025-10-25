local servers = {
    "basedpyright",
    "gopls",
    "lua_ls",
    "ts_ls",
    "svelte",
}

vim.lsp.enable(servers)

vim.diagnostic.config({ virtual_text = false })
