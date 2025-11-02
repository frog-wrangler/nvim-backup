return {
    "OXY2DEV/markview.nvim",
    dependencies = {
        "catppuccin/nvim",
        "Saghen/blink.cmp",
    },
    lazy = true,
    priority = 49,
    config = function ()
        local presets = require("markview.presets")
        vim.g.markview_blink_loaded = true

        require("markview").setup({
            markdown = {
                headings = presets.headings.arrowed,
                horizontal_rules = presets.dashed,
                tables = presets.rounded
            },
            preview = {
                modes = { "i", "n", "no", "c" },
                hybrid_modes = { "i" },
                linewise_hybrid_mode = true,
            },
        })
    end
}
