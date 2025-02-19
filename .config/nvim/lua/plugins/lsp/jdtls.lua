return {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },

    config = function()
        local config = {
            cmd = { vim.fn.stdpath("data") .. "/mason/bin/jdtls" },
            root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
        }

        -- This starts a new client & server,
        -- or attaches to an existing client & server depending on the `root_dir`.
        require("jdtls").start_or_attach(config)

        -- Attatch to each java buffer
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "java" },
            callback = function()
                require("jdtls").start_or_attach(config)
            end,
        })
    end,
}
