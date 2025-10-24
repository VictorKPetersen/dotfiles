return {
    {
        "VictorKPetersen/singular-noir.nvim",
        lazy = false,
        priority = 1000,

        config = function ()
            vim.cmd.colorscheme("singular-noir")
        end
    }
}
