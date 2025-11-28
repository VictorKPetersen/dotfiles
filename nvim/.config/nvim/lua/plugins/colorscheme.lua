return {
    {
        'jesseleite/nvim-noirbuddy',
        dependencies = {
            { 'tjdevries/colorbuddy.nvim' }
        },
        lazy = false,
        priority = 1000,
        opts = {
            colors = {
                background = "#050505",
                primary = "#ff8503",
            },

            styles = {
                italic = true,
            }
        },

        config = function(_, opts)
            require("noirbuddy").setup(opts)
            local colorbuddy = require("colorbuddy")

            local colors = colorbuddy.colors
            local Group = colorbuddy.Group
            local groups = colorbuddy.groups
            local styles = colorbuddy.styles

            Group.new("BlinkCmpMenu", colors.primary, colors.background)
            Group.new("BlinkCmpMenuBorder", colors.noir_3, colors.background)

            Group.new("BlinkCmpSignatureHelp", nil, colors.background)
            Group.link("BlinkCmpSignatureHelpBorder", groups.BlinkCmpMenuBorder)
            Group.new("BlinkCmpSignatureHelpActiveParameter", colors.primary, nil, styles.bold)

            Group.link("BlinkCmpDoc", groups.BlinkCmpSignatureHelp)
            Group.link("BlinkCmpDocBorder", groups.BlinkCmpMenuBorder)

            Group.new("BlinkCmpMenuSelection", colors.secondary, colors.noir_7)
            Group.new("BlinkCmpScrollBarThumb", nil, colors.noir_5)
            Group.new("BlinkCmpScrollBarGutter", nil, colors.noir_8)

            Group.new("BlinkCmpLabel", colors.primary, nil)
            Group.new("BlinkCmpLabelDeprecated", colors.noir_4, nil, styles.strikethrough)
            Group.new("BlinkCmpLabelMatch", colors.secondary, nil)
            Group.new("BlinkCmpLabelDetail", colors.noir_4, nil)
            Group.link("BlinkCmpLabelDescription", groups.BlinkCmpLabelDetail)

            Group.new("BlinkCmpKind", colors.secondary, nil)
            Group.new("BlinkCmpSource", colors.noir_5, nil)

            Group.new("BlinkCmpDocSeparator", colors.noir_6, nil)
            Group.new("BlinkCmpDocCursorLine", nil, colors.noir_7)

            Group.new("SnacksPickerDir", colors.noir_5)
            Group.new("SnacksPickerFile", colors.noir_6)

            Group.link("MiniFilesDirectory", groups.SnacksPickerDir)
            Group.link("MiniFilesFile", groups.SnacksPickerFile)
        end
    }
}
