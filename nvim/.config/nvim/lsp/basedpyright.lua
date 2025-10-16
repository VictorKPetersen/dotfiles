return {
    cmd = { "basedpyright" },
    fieltypes = { "py" },
    root_markers = { ".git" },

    settings = {
        basedpyright = {
            disableOrganizeImports = true,
            analysis = {
                ignore = { "*", },
            },

        }
    }
}
