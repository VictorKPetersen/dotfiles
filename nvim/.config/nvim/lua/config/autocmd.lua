vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
            return
        end

        if client.name == "ruff" then
            client.server_capabilities.hoverProvider = false
        end
    end,
    desc = "LSP: Disable hover capabillity from Ruff",
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function()
        vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover({ border = "rounded" })
        end, { desc = "Displays hover information about the symbol under the cursor" })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,
            { desc = "Code action for the symbol under the cursor" })
    end,
    desc = "LSP: Disable hover capabillity from Ruff",
})

-- Make mini.files to apear in the center of the screen.
-- https://github.com/nvim-mini/mini.nvim/discussions/2173

local widths = { 60, 30, 15 }

local ensure_center_layout = function(ev)
    local state = MiniFiles.get_explorer_state()
    if state == nil then return end

    -- Compute "depth offset" - how many windows are between this and focused
    local path_this = vim.api.nvim_buf_get_name(ev.data.buf_id):match('^minifiles://%d+/(.*)$')
    local depth_this
    for i, path in ipairs(state.branch) do
        if path == path_this then depth_this = i end
    end
    if depth_this == nil then return end
    local depth_offset = depth_this - state.depth_focus

    -- Adjust config of this event's window
    local i = math.abs(depth_offset) + 1
    local win_config = vim.api.nvim_win_get_config(ev.data.win_id)
    win_config.width = i <= #widths and widths[i] or widths[#widths]

    win_config.col = math.ceil(0.5 * (vim.o.columns - widths[1]))
    for j = 1, math.abs(depth_offset) do
        local sign = depth_offset == 0 and 0 or (depth_offset > 0 and 1 or -1)
        -- widths[j+1] for the negative case because we don't want to add the center window's width 
        local prev_win_width = (sign == -1 and widths[j+1]) or widths[j] or widths[#widths]
        -- Add an extra +2 each step to account for the border width
        win_config.col = win_config.col + sign * (prev_win_width + 2)
    end

    win_config.height = depth_offset == 0 and 25 or 20
    win_config.row = math.ceil(0.5 * (vim.o.lines - win_config.height))
    win_config.border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }
    vim.api.nvim_win_set_config(ev.data.win_id, win_config)
end

vim.api.nvim_create_autocmd("User", {pattern = "MiniFilesWindowUpdate", callback=ensure_center_layout})
