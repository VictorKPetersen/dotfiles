return {
    cmd = { "ty", "server" },
    filetypes = { "python" },
    root_markers = {
        "ty.toml",
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        ".git",
    },

    settings = {
        ty = {
            diagnosticMode = "off",
        }
    }
}
