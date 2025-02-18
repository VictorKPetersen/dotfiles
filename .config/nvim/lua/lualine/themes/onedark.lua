local c = require("onedark.colors")
local colors = {
    bg = c.bg0,
    fg = c.fg,
    red = c.red,
    green = c.green,
    yellow = c.yellow,
    blue = c.blue,
    purple = c.purple,
    cyan = c.cyan,
    gray = c.grey,
}

local one_dark = {
    normal = {
        a = { bg = colors.black, fg = colors.red, gui = "bold" },
        b = { bg = colors.black, fg = colors.white, gui = "bold" },
        c = { bg = colors.black, fg = colors.white, gui = "bold" },
        x = { bg = colors.black, fg = colors.green, gui = "bold" },
        y = { bg = colors.black, fg = colors.purple, gui = "bold" },
        z = { bg = colors.black, fg = colors.white, gui = "bold" },
    },

    insert = {
        a = { bg = colors.black, fg = colors.green, gui = "bold" },
    },

    visual = {
        a = { bg = colors.black, fg = colors.blue, gui = "bold" },
    },

    replace = {
        a = { bg = colors.black, fg = colors.purple, gui = "bold" },
    },

    command = {
        a = { bg = colors.black, fg = colors.yellow, gui = "bold" },
    },

    inactive = {
        a = { bg = colors.black, fg = colors.black_bright, gui = "bold" },
    },
}

return one_dark
